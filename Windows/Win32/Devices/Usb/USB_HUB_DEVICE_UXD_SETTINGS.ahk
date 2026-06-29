#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_HUB_DEVICE_UXD_SETTINGS {
    #StructPack 4

    Version : UInt32

    PnpGuid : Guid

    OwnerGuid : Guid

    DeleteOnShutdown : UInt32

    DeleteOnReload : UInt32

    DeleteOnDisconnect : UInt32

    Reserved : UInt32[5]

}
