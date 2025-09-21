#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a file system handle.
 * @see https://learn.microsoft.com/windows/win32/api/dbt/ns-dbt-dev_broadcast_handle
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class DEV_BROADCAST_HANDLE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The size of this structure, in bytes.
     * @type {Integer}
     */
    dbch_size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Set to DBT_DEVTYP_HANDLE.
     * @type {Integer}
     */
    dbch_devicetype {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved; do not use.
     * @type {Integer}
     */
    dbch_reserved {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A handle to the device to be checked.
     * @type {Pointer<Void>}
     */
    dbch_handle {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A handle to the device notification. This handle is returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerdevicenotificationa">RegisterDeviceNotification</a>.
     * @type {Pointer<Void>}
     */
    dbch_hdevnotify {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The GUID for the custom event. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/DevIO/device-events">Device Events</a>.  Valid only for <a href="https://docs.microsoft.com/windows/desktop/DevIO/dbt-customevent">DBT_CUSTOMEVENT</a>.
     * @type {Pointer<Guid>}
     */
    dbch_eventguid {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The offset of an optional string buffer.  Valid only for <a href="https://docs.microsoft.com/windows/desktop/DevIO/dbt-customevent">DBT_CUSTOMEVENT</a>.
     * @type {Integer}
     */
    dbch_nameoffset {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Optional binary data.  This member is valid only for <a href="https://docs.microsoft.com/windows/desktop/DevIO/dbt-customevent">DBT_CUSTOMEVENT</a>.
     * @type {Array<Byte>}
     */
    dbch_data{
        get {
            if(!this.HasProp("__dbch_dataProxyArray"))
                this.__dbch_dataProxyArray := Win32FixedArray(this.ptr + 44, 1, Primitive, "char")
            return this.__dbch_dataProxyArray
        }
    }
}
