#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Graphics\Direct3D\D3DVECTOR.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class DS3DBUFFER extends Win32Struct
{
    static sizeof => 64

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {D3DVECTOR}
     */
    vPosition{
        get {
            if(!this.HasProp("__vPosition"))
                this.__vPosition := D3DVECTOR(4, this)
            return this.__vPosition
        }
    }

    /**
     * @type {D3DVECTOR}
     */
    vVelocity{
        get {
            if(!this.HasProp("__vVelocity"))
                this.__vVelocity := D3DVECTOR(16, this)
            return this.__vVelocity
        }
    }

    /**
     * @type {Integer}
     */
    dwInsideConeAngle {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    dwOutsideConeAngle {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {D3DVECTOR}
     */
    vConeOrientation{
        get {
            if(!this.HasProp("__vConeOrientation"))
                this.__vConeOrientation := D3DVECTOR(36, this)
            return this.__vConeOrientation
        }
    }

    /**
     * @type {Integer}
     */
    lConeOutsideVolume {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {Float}
     */
    flMinDistance {
        get => NumGet(this, 52, "float")
        set => NumPut("float", value, this, 52)
    }

    /**
     * @type {Float}
     */
    flMaxDistance {
        get => NumGet(this, 56, "float")
        set => NumPut("float", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    dwMode {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }
}
