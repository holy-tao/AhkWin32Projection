#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\_URB_HCD_AREA.ahk" { _URB_HCD_AREA }
#Import ".\_URB_HEADER.ahk" { _URB_HEADER }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct _URB_CONTROL_TRANSFER_EX {
    #StructPack 8

    Hdr : _URB_HEADER

    PipeHandle : IntPtr

    TransferFlags : UInt32

    TransferBufferLength : UInt32

    TransferBuffer : IntPtr

    TransferBufferMDL : IntPtr

    Timeout : UInt32

    hca : _URB_HCD_AREA

    SetupPacket : Int8[8]

}
