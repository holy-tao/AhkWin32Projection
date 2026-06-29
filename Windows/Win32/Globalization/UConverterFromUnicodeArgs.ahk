#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UConverter.ahk" { UConverter }
#Import "..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UConverterFromUnicodeArgs {
    #StructPack 8

    size : UInt16

    flush : Int8

    converter : UConverter.Ptr

    source : IntPtr

    sourceLimit : IntPtr

    target : PSTR

    targetLimit : PSTR

    offsets : IntPtr

}
