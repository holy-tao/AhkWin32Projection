#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DCOLORVALUE.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DMATERIAL extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    diffuse{
        get {
            if(!this.HasProp("__diffuse"))
                this.__diffuse := D3DCOLORVALUE(8, this)
            return this.__diffuse
        }
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    dcvDiffuse{
        get {
            if(!this.HasProp("__dcvDiffuse"))
                this.__dcvDiffuse := D3DCOLORVALUE(8, this)
            return this.__dcvDiffuse
        }
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    ambient{
        get {
            if(!this.HasProp("__ambient"))
                this.__ambient := D3DCOLORVALUE(24, this)
            return this.__ambient
        }
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    dcvAmbient{
        get {
            if(!this.HasProp("__dcvAmbient"))
                this.__dcvAmbient := D3DCOLORVALUE(24, this)
            return this.__dcvAmbient
        }
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    specular{
        get {
            if(!this.HasProp("__specular"))
                this.__specular := D3DCOLORVALUE(40, this)
            return this.__specular
        }
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    dcvSpecular{
        get {
            if(!this.HasProp("__dcvSpecular"))
                this.__dcvSpecular := D3DCOLORVALUE(40, this)
            return this.__dcvSpecular
        }
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    emissive{
        get {
            if(!this.HasProp("__emissive"))
                this.__emissive := D3DCOLORVALUE(56, this)
            return this.__emissive
        }
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    dcvEmissive{
        get {
            if(!this.HasProp("__dcvEmissive"))
                this.__dcvEmissive := D3DCOLORVALUE(56, this)
            return this.__dcvEmissive
        }
    }

    /**
     * @type {Float}
     */
    power {
        get => NumGet(this, 72, "float")
        set => NumPut("float", value, this, 72)
    }

    /**
     * @type {Float}
     */
    dvPower {
        get => NumGet(this, 72, "float")
        set => NumPut("float", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    hTexture {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    dwRampSize {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
