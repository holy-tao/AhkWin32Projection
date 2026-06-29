#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct GET_SET_SYMPATH {
    #StructPack 8

    Args : PSTR

    Result : PSTR

    Length : Int32

}
