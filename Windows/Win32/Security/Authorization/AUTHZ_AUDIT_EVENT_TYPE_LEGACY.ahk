#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUTHZ_AUDIT_EVENT_TYPE_LEGACY {
    #StructPack 2

    CategoryId : UInt16

    AuditId : UInt16

    ParameterCount : UInt16

}
