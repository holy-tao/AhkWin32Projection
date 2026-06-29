#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Media.Audio
 * @charset Unicode
 */
export default struct AUXCAPS2W {
    #StructPack 4

    wMid : UInt16

    wPid : UInt16

    vDriverVersion : UInt32

    szPname : WCHAR[32]

    wTechnology : UInt16

    wReserved1 : UInt16

    dwSupport : UInt32

    ManufacturerGuid : Guid

    ProductGuid : Guid

    NameGuid : Guid

}
