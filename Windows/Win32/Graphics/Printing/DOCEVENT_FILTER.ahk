#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class DOCEVENT_FILTER extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    cElementsAllocated {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    cElementsNeeded {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    cElementsReturned {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<UInt32>}
     */
    aDocEventCall{
        get {
            if(!this.HasProp("__aDocEventCallProxyArray"))
                this.__aDocEventCallProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "uint")
            return this.__aDocEventCallProxyArray
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 20
    }
}
