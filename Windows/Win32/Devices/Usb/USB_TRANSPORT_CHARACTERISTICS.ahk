#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_TRANSPORT_CHARACTERISTICS {
    #StructPack 8

    Version : UInt32

    TransportCharacteristicsFlags : UInt32

    CurrentRoundtripLatencyInMilliSeconds : Int64

    MaxPotentialBandwidth : Int64

}
