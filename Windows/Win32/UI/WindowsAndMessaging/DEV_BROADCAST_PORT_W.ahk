#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a modem, serial, or parallel port. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The dbt.h header defines DEV_BROADCAST_PORT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/dbt/ns-dbt-dev_broadcast_port_w
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 * @charset Unicode
 */
class DEV_BROADCAST_PORT_W extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The size of this structure, in bytes. This is the size of the members plus the actual length of the 
     *       <b>dbcp_name</b> string (the null character is accounted for by the declaration of 
     *       <b>dbcp_name</b> as a one-character array.)
     * @type {Integer}
     */
    dbcp_size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Set to <b>DBT_DEVTYP_PORT</b>.
     * @type {Integer}
     */
    dbcp_devicetype {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved; do not use.
     * @type {Integer}
     */
    dbcp_reserved {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A null-terminated string specifying the friendly name of the port or the device connected to the port. 
     *       Friendly names are intended to help the user quickly and accurately identify the device—for example, 
     *       "COM1" and "Standard 28800 bps Modem" are considered friendly names.
     * @type {String}
     */
    dbcp_name {
        get => StrGet(this.ptr + 12, 0, "UTF-16")
        set => StrPut(value, this.ptr + 12, 0, "UTF-16")
    }
}
