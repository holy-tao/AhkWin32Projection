#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Kernel
 */
export default struct CSTRING {
    #StructPack 8

    Length : UInt16

    MaximumLength : UInt16

    Buffer : PSTR

}
