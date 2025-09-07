#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DDP_PTRSTRIDE.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DDRAWPRIMITIVESTRIDEDDATA extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * @type {D3DDP_PTRSTRIDE}
     */
    position{
        get {
            if(!this.HasProp("__position"))
                this.__position := D3DDP_PTRSTRIDE(this.ptr + 0)
            return this.__position
        }
    }

    /**
     * @type {D3DDP_PTRSTRIDE}
     */
    normal{
        get {
            if(!this.HasProp("__normal"))
                this.__normal := D3DDP_PTRSTRIDE(this.ptr + 16)
            return this.__normal
        }
    }

    /**
     * @type {D3DDP_PTRSTRIDE}
     */
    diffuse{
        get {
            if(!this.HasProp("__diffuse"))
                this.__diffuse := D3DDP_PTRSTRIDE(this.ptr + 32)
            return this.__diffuse
        }
    }

    /**
     * @type {D3DDP_PTRSTRIDE}
     */
    specular{
        get {
            if(!this.HasProp("__specular"))
                this.__specular := D3DDP_PTRSTRIDE(this.ptr + 48)
            return this.__specular
        }
    }

    /**
     * @type {Array<D3DDP_PTRSTRIDE>}
     */
    textureCoords{
        get {
            if(!this.HasProp("__textureCoordsProxyArray"))
                this.__textureCoordsProxyArray := Win32FixedArray(this.ptr + 64, 8, D3DDP_PTRSTRIDE, "")
            return this.__textureCoordsProxyArray
        }
    }
}
