#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USE_INFO_0 structure contains the name of a shared resource and the local device redirected to it.
 * @see https://learn.microsoft.com/windows/win32/api/lmuse/ns-lmuse-use_info_0
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USE_INFO_0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to a Unicode string that specifies the local device name (for example, drive E or LPT1) being redirected to the shared resource. The constant DEVLEN specifies the maximum number of characters in the string.
     * @type {Pointer<PWSTR>}
     */
    ui0_local {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

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
     * @type {Pointer<PWSTR>}
     */
    ui0_remote {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
