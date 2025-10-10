#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DCOLORVALUE.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DMATERIAL9 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {D3DCOLORVALUE}
     */
    Diffuse{
        get {
            if(!this.HasProp("__Diffuse"))
                this.__Diffuse := D3DCOLORVALUE(this.ptr + 0)
            return this.__Diffuse
        }
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    Ambient{
        get {
            if(!this.HasProp("__Ambient"))
                this.__Ambient := D3DCOLORVALUE(this.ptr + 16)
            return this.__Ambient
        }
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    Specular{
        get {
            if(!this.HasProp("__Specular"))
                this.__Specular := D3DCOLORVALUE(this.ptr + 32)
            return this.__Specular
        }
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    Emissive{
        get {
            if(!this.HasProp("__Emissive"))
                this.__Emissive := D3DCOLORVALUE(this.ptr + 48)
            return this.__Emissive
        }
    }

    /**
     * @type {Float}
     */
    Power {
        get => NumGet(this, 64, "float")
        set => NumPut("float", value, this, 64)
    }
}
