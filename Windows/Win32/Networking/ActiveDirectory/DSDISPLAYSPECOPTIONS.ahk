#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to supply data to a context menu or property page extension about the display specifiers used.
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/ns-dsclient-dsdisplayspecoptions
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DSDISPLAYSPECOPTIONS extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * The size of the structure for versioning purposes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    offsetAttribPrefix {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

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
     * @type {Integer}
     */
    offsetUserName {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

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
     * @type {Integer}
     */
    offsetPassword {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

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
     * @type {Integer}
     */
    offsetServer {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

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
     * @type {Integer}
     */
    offsetServerConfigPath {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
