#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGE_ROM_OPTIONAL_HEADER extends Win32Struct
{
    static sizeof => 56

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Magic {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MajorLinkerVersion {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    MinorLinkerVersion {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    SizeOfCode {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    SizeOfInitializedData {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    SizeOfUninitializedData {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    AddressOfEntryPoint {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    BaseOfCode {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    BaseOfData {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    BaseOfBss {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    GprMask {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Array<UInt32>}
     */
    CprMask{
        get {
            if(!this.HasProp("__CprMaskProxyArray"))
                this.__CprMaskProxyArray := Win32FixedArray(this.ptr + 36, 4, Primitive, "uint")
            return this.__CprMaskProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    GpValue {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }
}
