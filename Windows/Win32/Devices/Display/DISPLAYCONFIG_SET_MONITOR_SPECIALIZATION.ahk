#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\DISPLAYCONFIG_DEVICE_INFO_HEADER.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_SET_MONITOR_SPECIALIZATION extends Win32Struct
{
    static sizeof => 304

    static packingSize => 8

    /**
     * @type {DISPLAYCONFIG_DEVICE_INFO_HEADER}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := DISPLAYCONFIG_DEVICE_INFO_HEADER(this.ptr + 0)
            return this.__header
        }
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    value {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<Guid>}
     */
    specializationType {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Guid>}
     */
    specializationSubType {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {String}
     */
    specializationApplicationName {
        get => StrGet(this.ptr + 48, 127, "UTF-16")
        set => StrPut(value, this.ptr + 48, 127, "UTF-16")
    }
}
