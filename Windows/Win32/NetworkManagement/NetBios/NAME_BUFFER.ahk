#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NAME_BUFFER structure contains information about a local network name. One or more NAME_BUFFER structures follows an ADAPTER_STATUS structure when an application specifies the NCBASTAT command in the ncb_command member of the NCB structure.
 * @see https://learn.microsoft.com/windows/win32/api/nb30/ns-nb30-name_buffer
 * @namespace Windows.Win32.NetworkManagement.NetBios
 * @version v4.0.30319
 */
class NAME_BUFFER extends Win32Struct
{
    static sizeof => 18

    static packingSize => 1

    /**
     * Specifies the local network name. This value is in the <b>ncb_name</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-ncb">NCB</a> structure.
     * @type {Array<Byte>}
     */
    name{
        get {
            if(!this.HasProp("__nameProxyArray"))
                this.__nameProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__nameProxyArray
        }
    }

    /**
     * Specifies the number for the local network name. This value is in the <b>ncb_num</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-ncb">NCB</a> structure.
     * @type {Integer}
     */
    name_num {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    name_flags {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }
}
