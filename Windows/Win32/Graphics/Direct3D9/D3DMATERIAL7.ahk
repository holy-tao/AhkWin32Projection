#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DCOLORVALUE.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DMATERIAL7 extends Win32Struct
{
    static sizeof => 68

    static packingSize => 4

    /**
     * @type {D3DCOLORVALUE}
     */
    diffuse{
        get {
            if(!this.HasProp("__diffuse"))
                this.__diffuse := D3DCOLORVALUE(0, this)
            return this.__diffuse
        }
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    dcvDiffuse{
        get {
            if(!this.HasProp("__dcvDiffuse"))
                this.__dcvDiffuse := D3DCOLORVALUE(0, this)
            return this.__dcvDiffuse
        }
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    ambient{
        get {
            if(!this.HasProp("__ambient"))
                this.__ambient := D3DCOLORVALUE(16, this)
            return this.__ambient
        }
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    dcvAmbient{
        get {
            if(!this.HasProp("__dcvAmbient"))
                this.__dcvAmbient := D3DCOLORVALUE(16, this)
            return this.__dcvAmbient
        }
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    specular{
        get {
            if(!this.HasProp("__specular"))
                this.__specular := D3DCOLORVALUE(32, this)
            return this.__specular
        }
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    dcvSpecular{
        get {
            if(!this.HasProp("__dcvSpecular"))
                this.__dcvSpecular := D3DCOLORVALUE(32, this)
            return this.__dcvSpecular
        }
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    emissive{
        get {
            if(!this.HasProp("__emissive"))
                this.__emissive := D3DCOLORVALUE(48, this)
            return this.__emissive
        }
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    dcvEmissive{
        get {
            if(!this.HasProp("__dcvEmissive"))
                this.__dcvEmissive := D3DCOLORVALUE(48, this)
            return this.__dcvEmissive
        }
    }

    /**
     * @type {Float}
     */
    power {
        get => NumGet(this, 64, "float")
        set => NumPut("float", value, this, 64)
    }

    /**
     * @type {Float}
     */
    dvPower {
        get => NumGet(this, 64, "float")
        set => NumPut("float", value, this, 64)
    }
}
