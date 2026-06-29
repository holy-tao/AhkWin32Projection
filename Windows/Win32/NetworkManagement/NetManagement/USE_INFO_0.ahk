#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The USE_INFO_0 structure contains the name of a shared resource and the local device redirected to it.
 * @see https://learn.microsoft.com/windows/win32/api/lmuse/ns-lmuse-use_info_0
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USE_INFO_0 {
    #StructPack 8

    /**
     * Pointer to a Unicode string that specifies the local device name (for example, drive E or LPT1) being redirected to the shared resource. The constant DEVLEN specifies the maximum number of characters in the string.
     */
    ui0_local : PWSTR

    /**
     * Pointer to a Unicode string that specifies the share name of the remote resource being accessed. The string is in the form: 
     * 
     * 
     * 
     * 
     * 
     * ``` syntax
     * \\servername\sharename
     * 
     * ```
     */
    ui0_remote : PWSTR

}
