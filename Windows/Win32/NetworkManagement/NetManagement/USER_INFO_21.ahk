#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_INFO_21 structure contains a one-way encrypted LAN Manager 2.x-compatible password.
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-user_info_21
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_INFO_21 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * Specifies a one-way encrypted LAN Manager 2.<i>x</i>-compatible password.
     * @type {Array<Byte>}
     */
    usri21_password{
        get {
            if(!this.HasProp("__usri21_passwordProxyArray"))
                this.__usri21_passwordProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__usri21_passwordProxyArray
        }
    }
}
