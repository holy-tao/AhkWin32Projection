#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\WHEA_NOTIFICATION_FLAGS.ahk
#Include .\WHEA_NOTIFICATION_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class WHEA_GENERIC_ERROR_DESCRIPTOR_V2 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Enabled {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    ErrStatusBlockLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    RelatedErrorSourceId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ErrStatusAddressSpaceID {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    ErrStatusAddressBitWidth {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * @type {Integer}
     */
    ErrStatusAddressBitOffset {
        get => NumGet(this, 14, "char")
        set => NumPut("char", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    ErrStatusAddressAccessSize {
        get => NumGet(this, 15, "char")
        set => NumPut("char", value, this, 15)
    }

    /**
     * @type {Integer}
     */
    ErrStatusAddress {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * @type {WHEA_NOTIFICATION_DESCRIPTOR}
     */
    Notify{
        get {
            if(!this.HasProp("__Notify"))
                this.__Notify := WHEA_NOTIFICATION_DESCRIPTOR(this.ptr + 24)
            return this.__Notify
        }
    }

    /**
     * @type {Integer}
     */
    ReadAckAddressSpaceID {
        get => NumGet(this, 36, "char")
        set => NumPut("char", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    ReadAckAddressBitWidth {
        get => NumGet(this, 37, "char")
        set => NumPut("char", value, this, 37)
    }

    /**
     * @type {Integer}
     */
    ReadAckAddressBitOffset {
        get => NumGet(this, 38, "char")
        set => NumPut("char", value, this, 38)
    }

    /**
     * @type {Integer}
     */
    ReadAckAddressAccessSize {
        get => NumGet(this, 39, "char")
        set => NumPut("char", value, this, 39)
    }

    /**
     * @type {Integer}
     */
    ReadAckAddress {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ReadAckPreserveMask {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    ReadAckWriteMask {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
