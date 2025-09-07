#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the identification number of a connection, number of open files, connection time, number of users on the connection, and the type of connection.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-connection_info_1
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CONNECTION_INFO_1 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Specifies a connection identification number.
     * @type {Integer}
     */
    coni1_id {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A combination of values that specify the type of connection made from the local device name to the shared resource.
     * @type {Integer}
     */
    coni1_type {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the number of files currently open as a result of the connection.
     * @type {Integer}
     */
    coni1_num_opens {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the number of users on the connection.
     * @type {Integer}
     */
    coni1_num_users {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies the number of seconds that the connection has been established.
     * @type {Integer}
     */
    coni1_time {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to a string. If the server sharing the resource is running with user-level security, the <b>coni1_username</b> member describes which user made the connection. If the server is running with share-level security, <b>coni1_username</b> describes which computer (computername) made the connection. Note that Windows does not support share-level security.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @type {Pointer<Ptr>}
     */
    coni1_username {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a string that specifies either the share name of the server's shared resource or the computername of the client. The value of this member depends on which name was specified as the <i>qualifier</i> parameter to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netconnectionenum">NetConnectionEnum</a> function. The name not specified in the <i>qualifier</i> parameter to 
     * <b>NetConnectionEnum</b> is automatically supplied to <b>coni1_netname</b>.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @type {Pointer<Ptr>}
     */
    coni1_netname {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
