#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKMDT_OPM_HDCP_KEY_SELECTION_VECTOR extends Win32Struct {
    static sizeof => 5

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    abKeySelectionVector {
        get {
            if(!this.HasProp("__abKeySelectionVectorProxyArray"))
                this.__abKeySelectionVectorProxyArray := Win32FixedArray(this.ptr + 0, 5, Primitive, "char")
            return this.__abKeySelectionVectorProxyArray
        }
    }
}
