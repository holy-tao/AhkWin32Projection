#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_DEVICE_SESSION_STATUS {
    #StructPack 4

    bEnable : UInt32

    bSuccess : UInt32

}
