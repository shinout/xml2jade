xmldoc = require "xmldoc"
read = require("fs").readFileSync.bind("fs")
spaces = (" " for i in [0..100]).join(" ")

run = (filename)->
  xml = read filename, "utf8"
  doc = new xmldoc.XmlDocument xml
  parse doc, 0

parse = (node, hier=0)->
  ret = ""
  id  = if node.attr.id? then "##{node.attr.id}" else ""
  cls = if node.attr.class? then ".#{node.attr.class.split(" ").join(".")}" else ""

  attrs = []
  for k,v of node.attr
    continue if k is "id" or k is "class"
    attrs.push "#{k}=\"#{v}\""
  attrs = if attrs.length then "(#{attrs.join(", ")})" else ""

  txt = node.val.trim()
  txt = " " + txt if txt

  ret +=  spaces.slice(0,hier) + node.name + id + cls + attrs + txt + "\n"
  if node.children.length
    ret += parse child, hier + 2 for child in node.children
  return ret

module.exports =
  run: run
  parse: parse
