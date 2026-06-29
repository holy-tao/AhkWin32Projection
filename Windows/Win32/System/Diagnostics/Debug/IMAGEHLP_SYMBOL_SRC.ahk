#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGEHLP_SYMBOL_SRC {
    #StructPack 4

    sizeofstruct : UInt32

    type : UInt32

    file : CHAR[260]

}
