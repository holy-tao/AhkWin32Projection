#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DCOLORVALUE.ahk
#Include ..\Direct3D\D3DVECTOR.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DLIGHT extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dltType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    dcvColor{
        get {
            if(!this.HasProp("__dcvColor"))
                this.__dcvColor := D3DCOLORVALUE(this.ptr + 8)
            return this.__dcvColor
        }
    }

    /**
     * @type {D3DVECTOR}
     */
    dvPosition{
        get {
            if(!this.HasProp("__dvPosition"))
                this.__dvPosition := D3DVECTOR(this.ptr + 24)
            return this.__dvPosition
        }
    }

    /**
     * @type {D3DVECTOR}
     */
    dvDirection{
        get {
            if(!this.HasProp("__dvDirection"))
                this.__dvDirection := D3DVECTOR(this.ptr + 40)
            return this.__dvDirection
        }
    }

    /**
     * @type {Float}
     */
    dvRange {
        get => NumGet(this, 52, "float")
        set => NumPut("float", value, this, 52)
    }

    /**
     * @type {Float}
     */
    dvFalloff {
        get => NumGet(this, 56, "float")
        set => NumPut("float", value, this, 56)
    }

    /**
     * @type {Float}
     */
    dvAttenuation0 {
        get => NumGet(this, 60, "float")
        set => NumPut("float", value, this, 60)
    }

    /**
     * @type {Float}
     */
    dvAttenuation1 {
        get => NumGet(this, 64, "float")
        set => NumPut("float", value, this, 64)
    }

    /**
     * @type {Float}
     */
    dvAttenuation2 {
        get => NumGet(this, 68, "float")
        set => NumPut("float", value, this, 68)
    }

    /**
     * @type {Float}
     */
    dvTheta {
        get => NumGet(this, 72, "float")
        set => NumPut("float", value, this, 72)
    }

    /**
     * @type {Float}
     */
    dvPhi {
        get => NumGet(this, 76, "float")
        set => NumPut("float", value, this, 76)
    }
}
