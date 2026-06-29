#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FILE_SFIO_RESERVE_INFORMATION {
    #StructPack 4

    RequestsPerPeriod : UInt32

    Period : UInt32

    RetryFailures : BOOLEAN

    Discardable : BOOLEAN

    RequestSize : UInt32

    NumOutstandingRequests : UInt32

}
