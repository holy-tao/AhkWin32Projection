#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct HID_DRIVER_CONFIG {
    #StructPack 4

    Size : UInt32

    RingBufferSize : UInt32

}
