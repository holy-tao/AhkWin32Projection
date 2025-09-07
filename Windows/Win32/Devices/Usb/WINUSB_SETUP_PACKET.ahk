#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WINUSB_SETUP_PACKET structure describes a USB setup packet.
 * @remarks
 * Callers of the <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_controltransfer">WinUsb_ControlTransfer</a> routine must pass in a <b>WINUSB_SETUP_PACKET</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/winusb/ns-winusb-winusb_setup_packet
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class WINUSB_SETUP_PACKET extends Win32Struct
{
    static sizeof => 8

    static packingSize => 1

    /**
     * The request type. The values that are assigned to this member are defined in Table 9.2 of section 9.3 of the Universal Serial Bus (USB) specification (www.usb.org).
     * @type {Integer}
     */
    RequestType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * The device request. The values that are assigned to this member are defined in Table 9.3 of section 9.4 of the Universal Serial Bus (USB) specification.
     * @type {Integer}
     */
    Request {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * The meaning of this member varies according to the request. For an explanation of this member, see the Universal Serial Bus (USB) specification.
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The meaning of this member varies according to the request. For an explanation of this member, see the Universal Serial Bus (USB) specification.
     * @type {Integer}
     */
    Index {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * The number of bytes to transfer.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
