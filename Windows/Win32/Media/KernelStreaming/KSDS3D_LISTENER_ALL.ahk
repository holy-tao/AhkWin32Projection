#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DS3DVECTOR.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSDS3D_LISTENER_ALL extends Win32Struct
{
    static sizeof => 60

    static packingSize => 4

    /**
     * @type {DS3DVECTOR}
     */
    Position{
        get {
            if(!this.HasProp("__Position"))
                this.__Position := DS3DVECTOR(0, this)
            return this.__Position
        }
    }

    /**
     * @type {DS3DVECTOR}
     */
    Velocity{
        get {
            if(!this.HasProp("__Velocity"))
                this.__Velocity := DS3DVECTOR(12, this)
            return this.__Velocity
        }
    }

    /**
     * @type {DS3DVECTOR}
     */
    OrientFront{
        get {
            if(!this.HasProp("__OrientFront"))
                this.__OrientFront := DS3DVECTOR(24, this)
            return this.__OrientFront
        }
    }

    /**
     * @type {DS3DVECTOR}
     */
    OrientTop{
        get {
            if(!this.HasProp("__OrientTop"))
                this.__OrientTop := DS3DVECTOR(36, this)
            return this.__OrientTop
        }
    }

    /**
     * @type {Float}
     */
    DistanceFactor {
        get => NumGet(this, 48, "float")
        set => NumPut("float", value, this, 48)
    }

    /**
     * @type {Float}
     */
    RolloffFactor {
        get => NumGet(this, 52, "float")
        set => NumPut("float", value, this, 52)
    }

    /**
     * @type {Float}
     */
    DopplerFactor {
        get => NumGet(this, 56, "float")
        set => NumPut("float", value, this, 56)
    }
}
