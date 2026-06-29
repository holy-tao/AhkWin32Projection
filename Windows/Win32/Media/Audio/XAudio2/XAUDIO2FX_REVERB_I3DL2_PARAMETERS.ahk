#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct XAUDIO2FX_REVERB_I3DL2_PARAMETERS {
    #StructPack 4

    /**
     * Percentage of the output that will be reverb. Allowable values are from 0 to 100.
     */
    WetDryMix : Float32

    /**
     * Attenuation of the room effect. Allowable values in hundredths of a decibel are from -10000 to 0.
     */
    Room : Int32

    /**
     * Attenuation of the room high-frequency effect. Allowable values in hundredths of a decibel are from -10000 to 0.
     */
    RoomHF : Int32

    /**
     * Rolloff factor for the reflected signals. Allowable values are from 0.0 to 10.0. Rolloff factor is ignored for built-in reverb effects.
     */
    RoomRolloffFactor : Float32

    /**
     * Reverberation decay time at low frequencies. Allowable values in seconds are from 0.1 to 20.0.
     */
    DecayTime : Float32

    /**
     * Ratio of the decay time at high frequencies to the decay time at low frequencies. Allowable values are from 0.1 to 2.0.
     */
    DecayHFRatio : Float32

    /**
     * Attenuation of early reflections relative to <b>Room</b>. Allowable values in hundredths of a decibel are from -10000 to 1000.
     */
    Reflections : Int32

    /**
     * Delay time of the first reflection relative to the direct path. Allowable values in seconds are from 0.0 to 0.3.
     */
    ReflectionsDelay : Float32

    /**
     * Attenuation of late reverberation relative to <b>Room</b>. Allowable values in hundredths of a decibel are from -10000 to 2000.
     */
    Reverb : Int32

    /**
     * Time limit between the early reflections and the late reverberation relative to the time of the first reflection. Allowable values in seconds are from 0.0 to 0.1.
     */
    ReverbDelay : Float32

    /**
     * Echo density in the late reverberation decay. Allowable values as a percentage are from 0 to 100.
     */
    Diffusion : Float32

    /**
     * Modal density in the late reverberation decay. Allowable values as a percentage are from 0 to 100.
     */
    Density : Float32

    /**
     * Reference high frequency. Allowable values in Hz are from 20.0 to 20000.0.
     */
    HFReference : Float32

}
