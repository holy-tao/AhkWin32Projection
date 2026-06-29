#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AUTHZ_AUDIT_EVENT_TYPE_UNION.ahk" { AUTHZ_AUDIT_EVENT_TYPE_UNION }
#Import "..\..\Foundation\LUID.ahk" { LUID }
#Import ".\AUTHZ_AUDIT_EVENT_TYPE_LEGACY.ahk" { AUTHZ_AUDIT_EVENT_TYPE_LEGACY }

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUTHZ_AUDIT_EVENT_TYPE_OLD {
    #StructPack 8

    Version : UInt32

    dwFlags : UInt32

    RefCount : Int32

    hAudit : IntPtr

    LinkId : LUID

    u : AUTHZ_AUDIT_EVENT_TYPE_UNION

}
