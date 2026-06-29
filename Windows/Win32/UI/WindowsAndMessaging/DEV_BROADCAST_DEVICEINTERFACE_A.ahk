#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains information about a class of devices. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The dbt.h header defines DEV_BROADCAST_DEVICEINTERFACE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/dbt/ns-dbt-dev_broadcast_deviceinterface_a
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @charset ANSI
 */
export default struct DEV_BROADCAST_DEVICEINTERFACE_A {
    #StructPack 4

    /**
     * The size of this structure, in bytes. This is the size of the members plus the actual length of the 
     *       <b>dbcc_name</b> string (the null character is accounted for by the declaration of 
     *       <b>dbcc_name</b> as a one-character array.)
     */
    dbcc_size : UInt32

    /**
     * Set to <b>DBT_DEVTYP_DEVICEINTERFACE</b>.
     */
    dbcc_devicetype : UInt32

    /**
     * Reserved; do not use.
     */
    dbcc_reserved : UInt32

    /**
     * The GUID for the interface device class.
     */
    dbcc_classguid : Guid

    /**
     * A null-terminated string that specifies the name of the device.
     * 
     * When this structure is returned to a window through the 
     *        <a href="https://docs.microsoft.com/windows/desktop/DevIO/wm-devicechange">WM_DEVICECHANGE</a> message, the 
     *        <b>dbcc_name</b> string is converted to ANSI as appropriate. Services always receive a 
     *        Unicode string, whether they call 
     *        <b>RegisterDeviceNotificationW</b> 
     *        or 
     *        <b>RegisterDeviceNotificationA</b>.
     */
    dbcc_name : CHAR[1]

}
