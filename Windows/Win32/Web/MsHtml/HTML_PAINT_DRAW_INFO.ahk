#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Graphics\Gdi\HRGN.ahk" { HRGN }
#Import ".\HTML_PAINT_XFORM.ahk" { HTML_PAINT_XFORM }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct HTML_PAINT_DRAW_INFO {
    #StructPack 8

    rcViewport : RECT

    hrgnUpdate : HRGN

    xform : HTML_PAINT_XFORM

}
