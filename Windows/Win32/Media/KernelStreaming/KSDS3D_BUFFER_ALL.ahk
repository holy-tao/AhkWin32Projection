#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DS3DVECTOR.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSDS3D_BUFFER_ALL extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

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
                this.__Velocity := DS3DVECTOR(16, this)
            return this.__Velocity
        }
    }

    /**
     * @type {Integer}
     */
    InsideConeAngle {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    OutsideConeAngle {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {DS3DVECTOR}
     */
    ConeOrientation{
        get {
            if(!this.HasProp("__ConeOrientation"))
                this.__ConeOrientation := DS3DVECTOR(40, this)
            return this.__ConeOrientation
        }
    }

    /**
     * @type {Integer}
     */
    ConeOutsideVolume {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * @type {Float}
     */
    MinDistance {
        get => NumGet(this, 56, "float")
        set => NumPut("float", value, this, 56)
    }

    /**
     * @type {Float}
     */
    MaxDistance {
        get => NumGet(this, 60, "float")
        set => NumPut("float", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    Mode {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
