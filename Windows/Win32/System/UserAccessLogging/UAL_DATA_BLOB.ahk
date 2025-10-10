#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_STORAGE.ahk

/**
 * Specifies information about a User Access Logging (UAL) session.
 * @see https://docs.microsoft.com/windows/win32/api//ual/ns-ual-ual_data_blob
 * @namespace Windows.Win32.System.UserAccessLogging
 * @version v4.0.30319
 */
class UAL_DATA_BLOB extends Win32Struct
{
    static sizeof => 792

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that represents the role or minor product name associated with a UAL session.
     * @type {Pointer<Guid>}
     */
    RoleGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies a tenant of a hosted environment. This can be used to differentiate client tenants when more than one tenant uses the same host service.
     * @type {Pointer<Guid>}
     */
    TenantId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The IP address of the client that accompanies the UAL payload from installed roles and products.
     * @type {SOCKADDR_STORAGE}
     */
    Address{
        get {
            if(!this.HasProp("__Address"))
                this.__Address := SOCKADDR_STORAGE(this.ptr + 24)
            return this.__Address
        }
    }

    /**
     * The name of the client user that accompanies the UAL payload from installed roles and products..
     * @type {String}
     */
    UserName {
        get => StrGet(this.ptr + 272, 259, "UTF-16")
        set => StrPut(value, this.ptr + 272, 259, "UTF-16")
    }
}
