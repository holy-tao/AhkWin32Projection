#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_PRERECORDED_INFORMATION extends Win32Struct
{
    static sizeof => 64

    static packingSize => 1

    /**
     * @type {Integer}
     */
    FieldID_1 {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DiscApplicationCode {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    DiscPhysicalCode {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Array<Byte>}
     */
    LastAddressOfDataRecordableArea{
        get {
            if(!this.HasProp("__LastAddressOfDataRecordableAreaProxyArray"))
                this.__LastAddressOfDataRecordableAreaProxyArray := Win32FixedArray(this.ptr + 3, 3, Primitive, "char")
            return this.__LastAddressOfDataRecordableAreaProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * @type {Integer}
     */
    FieldID_2 {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    OpcSuggestedCode {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {Integer}
     */
    WavelengthCode {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * @type {Array<Byte>}
     */
    WriteStrategyCode{
        get {
            if(!this.HasProp("__WriteStrategyCodeProxyArray"))
                this.__WriteStrategyCodeProxyArray := Win32FixedArray(this.ptr + 11, 4, Primitive, "char")
            return this.__WriteStrategyCodeProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 15, "char")
        set => NumPut("char", value, this, 15)
    }

    /**
     * @type {Integer}
     */
    FieldID_3 {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Array<Byte>}
     */
    ManufacturerId_3{
        get {
            if(!this.HasProp("__ManufacturerId_3ProxyArray"))
                this.__ManufacturerId_3ProxyArray := Win32FixedArray(this.ptr + 17, 6, Primitive, "char")
            return this.__ManufacturerId_3ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Reserved3 {
        get => NumGet(this, 23, "char")
        set => NumPut("char", value, this, 23)
    }

    /**
     * @type {Integer}
     */
    FieldID_4 {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * @type {Array<Byte>}
     */
    ManufacturerId_4{
        get {
            if(!this.HasProp("__ManufacturerId_4ProxyArray"))
                this.__ManufacturerId_4ProxyArray := Win32FixedArray(this.ptr + 25, 6, Primitive, "char")
            return this.__ManufacturerId_4ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Reserved4 {
        get => NumGet(this, 31, "char")
        set => NumPut("char", value, this, 31)
    }

    /**
     * @type {Integer}
     */
    FieldID_5 {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }

    /**
     * @type {Array<Byte>}
     */
    ManufacturerId_5{
        get {
            if(!this.HasProp("__ManufacturerId_5ProxyArray"))
                this.__ManufacturerId_5ProxyArray := Win32FixedArray(this.ptr + 33, 6, Primitive, "char")
            return this.__ManufacturerId_5ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Reserved5 {
        get => NumGet(this, 39, "char")
        set => NumPut("char", value, this, 39)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved99{
        get {
            if(!this.HasProp("__Reserved99ProxyArray"))
                this.__Reserved99ProxyArray := Win32FixedArray(this.ptr + 40, 24, Primitive, "char")
            return this.__Reserved99ProxyArray
        }
    }
}
