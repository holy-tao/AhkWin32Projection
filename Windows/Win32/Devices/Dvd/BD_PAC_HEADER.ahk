#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class BD_PAC_HEADER extends Win32Struct
{
    static sizeof => 384

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    PACId{
        get {
            if(!this.HasProp("__PACIdProxyArray"))
                this.__PACIdProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__PACIdProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    PACFormatNumber {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Array<Byte>}
     */
    PACUpdateCount{
        get {
            if(!this.HasProp("__PACUpdateCountProxyArray"))
                this.__PACUpdateCountProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__PACUpdateCountProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    UnknownPACRules{
        get {
            if(!this.HasProp("__UnknownPACRulesProxyArray"))
                this.__UnknownPACRulesProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__UnknownPACRulesProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    UnkownPACEntireDiscFlag {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 13, 1, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    NumberOfSegments {
        get => NumGet(this, 15, "char")
        set => NumPut("char", value, this, 15)
    }

    /**
     * @type {Array<Byte>}
     */
    Segments{
        get {
            if(!this.HasProp("__SegmentsProxyArray"))
                this.__SegmentsProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__SegmentsProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 272, 1, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }
}
