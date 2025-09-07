#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\AUTHZ_AUDIT_EVENT_TYPE_LEGACY.ahk

/**
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class AUTHZ_AUDIT_EVENT_TYPE_UNION extends Win32Struct
{
    static sizeof => 6

    static packingSize => 6

    /**
     * @type {AUTHZ_AUDIT_EVENT_TYPE_LEGACY}
     */
    Legacy{
        get {
            if(!this.HasProp("__Legacy"))
                this.__Legacy := AUTHZ_AUDIT_EVENT_TYPE_LEGACY(this.ptr + 0)
            return this.__Legacy
        }
    }
}
