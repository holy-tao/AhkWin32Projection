#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\SECURITY_IMPERSONATION_LEVEL.ahk" { SECURITY_IMPERSONATION_LEVEL }

/**
 * Contains information used to support client impersonation.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-security_quality_of_service
 * @namespace Windows.Win32.Security
 */
export default struct SECURITY_QUALITY_OF_SERVICE {
    #StructPack 4

    /**
     * Specifies the size, in bytes, of this structure.
     */
    Length : UInt32

    /**
     * Specifies the information given to the server about the client, and how the server may represent, or impersonate, the client. Security impersonation levels govern the degree to which a server process can act on behalf of a client <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">process</a>. This member is a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-security_impersonation_level">SECURITY_IMPERSONATION_LEVEL</a> enumeration type value.
     */
    ImpersonationLevel : SECURITY_IMPERSONATION_LEVEL

    /**
     * Specifies whether the server is to be given a snapshot of the client's <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> (called static tracking), or is to be continually updated to track changes to the client's security context (called dynamic tracking). The SECURITY_STATIC_TRACKING value  specifies static tracking, and the SECURITY_DYNAMIC_TRACKING value specifies dynamic tracking. Not all communications mechanisms support dynamic tracking; those that do not will default to static tracking.
     */
    ContextTrackingMode : Int8

    /**
     * Specifies whether the server may enable or disable <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privileges</a> and groups that the client's security context may include.
     */
    EffectiveOnly : BOOLEAN

}
