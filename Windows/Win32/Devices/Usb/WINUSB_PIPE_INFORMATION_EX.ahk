#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WINUSB_PIPE_INFORMATION_EX structure contains pipe information that the WinUsb_QueryPipeEx routine retrieves.
 * @see https://learn.microsoft.com/windows/win32/api/winusbio/ns-winusbio-winusb_pipe_information_ex
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class WINUSB_PIPE_INFORMATION_EX extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/usb/ne-usb-_usbd_pipe_type">USBD_PIPE_TYPE</a>-type enumeration value that specifies the pipe type.
     * @type {Integer}
     */
    PipeType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The pipe identifier (ID).
     * @type {Integer}
     */
    PipeId {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * The maximum size, in bytes, of the packets that are transmitted on the pipe.
     * @type {Integer}
     */
    MaximumPacketSize {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * The pipe interval.
     * @type {Integer}
     */
    Interval {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * The maximum number of bytes that can be transmitted in single interval.  This value may be a larger than the <b>MaximumPacketSize</b> value on high-bandwidth, high-speed periodic endpoints and SuperSpeed periodic endpoints, such as isochronous endpoints.
     * @type {Integer}
     */
    MaximumBytesPerInterval {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
