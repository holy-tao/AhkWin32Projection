#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USBD_PIPE_INFORMATION.ahk" { USBD_PIPE_INFORMATION }
#Import ".\USBD_INTERFACE_INFORMATION.ahk" { USBD_INTERFACE_INFORMATION }
#Import ".\USBD_PIPE_TYPE.ahk" { USBD_PIPE_TYPE }
#Import ".\_URB_HEADER.ahk" { _URB_HEADER }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct _URB_SELECT_INTERFACE {
    #StructPack 8

    Hdr : _URB_HEADER

    ConfigurationHandle : IntPtr

    Interface : USBD_INTERFACE_INFORMATION

}
