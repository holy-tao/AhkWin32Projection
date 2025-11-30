#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DDDI_QUERYREGISTRY_INFO extends Win32Struct
{
    static sizeof => 568

    static packingSize => 8

    /**
     * @type {Integer}
     */
    QueryType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<D3DDDI_QUERYREGISTRY_FLAGS>}
     */
    QueryFlags {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {String}
     */
    ValueName {
        get => StrGet(this.ptr + 16, 259, "UTF-16")
        set => StrPut(value, this.ptr + 16, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    ValueType {
        get => NumGet(this, 536, "uint")
        set => NumPut("uint", value, this, 536)
    }

    /**
     * @type {Integer}
     */
    PhysicalAdapterIndex {
        get => NumGet(this, 540, "uint")
        set => NumPut("uint", value, this, 540)
    }

    /**
     * @type {Integer}
     */
    OutputValueSize {
        get => NumGet(this, 544, "uint")
        set => NumPut("uint", value, this, 544)
    }

    /**
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 548, "int")
        set => NumPut("int", value, this, 548)
    }

    /**
     * @type {Integer}
     */
    OutputDword {
        get => NumGet(this, 552, "uint")
        set => NumPut("uint", value, this, 552)
    }

    /**
     * @type {Integer}
     */
    OutputQword {
        get => NumGet(this, 552, "uint")
        set => NumPut("uint", value, this, 552)
    }

    /**
     * @type {String}
     */
    OutputString {
        get => StrGet(this.ptr + 552, 0, "UTF-16")
        set => StrPut(value, this.ptr + 552, 0, "UTF-16")
    }

    /**
     * @type {Array<Byte>}
     */
    OutputBinary{
        get {
            if(!this.HasProp("__OutputBinaryProxyArray"))
                this.__OutputBinaryProxyArray := Win32FixedArray(this.ptr + 552, 1, Primitive, "char")
            return this.__OutputBinaryProxyArray
        }
    }
}
