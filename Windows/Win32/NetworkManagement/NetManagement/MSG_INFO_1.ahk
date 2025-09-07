#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The MSG_INFO_1 structure specifies a message alias. This structure exists only for compatibility. Message forwarding is not supported.
 * @see https://learn.microsoft.com/windows/win32/api/lmmsg/ns-lmmsg-msg_info_1
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class MSG_INFO_1 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Pointer to a Unicode string that specifies the alias to which the message is to be sent. The constant LEN specifies the maximum number of characters in the string.
     * @type {PWSTR}
     */
    msgi1_name{
        get {
            if(!this.HasProp("__msgi1_name"))
                this.__msgi1_name := PWSTR(this.ptr + 0)
            return this.__msgi1_name
        }
    }

    /**
     * This member must be zero.
     * @type {Integer}
     */
    msgi1_forward_flag {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * This member must be <b>NULL</b>.
     * @type {PWSTR}
     */
    msgi1_forward{
        get {
            if(!this.HasProp("__msgi1_forward"))
                this.__msgi1_forward := PWSTR(this.ptr + 16)
            return this.__msgi1_forward
        }
    }
}
