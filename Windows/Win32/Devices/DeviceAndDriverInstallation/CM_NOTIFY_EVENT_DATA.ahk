#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This is a device notification event data structure.
 * @remarks
 * The notification callback supplied to <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/nf-cfgmgr32-cm_register_notification">CM_Register_Notification</a> receives a pointer to a structure of type <b>CM_NOTIFY_EVENT_DATA</b> in the callback's <i>EventData</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-cm_notify_event_data
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class CM_NOTIFY_EVENT_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The <b>CM_NOTIFY_FILTER_TYPE</b> from the <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/ns-cfgmgr32-cm_notify_filter">CM_NOTIFY_FILTER</a> structure that was used in the registration that generated this notification event data.
     * @type {Integer}
     */
    FilterType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Reserved.  Must be 0.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Guid>}
     */
    ClassGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {String}
     */
    SymbolicLink {
        get => StrGet(this.ptr + 16, 0, "UTF-16")
        set => StrPut(value, this.ptr + 16, 0, "UTF-16")
    }

    /**
     * @type {Pointer<Guid>}
     */
    EventGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NameOffset {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    DataSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Array<Byte>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "char")
            return this.__DataProxyArray
        }
    }

    /**
     * @type {String}
     */
    InstanceId {
        get => StrGet(this.ptr + 8, 0, "UTF-16")
        set => StrPut(value, this.ptr + 8, 0, "UTF-16")
    }
}
