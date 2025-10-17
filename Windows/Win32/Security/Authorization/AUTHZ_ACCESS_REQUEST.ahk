#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines an access check request.
 * @see https://docs.microsoft.com/windows/win32/api//authz/ns-authz-authz_access_request
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class AUTHZ_ACCESS_REQUEST extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The type of access to test for.
     * @type {Integer}
     */
    DesiredAccess {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) to use for the principal self SID in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL).
     * @type {PSID}
     */
    PrincipalSelfSid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-object_type_list">OBJECT_TYPE_LIST</a> structures in the object tree for the object. Set to <b>NULL</b> unless the application checks access at the property level.
     * @type {Pointer<OBJECT_TYPE_LIST>}
     */
    ObjectTypeList {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The number of elements in the <i>ObjectTypeList</i> array. This member is necessary only if the application checks access at the property level.
     * @type {Integer}
     */
    ObjectTypeListLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A pointer to memory to pass to <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzaccesscheckcallback">AuthzAccessCheckCallback</a> when checking callback <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entries</a> (ACEs).
     * @type {Pointer<Void>}
     */
    OptionalArguments {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
