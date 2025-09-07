#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DS3DVECTOR.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSDS3D_LISTENER_ALL extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {DS3DVECTOR}
     */
    Position{
        get {
            if(!this.HasProp("__Position"))
                this.__Position := DS3DVECTOR(this.ptr + 0)
            return this.__Position
        }
    }

    /**
     * @type {DS3DVECTOR}
     */
    Velocity{
        get {
            if(!this.HasProp("__Velocity"))
                this.__Velocity := DS3DVECTOR(this.ptr + 16)
            return this.__Velocity
        }
    }

    /**
     * @type {DS3DVECTOR}
     */
    OrientFront{
        get {
            if(!this.HasProp("__OrientFront"))
                this.__OrientFront := DS3DVECTOR(this.ptr + 32)
            return this.__OrientFront
        }
    }

    /**
     * @type {DS3DVECTOR}
     */
    OrientTop{
        get {
            if(!this.HasProp("__OrientTop"))
                this.__OrientTop := DS3DVECTOR(this.ptr + 48)
            return this.__OrientTop
        }
    }

    /**
     * @type {Float}
     */
    DistanceFactor {
        get => NumGet(this, 60, "float")
        set => NumPut("float", value, this, 60)
    }

    /**
     * @type {Float}
     */
    RolloffFactor {
        get => NumGet(this, 64, "float")
        set => NumPut("float", value, this, 64)
    }

    /**
     * @type {Float}
     */
    DopplerFactor {
        get => NumGet(this, 68, "float")
        set => NumPut("float", value, this, 68)
    }
}
