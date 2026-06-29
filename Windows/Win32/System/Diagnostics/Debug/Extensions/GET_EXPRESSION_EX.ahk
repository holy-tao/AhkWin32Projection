#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct GET_EXPRESSION_EX {
    #StructPack 8

    Expression : PSTR

    Remainder : PSTR

    Value : Int64

}
