#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Parameters for use with the FXReverb XAPO.
 * @remarks
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xapofx/ns-xapofx-fxreverb_parameters
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct FXREVERB_PARAMETERS {
    #StructPack 4

    /**
     * Controls the character of the individual wall reflections. Set to minimum value to simulate a hard flat surface and to maximum value to simulate a diffuse surface.Value must be between FXREVERB_MIN_DIFFUSION and FXREVERB_MAX_DIFFUSION.
     */
    Diffusion : Float32

    /**
     * Size of the room. Value must be between FXREVERB_MIN_ROOMSIZE and FXREVERB_MAX_ROOMSIZE. Note that physical meaning of RoomSize is subjective and not tied to any particular units. A smaller value will result in reflections reaching the listener more quickly while reflections will take longer with larger values for RoomSize.
     */
    RoomSize : Float32

}
