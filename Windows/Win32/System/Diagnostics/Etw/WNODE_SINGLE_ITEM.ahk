#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include .\WNODE_HEADER.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class WNODE_SINGLE_ITEM extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {WNODE_HEADER}
     */
    WnodeHeader{
        get {
            if(!this.HasProp("__WnodeHeader"))
                this.__WnodeHeader := WNODE_HEADER(this.ptr + 0)
            return this.__WnodeHeader
        }
    }

    /**
     * @type {Integer}
     */
    OffsetInstanceName {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    InstanceIndex {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    ItemId {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    DataBlockOffset {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    SizeDataItem {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Array<Byte>}
     */
    VariableData{
        get {
            if(!this.HasProp("__VariableDataProxyArray"))
                this.__VariableDataProxyArray := Win32FixedArray(this.ptr + 60, 1, Primitive, "char")
            return this.__VariableDataProxyArray
        }
    }
}
