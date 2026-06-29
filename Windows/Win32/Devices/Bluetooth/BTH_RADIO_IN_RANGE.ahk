#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BTH_DEVICE_INFO.ahk" { BTH_DEVICE_INFO }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Stores data about Bluetooth devices within communication range.
 * @see https://learn.microsoft.com/windows/win32/api/bthdef/ns-bthdef-bth_radio_in_range
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BTH_RADIO_IN_RANGE {
    #StructPack 8

    /**
     * Current set of attributes associated with the remote device, in the form of a <a href="https://docs.microsoft.com/windows/desktop/api/bthdef/ns-bthdef-bth_device_info">BTH_DEVICE_INFO</a> structure.
     */
    deviceInfo : BTH_DEVICE_INFO

    /**
     * Previous flags for the <b>flags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/bthdef/ns-bthdef-bth_device_info">BTH_DEVICE_INFO</a> structure pointed to by the <b>deviceInfo</b> member. Used to determine which attributes associated with the remote device have changed.
     */
    previousDeviceFlags : UInt32

}
