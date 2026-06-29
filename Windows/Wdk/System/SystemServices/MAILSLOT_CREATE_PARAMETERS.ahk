#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct MAILSLOT_CREATE_PARAMETERS {
    #StructPack 8

    MailslotQuota : UInt32

    MaximumMessageSize : UInt32

    ReadTimeout : Int64

    TimeoutSpecified : BOOLEAN

}
