#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class BDA_DEBUG_DATA extends Win32Struct {
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Integer}
     */
    lResult {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    uuidDebugDataType {
        get {
            if(!this.HasProp("__uuidDebugDataType"))
                this.__uuidDebugDataType := Guid(4, this)
            return this.__uuidDebugDataType
        }
    }

    /**
     * @type {Integer}
     */
    ulDataSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Array<Integer>}
     */
    argbDebugData {
        get {
            if(!this.HasProp("__argbDebugDataProxyArray"))
                this.__argbDebugDataProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "char")
            return this.__argbDebugDataProxyArray
        }
    }
}
