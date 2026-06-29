#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct ZONEATTRIBUTES {
    #StructPack 4

    cbSize : UInt32 := this.Size

    szDisplayName : WCHAR[260]

    szDescription : WCHAR[200]

    szIconPath : WCHAR[260]

    dwTemplateMinLevel : UInt32

    dwTemplateRecommended : UInt32

    dwTemplateCurrentLevel : UInt32

    dwFlags : UInt32

}
