#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\WNODE_HEADER.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class WNODE_SINGLE_INSTANCE extends Win32Struct {
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {WNODE_HEADER}
     */
    WnodeHeader {
        get {
            if(!this.HasProp("__WnodeHeader"))
                this.__WnodeHeader := WNODE_HEADER(0, this)
            return this.__WnodeHeader
        }
    }

    /**
     * @type {Integer}
     */
    OffsetInstanceName {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    InstanceIndex {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    DataBlockOffset {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    SizeDataBlock {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Array<Integer>}
     */
    VariableData {
        get {
            if(!this.HasProp("__VariableDataProxyArray"))
                this.__VariableDataProxyArray := Win32FixedArray(this.ptr + 64, 1, Primitive, "char")
            return this.__VariableDataProxyArray
        }
    }
}
