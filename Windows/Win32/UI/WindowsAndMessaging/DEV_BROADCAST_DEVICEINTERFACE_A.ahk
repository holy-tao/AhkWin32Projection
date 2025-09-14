#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a class of devices. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The dbt.h header defines DEV_BROADCAST_DEVICEINTERFACE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/dbt/ns-dbt-dev_broadcast_deviceinterface_a
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 * @charset ANSI
 */
class DEV_BROADCAST_DEVICEINTERFACE_A extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size of this structure, in bytes. This is the size of the members plus the actual length of the 
     *       <b>dbcc_name</b> string (the null character is accounted for by the declaration of 
     *       <b>dbcc_name</b> as a one-character array.)
     * @type {Integer}
     */
    dbcc_size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Set to <b>DBT_DEVTYP_DEVICEINTERFACE</b>.
     * @type {Integer}
     */
    dbcc_devicetype {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved; do not use.
     * @type {Integer}
     */
    dbcc_reserved {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The GUID for the interface device class.
     * @type {Pointer<Guid>}
     */
    dbcc_classguid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

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
     * @type {Array<SByte>}
     */
    dbcc_name{
        get {
            if(!this.HasProp("__dbcc_nameProxyArray"))
                this.__dbcc_nameProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "char")
            return this.__dbcc_nameProxyArray
        }
    }
}
