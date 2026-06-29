#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\SOCKADDR_STORAGE.ahk" { SOCKADDR_STORAGE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Networking\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Specifies information about a User Access Logging (UAL) session.
 * @see https://learn.microsoft.com/windows/win32/api/ual/ns-ual-ual_data_blob
 * @namespace Windows.Win32.System.UserAccessLogging
 */
export default struct UAL_DATA_BLOB {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    Size : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that represents the role or minor product name associated with a UAL session.
     */
    RoleGuid : Guid

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies a tenant of a hosted environment. This can be used to differentiate client tenants when more than one tenant uses the same host service.
     */
    TenantId : Guid

    /**
     * The IP address of the client that accompanies the UAL payload from installed roles and products.
     */
    Address : SOCKADDR_STORAGE

    /**
     * The name of the client user that accompanies the UAL payload from installed roles and products..
     */
    UserName : WCHAR[260]

}
