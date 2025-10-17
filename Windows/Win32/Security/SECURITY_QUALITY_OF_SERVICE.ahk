#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains information used to support client impersonation.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-security_quality_of_service
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class SECURITY_QUALITY_OF_SERVICE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Specifies the size, in bytes, of this structure.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the information given to the server about the client, and how the server may represent, or impersonate, the client. Security impersonation levels govern the degree to which a server process can act on behalf of a client <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">process</a>. This member is a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-security_impersonation_level">SECURITY_IMPERSONATION_LEVEL</a> enumeration type value.
     * @type {Integer}
     */
    ImpersonationLevel {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Specifies whether the server is to be given a snapshot of the client's <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> (called static tracking), or is to be continually updated to track changes to the client's security context (called dynamic tracking). The SECURITY_STATIC_TRACKING value  specifies static tracking, and the SECURITY_DYNAMIC_TRACKING value specifies dynamic tracking. Not all communications mechanisms support dynamic tracking; those that do not will default to static tracking.
     * @type {Integer}
     */
    ContextTrackingMode {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * Specifies whether the server may enable or disable <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privileges</a> and groups that the client's security context may include.
     * @type {BOOLEAN}
     */
    EffectiveOnly {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }
}
