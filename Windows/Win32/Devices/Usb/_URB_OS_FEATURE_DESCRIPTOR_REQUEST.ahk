#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\_URB_HCD_AREA.ahk" { _URB_HCD_AREA }
#Import ".\URB.ahk" { URB }
#Import ".\_URB_HEADER.ahk" { _URB_HEADER }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct _URB_OS_FEATURE_DESCRIPTOR_REQUEST {
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

    /**
     * This bitfield backs the following members:
     * - Recipient
     * - Reserved1
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    Recipient {
        get => (this._bitfield >> 0) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 5) & 0x7
        set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
    }
    Reserved2 : Int8

    InterfaceNumber : Int8

    MS_PageIndex : Int8

    MS_FeatureDescriptorIndex : UInt16

    Reserved3 : UInt16

}
