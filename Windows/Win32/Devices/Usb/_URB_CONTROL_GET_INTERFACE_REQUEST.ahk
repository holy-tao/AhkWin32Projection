#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\_URB_HEADER.ahk
#Include .\_URB_HCD_AREA.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class _URB_CONTROL_GET_INTERFACE_REQUEST extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * @type {_URB_HEADER}
     */
    Hdr{
        get {
            if(!this.HasProp("__Hdr"))
                this.__Hdr := _URB_HEADER(0, this)
            return this.__Hdr
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    Reserved {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
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
                this.__hca := _URB_HCD_AREA(64, this)
            return this.__hca
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 128, 4, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Interface {
        get => NumGet(this, 132, "ushort")
        set => NumPut("ushort", value, this, 132)
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 134, "ushort")
        set => NumPut("ushort", value, this, 134)
    }
}
