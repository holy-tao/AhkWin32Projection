#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct PACKET_PARAMETERS {
    #StructPack 4

    DeviceAddress : Int8

    EndpointAddress : Int8

    MaximumPacketSize : UInt16

    Timeout : UInt32

    Flags : UInt32

    DataLength : UInt32

    HubDeviceAddress : UInt16

    PortTTNumber : UInt16

    ErrorCount : Int8

    Pad : Int8[3]

    UsbdStatusCode : Int32

    Data : Int8[4]

}
