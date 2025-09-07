#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
     * @type {PWSTR}
     */
    ui0_local{
        get {
            if(!this.HasProp("__ui0_local"))
                this.__ui0_local := PWSTR(this.ptr + 0)
            return this.__ui0_local
        }
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
     * @type {PWSTR}
     */
    ui0_remote{
        get {
            if(!this.HasProp("__ui0_remote"))
                this.__ui0_remote := PWSTR(this.ptr + 8)
            return this.__ui0_remote
        }
    }
}
