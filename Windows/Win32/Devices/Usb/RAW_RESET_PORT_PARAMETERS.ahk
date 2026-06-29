#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct RAW_RESET_PORT_PARAMETERS {
    #StructPack 2

    PortNumber : UInt16

    PortStatus : UInt16

}
