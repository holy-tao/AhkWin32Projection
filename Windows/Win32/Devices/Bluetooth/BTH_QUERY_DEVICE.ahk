#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The BTH_QUERY_DEVICE structure is used when querying for the presence of a Bluetooth device.
 * @remarks
 * See the Bluetooth specification at 
 * <a href="https://www.bluetooth.com/">www.bluetooth.com</a> for additional information about LAP.
 * @see https://learn.microsoft.com/windows/win32/api/ws2bth/ns-ws2bth-bth_query_device
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BTH_QUERY_DEVICE {
    #StructPack 4

    /**
     * Reserved. Must be set to zero.
     */
    LAP : UInt32

    /**
     * Requested length of the inquiry, in seconds.
     */
    length : Int8

}
