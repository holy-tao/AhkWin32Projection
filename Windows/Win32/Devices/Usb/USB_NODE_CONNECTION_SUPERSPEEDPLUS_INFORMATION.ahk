#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED.ahk" { USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_NODE_CONNECTION_SUPERSPEEDPLUS_INFORMATION {
    #StructPack 4

    ConnectionIndex : UInt32

    Length : UInt32

    RxSuperSpeedPlus : USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED

    RxLaneCount : UInt32

    TxSuperSpeedPlus : USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED

    TxLaneCount : UInt32

}
