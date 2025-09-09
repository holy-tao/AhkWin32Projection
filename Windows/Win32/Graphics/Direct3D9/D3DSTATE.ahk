#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DSTATE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dlstLightStateType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    drstRenderStateType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Array<UInt32>}
     */
    dwArg{
        get {
            if(!this.HasProp("__dwArgProxyArray"))
                this.__dwArgProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "uint")
            return this.__dwArgProxyArray
        }
    }

    /**
     * @type {Array<Single>}
     */
    dvArg{
        get {
            if(!this.HasProp("__dvArgProxyArray"))
                this.__dvArgProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "float")
            return this.__dvArgProxyArray
        }
    }
}
