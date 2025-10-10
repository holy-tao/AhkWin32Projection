#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_INFO_1013 structure contains reserved information for network accounts. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-user_info_1013
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_INFO_1013 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a Unicode string that is reserved for use by applications. The string can be a null string, or it can have any number of characters before the terminating null character. Microsoft products use this member to store user configuration information. Do not modify this information. 
     * 
     * 
     * 
     * 
     * The system components that use this member are services for Macintosh, file and print services for NetWare, and the Remote Access Server (RAS).
     * @type {Pointer<Char>}
     */
    usri1013_parms {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
