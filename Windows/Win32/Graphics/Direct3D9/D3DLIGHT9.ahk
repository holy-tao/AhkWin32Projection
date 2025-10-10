#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DCOLORVALUE.ahk
#Include ..\Direct3D\D3DVECTOR.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DLIGHT9 extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    Diffuse{
        get {
            if(!this.HasProp("__Diffuse"))
                this.__Diffuse := D3DCOLORVALUE(this.ptr + 8)
            return this.__Diffuse
        }
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    Specular{
        get {
            if(!this.HasProp("__Specular"))
                this.__Specular := D3DCOLORVALUE(this.ptr + 24)
            return this.__Specular
        }
    }

    /**
     * @type {D3DCOLORVALUE}
     */
    Ambient{
        get {
            if(!this.HasProp("__Ambient"))
                this.__Ambient := D3DCOLORVALUE(this.ptr + 40)
            return this.__Ambient
        }
    }

    /**
     * @type {D3DVECTOR}
     */
    Position{
        get {
            if(!this.HasProp("__Position"))
                this.__Position := D3DVECTOR(this.ptr + 56)
            return this.__Position
        }
    }

    /**
     * @type {D3DVECTOR}
     */
    Direction{
        get {
            if(!this.HasProp("__Direction"))
                this.__Direction := D3DVECTOR(this.ptr + 72)
            return this.__Direction
        }
    }

    /**
     * @type {Float}
     */
    Range {
        get => NumGet(this, 84, "float")
        set => NumPut("float", value, this, 84)
    }

    /**
     * @type {Float}
     */
    Falloff {
        get => NumGet(this, 88, "float")
        set => NumPut("float", value, this, 88)
    }

    /**
     * @type {Float}
     */
    Attenuation0 {
        get => NumGet(this, 92, "float")
        set => NumPut("float", value, this, 92)
    }

    /**
     * @type {Float}
     */
    Attenuation1 {
        get => NumGet(this, 96, "float")
        set => NumPut("float", value, this, 96)
    }

    /**
     * @type {Float}
     */
    Attenuation2 {
        get => NumGet(this, 100, "float")
        set => NumPut("float", value, this, 100)
    }

    /**
     * @type {Float}
     */
    Theta {
        get => NumGet(this, 104, "float")
        set => NumPut("float", value, this, 104)
    }

    /**
     * @type {Float}
     */
    Phi {
        get => NumGet(this, 108, "float")
        set => NumPut("float", value, this, 108)
    }
}
