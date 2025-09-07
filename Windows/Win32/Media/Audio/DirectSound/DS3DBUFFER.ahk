#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Graphics\Direct3D\D3DVECTOR.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class DS3DBUFFER extends Win32Struct
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
     * @type {D3DVECTOR}
     */
    vPosition{
        get {
            if(!this.HasProp("__vPosition"))
                this.__vPosition := D3DVECTOR(this.ptr + 8)
            return this.__vPosition
        }
    }

    /**
     * @type {D3DVECTOR}
     */
    vVelocity{
        get {
            if(!this.HasProp("__vVelocity"))
                this.__vVelocity := D3DVECTOR(this.ptr + 24)
            return this.__vVelocity
        }
    }

    /**
     * @type {Integer}
     */
    dwInsideConeAngle {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    dwOutsideConeAngle {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {D3DVECTOR}
     */
    vConeOrientation{
        get {
            if(!this.HasProp("__vConeOrientation"))
                this.__vConeOrientation := D3DVECTOR(this.ptr + 48)
            return this.__vConeOrientation
        }
    }

    /**
     * @type {Integer}
     */
    lConeOutsideVolume {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * @type {Float}
     */
    flMinDistance {
        get => NumGet(this, 64, "float")
        set => NumPut("float", value, this, 64)
    }

    /**
     * @type {Float}
     */
    flMaxDistance {
        get => NumGet(this, 68, "float")
        set => NumPut("float", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    dwMode {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }
}
