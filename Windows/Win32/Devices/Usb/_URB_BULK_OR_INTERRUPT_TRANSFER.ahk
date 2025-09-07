#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\_URB_HEADER.ahk
#Include .\_URB_HCD_AREA.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class _URB_BULK_OR_INTERRUPT_TRANSFER extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * @type {_URB_HEADER}
     */
    Hdr{
        get {
            if(!this.HasProp("__Hdr"))
                this.__Hdr := _URB_HEADER(this.ptr + 0)
            return this.__Hdr
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    PipeHandle {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    TransferFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    TransferBufferLength {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Pointer<Void>}
     */
    TransferBuffer {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Void>}
     */
    TransferBufferMDL {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<URB>}
     */
    UrbLink {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {_URB_HCD_AREA}
     */
    hca{
        get {
            if(!this.HasProp("__hca"))
                this.__hca := _URB_HCD_AREA(this.ptr + 64)
            return this.__hca
        }
    }
}
