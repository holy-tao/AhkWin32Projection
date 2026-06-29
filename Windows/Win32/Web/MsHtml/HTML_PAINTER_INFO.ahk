#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct HTML_PAINTER_INFO {
    #StructPack 4

    lFlags : Int32

    lZOrder : Int32

    iidDrawObject : Guid

    rcExpand : RECT

}
