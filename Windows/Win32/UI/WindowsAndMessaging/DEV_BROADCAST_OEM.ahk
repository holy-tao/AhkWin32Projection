#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a OEM-defined device type.
 * @see https://learn.microsoft.com/windows/win32/api/dbt/ns-dbt-dev_broadcast_oem
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct DEV_BROADCAST_OEM {
    #StructPack 4

    /**
     * The size of this structure, in bytes.
     */
    dbco_size : UInt32

    /**
     * Set to <b>DBT_DEVTYP_OEM</b>.
     */
    dbco_devicetype : UInt32

    /**
     * Reserved; do not use.
     */
    dbco_reserved : UInt32

    /**
     * The OEM-specific identifier for the device.
     */
    dbco_identifier : UInt32

    /**
     * The OEM-specific function value. Possible values depend on the device.
     */
    dbco_suppfunc : UInt32

}
