#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a OEM-defined device type.
 * @see https://learn.microsoft.com/windows/win32/api/dbt/ns-dbt-dev_broadcast_oem
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class DEV_BROADCAST_OEM extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The size of this structure, in bytes.
     * @type {Integer}
     */
    dbco_size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Set to <b>DBT_DEVTYP_OEM</b>.
     * @type {Integer}
     */
    dbco_devicetype {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved; do not use.
     * @type {Integer}
     */
    dbco_reserved {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The OEM-specific identifier for the device.
     * @type {Integer}
     */
    dbco_identifier {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The OEM-specific function value. Possible values depend on the device.
     * @type {Integer}
     */
    dbco_suppfunc {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
