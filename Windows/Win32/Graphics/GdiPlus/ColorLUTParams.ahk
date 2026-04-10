#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class ColorLUTParams extends Win32Struct {
    static sizeof => 1024

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    lutB {
        get {
            if(!this.HasProp("__lutBProxyArray"))
                this.__lutBProxyArray := Win32FixedArray(this.ptr + 0, 256, Primitive, "char")
            return this.__lutBProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    lutG {
        get {
            if(!this.HasProp("__lutGProxyArray"))
                this.__lutGProxyArray := Win32FixedArray(this.ptr + 256, 256, Primitive, "char")
            return this.__lutGProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    lutR {
        get {
            if(!this.HasProp("__lutRProxyArray"))
                this.__lutRProxyArray := Win32FixedArray(this.ptr + 512, 256, Primitive, "char")
            return this.__lutRProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    lutA {
        get {
            if(!this.HasProp("__lutAProxyArray"))
                this.__lutAProxyArray := Win32FixedArray(this.ptr + 768, 256, Primitive, "char")
            return this.__lutAProxyArray
        }
    }
}
