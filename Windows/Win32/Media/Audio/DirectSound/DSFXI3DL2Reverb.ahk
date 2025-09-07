#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class DSFXI3DL2Reverb extends Win32Struct
{
    static sizeof => 48

    static packingSize => 4

    /**
     * @type {Integer}
     */
    lRoom {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    lRoomHF {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Float}
     */
    flRoomRolloffFactor {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * @type {Float}
     */
    flDecayTime {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * @type {Float}
     */
    flDecayHFRatio {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    lReflections {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Float}
     */
    flReflectionsDelay {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    lReverb {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Float}
     */
    flReverbDelay {
        get => NumGet(this, 32, "float")
        set => NumPut("float", value, this, 32)
    }

    /**
     * @type {Float}
     */
    flDiffusion {
        get => NumGet(this, 36, "float")
        set => NumPut("float", value, this, 36)
    }

    /**
     * @type {Float}
     */
    flDensity {
        get => NumGet(this, 40, "float")
        set => NumPut("float", value, this, 40)
    }

    /**
     * @type {Float}
     */
    flHFReference {
        get => NumGet(this, 44, "float")
        set => NumPut("float", value, this, 44)
    }
}
