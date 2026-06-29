#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about a modem, serial, or parallel port. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The dbt.h header defines DEV_BROADCAST_PORT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/dbt/ns-dbt-dev_broadcast_port_w
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @charset Unicode
 */
export default struct DEV_BROADCAST_PORT_W {
    #StructPack 4

    /**
     * The size of this structure, in bytes. This is the size of the members plus the actual length of the 
     *       <b>dbcp_name</b> string (the null character is accounted for by the declaration of 
     *       <b>dbcp_name</b> as a one-character array.)
     */
    dbcp_size : UInt32

    /**
     * Set to <b>DBT_DEVTYP_PORT</b>.
     */
    dbcp_devicetype : UInt32

    /**
     * Reserved; do not use.
     */
    dbcp_reserved : UInt32

    /**
     * A null-terminated string specifying the friendly name of the port or the device connected to the port. 
     *       Friendly names are intended to help the user quickly and accurately identify the device—for example, 
     *       "COM1" and "Standard 28800 bps Modem" are considered friendly names.
     */
    dbcp_name : WCHAR[1]

}
