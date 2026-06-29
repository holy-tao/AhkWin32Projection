#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @charset Unicode
 */
export default struct JOYCAPS2W {
    #StructPack 4

    wMid : UInt16

    wPid : UInt16

    szPname : WCHAR[32]

    wXmin : UInt32

    wXmax : UInt32

    wYmin : UInt32

    wYmax : UInt32

    wZmin : UInt32

    wZmax : UInt32

    wNumButtons : UInt32

    wPeriodMin : UInt32

    wPeriodMax : UInt32

    wRmin : UInt32

    wRmax : UInt32

    wUmin : UInt32

    wUmax : UInt32

    wVmin : UInt32

    wVmax : UInt32

    wCaps : UInt32

    wMaxAxes : UInt32

    wNumAxes : UInt32

    wMaxButtons : UInt32

    szRegKey : WCHAR[32]

    szOEMVxD : WCHAR[260]

    ManufacturerGuid : Guid

    ProductGuid : Guid

    NameGuid : Guid

}
