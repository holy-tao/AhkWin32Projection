#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\AUTHZ_AUDIT_EVENT_TYPE_LEGACY.ahk
#Include .\AUTHZ_AUDIT_EVENT_TYPE_UNION.ahk

/**
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class AUTHZ_AUDIT_EVENT_TYPE_OLD extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    RefCount {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    hAudit {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {LUID}
     */
    LinkId{
        get {
            if(!this.HasProp("__LinkId"))
                this.__LinkId := LUID(24, this)
            return this.__LinkId
        }
    }

    /**
     * @type {AUTHZ_AUDIT_EVENT_TYPE_UNION}
     */
    u{
        get {
            if(!this.HasProp("__u"))
                this.__u := AUTHZ_AUDIT_EVENT_TYPE_UNION(32, this)
            return this.__u
        }
    }
}
