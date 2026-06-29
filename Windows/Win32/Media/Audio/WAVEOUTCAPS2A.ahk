#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Media.Audio
 * @charset ANSI
 */
export default struct WAVEOUTCAPS2A {
    #StructPack 4

    wMid : UInt16

    wPid : UInt16

    vDriverVersion : UInt32

    szPname : CHAR[32]

    dwFormats : UInt32

    wChannels : UInt16

    wReserved1 : UInt16

    dwSupport : UInt32

    ManufacturerGuid : Guid

    ProductGuid : Guid

    NameGuid : Guid

}
