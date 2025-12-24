#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Graphics\Direct3D\D3DVECTOR.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class DS3DLISTENER extends Win32Struct
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
     * @type {D3DVECTOR}
     */
    vOrientFront{
        get {
            if(!this.HasProp("__vOrientFront"))
                this.__vOrientFront := D3DVECTOR(28, this)
            return this.__vOrientFront
        }
    }

    /**
     * @type {D3DVECTOR}
     */
    vOrientTop{
        get {
            if(!this.HasProp("__vOrientTop"))
                this.__vOrientTop := D3DVECTOR(40, this)
            return this.__vOrientTop
        }
    }

    /**
     * @type {Float}
     */
    flDistanceFactor {
        get => NumGet(this, 52, "float")
        set => NumPut("float", value, this, 52)
    }

    /**
     * @type {Float}
     */
    flRolloffFactor {
        get => NumGet(this, 56, "float")
        set => NumPut("float", value, this, 56)
    }

    /**
     * @type {Float}
     */
    flDopplerFactor {
        get => NumGet(this, 60, "float")
        set => NumPut("float", value, this, 60)
    }
}
