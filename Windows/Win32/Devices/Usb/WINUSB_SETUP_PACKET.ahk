#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WINUSB_SETUP_PACKET structure describes a USB setup packet.
 * @remarks
 * Callers of the <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_controltransfer">WinUsb_ControlTransfer</a> routine must pass in a <b>WINUSB_SETUP_PACKET</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/winusb/ns-winusb-winusb_setup_packet
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct WINUSB_SETUP_PACKET {
    #StructPack 2

    /**
     * The request type. The values that are assigned to this member are defined in Table 9.2 of section 9.3 of the Universal Serial Bus (USB) specification (www.usb.org).
     */
    RequestType : Int8

    /**
     * The device request. The values that are assigned to this member are defined in Table 9.3 of section 9.4 of the Universal Serial Bus (USB) specification.
     */
    Request : Int8

    /**
     * The meaning of this member varies according to the request. For an explanation of this member, see the Universal Serial Bus (USB) specification.
     */
    Value : UInt16

    /**
     * The meaning of this member varies according to the request. For an explanation of this member, see the Universal Serial Bus (USB) specification.
     */
    Index : UInt16

    /**
     * The number of bytes to transfer.
     */
    Length : UInt16

}
