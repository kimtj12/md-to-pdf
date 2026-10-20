-- ```mermaid 코드 블록을 mermaid.js가 읽는 <pre class="mermaid">로 변환
function CodeBlock(el)
  if el.classes[1] == "mermaid" then
    local text = el.text:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")
    return pandoc.RawBlock("html", '<pre class="mermaid">' .. text .. "</pre>")
  end
end
