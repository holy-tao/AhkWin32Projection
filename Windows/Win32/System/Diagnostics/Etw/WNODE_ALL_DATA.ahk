#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\WNODE_HEADER.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include .\OFFSETINSTANCEDATAANDLENGTH.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class WNODE_ALL_DATA extends Win32Struct {
    static sizeof => 64

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
    DataBlockOffset {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    InstanceCount {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    OffsetInstanceNameOffsets {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    FixedInstanceSize {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {OFFSETINSTANCEDATAANDLENGTH}
     */
    OffsetInstanceDataAndLength {
        get {
            if(!this.HasProp("__OffsetInstanceDataAndLengthProxyArray"))
                this.__OffsetInstanceDataAndLengthProxyArray := Win32FixedArray(this.ptr + 52, 1, OFFSETINSTANCEDATAANDLENGTH, "")
            return this.__OffsetInstanceDataAndLengthProxyArray
        }
    }
}
