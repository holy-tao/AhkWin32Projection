#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SCATTER_GATHER_ELEMENT.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class SCATTER_GATHER_LIST extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumberOfElements {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    Reserved {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Array<SCATTER_GATHER_ELEMENT>}
     */
    Elements{
        get {
            if(!this.HasProp("__ElementsProxyArray"))
                this.__ElementsProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "ptr")
            return this.__ElementsProxyArray
        }
    }
}
