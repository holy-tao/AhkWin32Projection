#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct SDP_ULARGE_INTEGER_16 {
    #StructPack 8

    LowPart : Int64

    HighPart : Int64

}
