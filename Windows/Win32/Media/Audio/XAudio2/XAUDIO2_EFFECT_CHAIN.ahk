#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\XAUDIO2_EFFECT_DESCRIPTOR.ahk" { XAUDIO2_EFFECT_DESCRIPTOR }

/**
 * Defines an effect chain.
 * @remarks
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xaudio2/ns-xaudio2-xaudio2_effect_chain
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct XAUDIO2_EFFECT_CHAIN {
    #StructPack 8

    /**
     * Number of effects in the effect chain for the voice.
     */
    EffectCount : UInt32

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_effect_descriptor">XAUDIO2_EFFECT_DESCRIPTOR</a> structures containing pointers to XAPO instances.
     */
    pEffectDescriptors : XAUDIO2_EFFECT_DESCRIPTOR.Ptr

}
