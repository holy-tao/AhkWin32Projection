#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_PRF_EVENTPIPE_PROVIDER_CONFIG {
    #StructPack 8

    providerName : PWSTR

    keywords : Int64

    loggingLevel : UInt32

    filterData : PWSTR

}
