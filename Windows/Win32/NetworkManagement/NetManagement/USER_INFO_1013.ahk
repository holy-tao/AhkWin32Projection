#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The USER_INFO_1013 structure contains reserved information for network accounts. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_1013
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_INFO_1013 {
    #StructPack 8

    /**
     * Pointer to a Unicode string that is reserved for use by applications. The string can be a null string, or it can have any number of characters before the terminating null character. Microsoft products use this member to store user configuration information. Do not modify this information. 
     * 
     * 
     * 
     * 
     * The system components that use this member are services for Macintosh, file and print services for NetWare, and the Remote Access Server (RAS).
     */
    usri1013_parms : PWSTR

}
