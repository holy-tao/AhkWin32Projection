#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct RAW_ROOTPORT_FEATURE {
    #StructPack 2

    PortNumber : UInt16

    PortFeature : UInt16

    PortStatus : UInt16

}
