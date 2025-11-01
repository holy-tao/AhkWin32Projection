#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/dbt/ns-dbt-dev_broadcast_port_a
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 * @charset ANSI
 */
class DEV_BROADCAST_PORT_A extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dbcp_size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dbcp_devicetype {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dbcp_reserved {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {String}
     */
    dbcp_name {
        get => StrGet(this.ptr + 12, 0, "UTF-8")
        set => StrPut(value, this.ptr + 12, 0, "UTF-8")
    }
}
