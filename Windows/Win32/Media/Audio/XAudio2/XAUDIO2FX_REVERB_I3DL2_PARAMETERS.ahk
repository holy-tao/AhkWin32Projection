#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Describes I3DL2 (Interactive 3D Audio Rendering Guidelines Level 2.0) parameters for use in the ReverbConvertI3DL2ToNative function.
 * @remarks
 * There are many preset values defined for the <b>XAUDIO2FX_REVERB_I3DL2_PARAMETERS</b> structure. For more information, see <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2fx-i3dl2-preset">XAUDIO2FX_I3DL2_PRESET</a>.
  * 
  * 
  * 
  * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
  * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xaudio2fx/ns-xaudio2fx-xaudio2fx_reverb_i3dl2_parameters
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class XAUDIO2FX_REVERB_I3DL2_PARAMETERS extends Win32Struct
{
    static sizeof => 52

    static packingSize => 4

    /**
     * Percentage of the output that will be reverb. Allowable values are from 0 to 100.
     * @type {Float}
     */
    WetDryMix {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Attenuation of the room effect. Allowable values in hundredths of a decibel are from -10000 to 0.
     * @type {Integer}
     */
    Room {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Attenuation of the room high-frequency effect. Allowable values in hundredths of a decibel are from -10000 to 0.
     * @type {Integer}
     */
    RoomHF {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Rolloff factor for the reflected signals. Allowable values are from 0.0 to 10.0. Rolloff factor is ignored for built-in reverb effects.
     * @type {Float}
     */
    RoomRolloffFactor {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * Reverberation decay time at low frequencies. Allowable values in seconds are from 0.1 to 20.0.
     * @type {Float}
     */
    DecayTime {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Ratio of the decay time at high frequencies to the decay time at low frequencies. Allowable values are from 0.1 to 2.0.
     * @type {Float}
     */
    DecayHFRatio {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * Attenuation of early reflections relative to <b>Room</b>. Allowable values in hundredths of a decibel are from -10000 to 1000.
     * @type {Integer}
     */
    Reflections {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Delay time of the first reflection relative to the direct path. Allowable values in seconds are from 0.0 to 0.3.
     * @type {Float}
     */
    ReflectionsDelay {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }

    /**
     * Attenuation of late reverberation relative to <b>Room</b>. Allowable values in hundredths of a decibel are from -10000 to 2000.
     * @type {Integer}
     */
    Reverb {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Time limit between the early reflections and the late reverberation relative to the time of the first reflection. Allowable values in seconds are from 0.0 to 0.1.
     * @type {Float}
     */
    ReverbDelay {
        get => NumGet(this, 36, "float")
        set => NumPut("float", value, this, 36)
    }

    /**
     * Echo density in the late reverberation decay. Allowable values as a percentage are from 0 to 100.
     * @type {Float}
     */
    Diffusion {
        get => NumGet(this, 40, "float")
        set => NumPut("float", value, this, 40)
    }

    /**
     * Modal density in the late reverberation decay. Allowable values as a percentage are from 0 to 100.
     * @type {Float}
     */
    Density {
        get => NumGet(this, 44, "float")
        set => NumPut("float", value, this, 44)
    }

    /**
     * Reference high frequency. Allowable values in Hz are from 20.0 to 20000.0.
     * @type {Float}
     */
    HFReference {
        get => NumGet(this, 48, "float")
        set => NumPut("float", value, this, 48)
    }
}
