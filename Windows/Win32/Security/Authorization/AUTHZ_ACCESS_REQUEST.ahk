#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\OBJECT_TYPE_LIST.ahk" { OBJECT_TYPE_LIST }
#Import "..\PSID.ahk" { PSID }

/**
 * Defines an access check request.
 * @see https://learn.microsoft.com/windows/win32/api/authz/ns-authz-authz_access_request
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUTHZ_ACCESS_REQUEST {
    #StructPack 8

    /**
     * The type of access to test for.
     */
    DesiredAccess : UInt32

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) to use for the principal self SID in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL).
     */
    PrincipalSelfSid : PSID

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-object_type_list">OBJECT_TYPE_LIST</a> structures in the object tree for the object. Set to <b>NULL</b> unless the application checks access at the property level.
     */
    ObjectTypeList : OBJECT_TYPE_LIST.Ptr

    /**
     * The number of elements in the <i>ObjectTypeList</i> array. This member is necessary only if the application checks access at the property level.
     */
    ObjectTypeListLength : UInt32

    /**
     * A pointer to memory to pass to <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzaccesscheckcallback">AuthzAccessCheckCallback</a> when checking callback <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entries</a> (ACEs).
     */
    OptionalArguments : IntPtr

}
