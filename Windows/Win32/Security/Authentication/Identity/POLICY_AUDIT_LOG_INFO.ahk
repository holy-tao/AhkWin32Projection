#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class POLICY_AUDIT_LOG_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    AuditLogPercentFull {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MaximumLogSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    AuditRetentionPeriod {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {BOOLEAN}
     */
    AuditLogFullShutdownInProgress{
        get {
            if(!this.HasProp("__AuditLogFullShutdownInProgress"))
                this.__AuditLogFullShutdownInProgress := BOOLEAN(this.ptr + 16)
            return this.__AuditLogFullShutdownInProgress
        }
    }

    /**
     * @type {Integer}
     */
    TimeToShutdown {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    NextAuditRecordId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
