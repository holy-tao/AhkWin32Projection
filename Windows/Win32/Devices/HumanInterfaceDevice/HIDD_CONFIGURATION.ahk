#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct HIDD_CONFIGURATION {
    #StructPack 8

    cookie : IntPtr

    size : UInt32

    RingBufferSize : UInt32

}
