#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The NET_DISPLAY_MACHINE structure contains information that an account manager can access to determine information about computers and their attributes.
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-net_display_machine
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NET_DISPLAY_MACHINE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the name of the computer to access.
     * @type {PWSTR}
     */
    usri2_name{
        get {
            if(!this.HasProp("__usri2_name"))
                this.__usri2_name := PWSTR(this.ptr + 0)
            return this.__usri2_name
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains a comment associated with the computer. This string can be a null string, or it can have any number of characters before the terminating null character.
     * @type {PWSTR}
     */
    usri2_comment{
        get {
            if(!this.HasProp("__usri2_comment"))
                this.__usri2_comment := PWSTR(this.ptr + 8)
            return this.__usri2_comment
        }
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    usri2_flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The relative identifier (RID) of the computer. The relative identifier is determined by the accounts database when the computer is defined. For more information about RIDS, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/sid-components">SID Components</a>.
     * @type {Integer}
     */
    usri2_user_id {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The index of the last entry returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netquerydisplayinformation">NetQueryDisplayInformation</a> function. Pass this value as the <i>Index</i> parameter to 
     * <b>NetQueryDisplayInformation</b> to return the next logical entry. Note that you should not use the value of this member for any purpose except to retrieve more data with additional calls to 
     * <b>NetQueryDisplayInformation</b>.
     * @type {Integer}
     */
    usri2_next_index {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
