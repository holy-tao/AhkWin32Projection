#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used to supply data to a context menu or property page extension about the display specifiers used.
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/ns-dsclient-dsdisplayspecoptions
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DSDISPLAYSPECOPTIONS {
    #StructPack 4

    /**
     * The size of the structure for versioning purposes.
     */
    dwSize : UInt32

    dwFlags : UInt32

    offsetAttribPrefix : UInt32

    /**
     * Contains the offset, in bytes, from the start of the <b>DSDISPLAYSPECOPTIONS</b> structure to a NULL-terminated, Unicode string that contains the name of the user used to authenticate the bind. This member is only valid if <b>dwFlags</b> contains the <b>DSDSOF_HASUSERANDSERVERINFO</b> flag. If this member contains zero, the user name is not included.
     * 
     * The following example shows how to use this member.
     * 
     * 
     * ```cpp
     * pwszUserName = (LPWSTR)((LPBYTE)pdso + 
     *     pdso->offsetUserName);
     * 
     * ```
     */
    offsetUserName : UInt32

    /**
     * Contains the offset, in bytes, from the start of the <b>DSDISPLAYSPECOPTIONS</b> structure to a NULL-terminated, Unicode string that contains the password used to authenticate the bind. This member is only valid if <b>dwFlags</b> contains the <b>DSDSOF_HASUSERANDSERVERINFO</b> flag. If this member contains zero, the password is not included.
     * 
     * The following example shows how to use this member.
     * 
     * 
     * ```cpp
     * pwszPassword = (LPWSTR)((LPBYTE)pdso + 
     *     pdso->offsetPassword);
     * 
     * ```
     */
    offsetPassword : UInt32

    /**
     * Contains the offset, in bytes, from the start of the <b>DSDISPLAYSPECOPTIONS</b> structure to a NULL-terminated, Unicode string that contains the name of the server. This member is only valid if <b>dwFlags</b> contains the <b>DSDSOF_HASUSERANDSERVERINFO</b> flag. If this member contains zero, the server name is not included.
     * 
     * The following example shows how to use this member.
     * 
     * 
     * ```cpp
     * pwszServer = (LPWSTR)((LPBYTE)pdso + 
     *     pdso->offsetServer);
     * 
     * ```
     */
    offsetServer : UInt32

    /**
     * Contains the offset, in bytes, from the start of the <b>DSDISPLAYSPECOPTIONS</b> structure to a NULL-terminated, Unicode string that contains the ADsPath of the server. This member is only valid if <b>dwFlags</b> contains the <b>DSDSOF_HASUSERANDSERVERINFO</b> flag. If this member contains zero, the server path is not included.
     * 
     * The following example shows how to use this member.
     * 
     * 
     * ```cpp
     * pwszServerConfigPath = (LPWSTR)((LPBYTE)pdso + 
     *     pdso->offsetServerConfigPath);
     * 
     * ```
     */
    offsetServerConfigPath : UInt32

}
