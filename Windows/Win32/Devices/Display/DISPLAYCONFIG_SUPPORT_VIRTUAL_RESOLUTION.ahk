#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\DISPLAYCONFIG_DEVICE_INFO_HEADER.ahk

/**
 * The DISPLAYCONFIG_SUPPORT_VIRTUAL_RESOLUTION structure contains information on the state of virtual resolution support for the monitor.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_support_virtual_resolution
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_SUPPORT_VIRTUAL_RESOLUTION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_device_info_header">DISPLAYCONFIG_DEVICE_INFO_HEADER</a> structure that holds information on the type, size, adapterID, and ID of the target the monitor is connected to.
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
}
