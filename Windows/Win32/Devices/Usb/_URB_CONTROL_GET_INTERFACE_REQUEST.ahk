#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\_URB_HCD_AREA.ahk" { _URB_HCD_AREA }
#Import ".\URB.ahk" { URB }
#Import ".\_URB_HEADER.ahk" { _URB_HEADER }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct _URB_CONTROL_GET_INTERFACE_REQUEST {
    #StructPack 8

    Hdr : _URB_HEADER

    Reserved : IntPtr

    Reserved0 : UInt32

    TransferBufferLength : UInt32

    TransferBuffer : IntPtr

    TransferBufferMDL : IntPtr

    __UrbLink_ptr : IntPtr
    UrbLink {
        get => (addr := this.__UrbLink_ptr) ? URB.At(addr) : unset
        set => this.__UrbLink_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    hca : _URB_HCD_AREA

    Reserved1 : Int8[4]

    Interface : UInt16

    Reserved2 : UInt16

}
