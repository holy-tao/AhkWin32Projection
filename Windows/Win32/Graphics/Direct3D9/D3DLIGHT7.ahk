#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DCOLORVALUE.ahk
#Include ..\Direct3D\D3DVECTOR.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DLIGHT7 extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dltType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
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
    dcvSpecular{
        get {
            if(!this.HasProp("__dcvSpecular"))
                this.__dcvSpecular := D3DCOLORVALUE(24, this)
            return this.__dcvSpecular
        }
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    dcvAmbient{
        get {
            if(!this.HasProp("__dcvAmbient"))
                this.__dcvAmbient := D3DCOLORVALUE(40, this)
            return this.__dcvAmbient
        }
    }

    /**
     * @type {D3DVECTOR}
     */
    dvPosition{
        get {
            if(!this.HasProp("__dvPosition"))
                this.__dvPosition := D3DVECTOR(56, this)
            return this.__dvPosition
        }
    }

    /**
     * @type {D3DVECTOR}
     */
    dvDirection{
        get {
            if(!this.HasProp("__dvDirection"))
                this.__dvDirection := D3DVECTOR(72, this)
            return this.__dvDirection
        }
    }

    /**
     * @type {Float}
     */
    dvRange {
        get => NumGet(this, 84, "float")
        set => NumPut("float", value, this, 84)
    }

    /**
     * @type {Float}
     */
    dvFalloff {
        get => NumGet(this, 88, "float")
        set => NumPut("float", value, this, 88)
    }

    /**
     * @type {Float}
     */
    dvAttenuation0 {
        get => NumGet(this, 92, "float")
        set => NumPut("float", value, this, 92)
    }

    /**
     * @type {Float}
     */
    dvAttenuation1 {
        get => NumGet(this, 96, "float")
        set => NumPut("float", value, this, 96)
    }

    /**
     * @type {Float}
     */
    dvAttenuation2 {
        get => NumGet(this, 100, "float")
        set => NumPut("float", value, this, 100)
    }

    /**
     * @type {Float}
     */
    dvTheta {
        get => NumGet(this, 104, "float")
        set => NumPut("float", value, this, 104)
    }

    /**
     * @type {Float}
     */
    dvPhi {
        get => NumGet(this, 108, "float")
        set => NumPut("float", value, this, 108)
    }
}
