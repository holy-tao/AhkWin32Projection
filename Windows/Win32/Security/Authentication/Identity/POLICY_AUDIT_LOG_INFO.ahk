#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct POLICY_AUDIT_LOG_INFO {
    #StructPack 8

    AuditLogPercentFull : UInt32

    MaximumLogSize : UInt32

    AuditRetentionPeriod : Int64

    AuditLogFullShutdownInProgress : BOOLEAN

    TimeToShutdown : Int64

    NextAuditRecordId : UInt32

}
