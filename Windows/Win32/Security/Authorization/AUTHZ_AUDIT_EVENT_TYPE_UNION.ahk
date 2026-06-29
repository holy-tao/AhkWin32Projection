#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AUTHZ_AUDIT_EVENT_TYPE_LEGACY.ahk" { AUTHZ_AUDIT_EVENT_TYPE_LEGACY }

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUTHZ_AUDIT_EVENT_TYPE_UNION {
    #StructPack 2

    Legacy : AUTHZ_AUDIT_EVENT_TYPE_LEGACY

}
