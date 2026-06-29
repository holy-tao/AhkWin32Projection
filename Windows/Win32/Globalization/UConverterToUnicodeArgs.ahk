#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UConverter.ahk" { UConverter }
#Import "..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UConverterToUnicodeArgs {
    #StructPack 8

    size : UInt16

    flush : Int8

    converter : UConverter.Ptr

    source : PSTR

    sourceLimit : PSTR

    target : IntPtr

    targetLimit : IntPtr

    offsets : IntPtr

}
