#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\SID_AND_ATTRIBUTES.ahk
#Include ..\..\TOKEN_USER.ahk

/**
 * Contains information an authentication package can place in a Version 2 Windows token object and has superceded LSA_TOKEN_INFORMATION_V1.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-lsa_token_information_v1
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_TOKEN_INFORMATION_V1 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Time at which the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> becomes not valid. Use a value in the distant future if the context never expires. The current version of the operating system kernel does not enforce this expiration time.
     * @type {Integer}
     */
    ExpirationTime {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_user">TOKEN_USER</a> structure that contains the SID of the user logging on. The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> SID value is in a separately allocated block of memory.
     * @type {TOKEN_USER}
     */
    User{
        get {
            if(!this.HasProp("__User"))
                this.__User := TOKEN_USER(this.ptr + 8)
            return this.__User
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that contains the SIDs of groups the user is a member of. This should not include WORLD or other system-defined and system-assigned SIDs. These will be added automatically by the LSA. 
     * 
     * 
     * 
     * 
     * Each SID is expected to be in a separately allocated block of memory. The <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure is also expected to be in a separately allocated block of memory. All of these memory blocks should be allocated by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_private_heap">AllocatePrivateHeap</a> function.
     * @type {Pointer<TOKEN_GROUPS>}
     */
    Groups {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_primary_group">TOKEN_PRIMARY_GROUP</a> structure that is used to establish the primary group of the user. This value does not have to correspond to one of the SIDs assigned to the user. 
     * 
     * 
     * 
     * 
     * The SID pointed to by this structure is expected to be in a separately allocated block of memory.
     * 
     * This member is mandatory and must be filled in.
     * @type {Pointer<Void>}
     */
    PrimaryGroup {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_privileges">TOKEN_PRIVILEGES</a> structure that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privileges</a> assigned to the user. This list of privileges will be augmented or overridden by any local security policy assigned privileges. 
     * 
     * 
     * 
     * 
     * Each privilege is expected to be in a separately allocated block of memory. The <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_privileges">TOKEN_PRIVILEGES</a> structure is also expected to be in a separately allocated block of memory.
     * 
     * If there are no privileges to assign to the user, this member may be set to <b>NULL</b>.
     * @type {Pointer<TOKEN_PRIVILEGES>}
     */
    Privileges {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_owner">TOKEN_OWNER</a> structure. This member may be used to establish an explicit default owner. Normally, the user ID is used as the default owner. If another value is desired, it must be specified here. 
     * 
     * 
     * 
     * 
     * The <b>Owner.Sid</b> member may be set to <b>NULL</b> to indicate there is no alternate default owner value.
     * @type {Pointer<Void>}
     */
    Owner {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_default_dacl">TOKEN_DEFAULT_DACL</a> structure. This member may be used to establish a default protection for the user. If no value is provided, a default protection that grants everyone all access will be established. 
     * 
     * 
     * 
     * 
     * The <b>DefaultDacl.DefaultDacl</b> member may be set to <b>NULL</b> to indicate there is no default protection.
     * @type {Pointer<TypeHandle>}
     */
    DefaultDacl {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
