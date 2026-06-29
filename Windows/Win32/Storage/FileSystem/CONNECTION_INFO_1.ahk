#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SHARE_TYPE.ahk" { SHARE_TYPE }

/**
 * Contains the identification number of a connection, number of open files, connection time, number of users on the connection, and the type of connection.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-connection_info_1
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CONNECTION_INFO_1 {
    #StructPack 8

    /**
     * Specifies a connection identification number.
     */
    coni1_id : UInt32

    /**
     * A combination of values that specify the type of connection made from the local device name to the shared resource.
     */
    coni1_type : SHARE_TYPE

    /**
     * Specifies the number of files currently open as a result of the connection.
     */
    coni1_num_opens : UInt32

    /**
     * Specifies the number of users on the connection.
     */
    coni1_num_users : UInt32

    /**
     * Specifies the number of seconds that the connection has been established.
     */
    coni1_time : UInt32

    /**
     * Pointer to a string. If the server sharing the resource is running with user-level security, the <b>coni1_username</b> member describes which user made the connection. If the server is running with share-level security, <b>coni1_username</b> describes which computer (computername) made the connection. Note that Windows does not support share-level security.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     */
    coni1_username : PWSTR

    /**
     * Pointer to a string that specifies either the share name of the server's shared resource or the computername of the client. The value of this member depends on which name was specified as the <i>qualifier</i> parameter to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netconnectionenum">NetConnectionEnum</a> function. The name not specified in the <i>qualifier</i> parameter to 
     * <b>NetConnectionEnum</b> is automatically supplied to <b>coni1_netname</b>.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     */
    coni1_netname : PWSTR

}
