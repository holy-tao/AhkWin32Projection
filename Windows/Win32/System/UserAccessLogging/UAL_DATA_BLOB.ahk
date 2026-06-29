#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Networking\WinSock\ADDRESS_FAMILY.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_STORAGE.ahk

/**
 * Specifies information about a User Access Logging (UAL) session.
 * @see https://learn.microsoft.com/windows/win32/api/ual/ns-ual-ual_data_blob
 * @namespace Windows.Win32.System.UserAccessLogging
 */
class UAL_DATA_BLOB extends Win32Struct {
    static sizeof => 688

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
     * @type {Guid}
     */
    RoleGuid {
        get {
            if(!this.HasProp("__RoleGuid"))
                this.__RoleGuid := Guid(4, this)
            return this.__RoleGuid
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies a tenant of a hosted environment. This can be used to differentiate client tenants when more than one tenant uses the same host service.
     * @type {Guid}
     */
    TenantId {
        get {
            if(!this.HasProp("__TenantId"))
                this.__TenantId := Guid(20, this)
            return this.__TenantId
        }
    }

    /**
     * The IP address of the client that accompanies the UAL payload from installed roles and products.
     * @type {SOCKADDR_STORAGE}
     */
    Address {
        get {
            if(!this.HasProp("__Address"))
                this.__Address := SOCKADDR_STORAGE(40, this)
            return this.__Address
        }
    }

    /**
     * The name of the client user that accompanies the UAL payload from installed roles and products..
     * @type {String}
     */
    UserName {
        get => StrGet(this.ptr + 168, 259, "UTF-16")
        set => StrPut(value, this.ptr + 168, 259, "UTF-16")
    }
}
