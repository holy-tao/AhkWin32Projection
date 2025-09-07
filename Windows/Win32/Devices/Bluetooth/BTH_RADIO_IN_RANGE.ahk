#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BTH_DEVICE_INFO.ahk

/**
 * Stores data about Bluetooth devices within communication range.
 * @see https://learn.microsoft.com/windows/win32/api/bthdef/ns-bthdef-bth_radio_in_range
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BTH_RADIO_IN_RANGE extends Win32Struct
{
    static sizeof => 528

    static packingSize => 8

    /**
     * Current set of attributes associated with the remote device, in the form of a <a href="https://docs.microsoft.com/windows/desktop/api/bthdef/ns-bthdef-bth_device_info">BTH_DEVICE_INFO</a> structure.
     * @type {BTH_DEVICE_INFO}
     */
    deviceInfo{
        get {
            if(!this.HasProp("__deviceInfo"))
                this.__deviceInfo := BTH_DEVICE_INFO(this.ptr + 0)
            return this.__deviceInfo
        }
    }

    /**
     * Previous flags for the <b>flags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/bthdef/ns-bthdef-bth_device_info">BTH_DEVICE_INFO</a> structure pointed to by the <b>deviceInfo</b> member. Used to determine which attributes associated with the remote device have changed.
     * @type {Integer}
     */
    previousDeviceFlags {
        get => NumGet(this, 520, "uint")
        set => NumPut("uint", value, this, 520)
    }
}
