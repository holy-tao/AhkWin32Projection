#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Graphics\Direct3D\D3DVECTOR.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class DS3DLISTENER extends Win32Struct
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
     * @type {D3DVECTOR}
     */
    vOrientFront{
        get {
            if(!this.HasProp("__vOrientFront"))
                this.__vOrientFront := D3DVECTOR(this.ptr + 40)
            return this.__vOrientFront
        }
    }

    /**
     * @type {D3DVECTOR}
     */
    vOrientTop{
        get {
            if(!this.HasProp("__vOrientTop"))
                this.__vOrientTop := D3DVECTOR(this.ptr + 56)
            return this.__vOrientTop
        }
    }

    /**
     * @type {Float}
     */
    flDistanceFactor {
        get => NumGet(this, 68, "float")
        set => NumPut("float", value, this, 68)
    }

    /**
     * @type {Float}
     */
    flRolloffFactor {
        get => NumGet(this, 72, "float")
        set => NumPut("float", value, this, 72)
    }

    /**
     * @type {Float}
     */
    flDopplerFactor {
        get => NumGet(this, 76, "float")
        set => NumPut("float", value, this, 76)
    }
}
