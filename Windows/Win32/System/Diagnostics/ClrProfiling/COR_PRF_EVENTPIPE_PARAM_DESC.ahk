#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_PRF_EVENTPIPE_PARAM_DESC {
    #StructPack 8

    type : UInt32

    elementType : UInt32

    name : PWSTR

}
