#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct SSERRORINFO {
    #StructPack 8

    pwszMessage : PWSTR

    pwszServer : PWSTR

    pwszProcedure : PWSTR

    lNative : Int32

    bState : Int8

    bClass : Int8

    wLineNumber : UInt16

}
