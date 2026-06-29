#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USBD_PIPE_TYPE.ahk" { USBD_PIPE_TYPE }

/**
 * The WINUSB_PIPE_INFORMATION structure contains pipe information that the WinUsb_QueryPipe routine retrieves.
 * @see https://learn.microsoft.com/windows/win32/api/winusbio/ns-winusbio-winusb_pipe_information
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct WINUSB_PIPE_INFORMATION {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/usb/ne-usb-_usbd_pipe_type">USBD_PIPE_TYPE</a>-type enumeration value that specifies the pipe type.
     */
    PipeType : USBD_PIPE_TYPE

    /**
     * The pipe identifier (ID).
     */
    PipeId : Int8

    /**
     * The maximum size, in bytes, of the packets that are transmitted on the pipe.
     */
    MaximumPacketSize : UInt16

    /**
     * The pipe interval.
     */
    Interval : Int8

}
