#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IXAudio2Voice.ahk

/**
 * A mastering voice is used to represent the audio output device.
 * @remarks
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nn-xaudio2-ixaudio2masteringvoice
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class IXAudio2MasteringVoice extends IXAudio2Voice{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetChannelMask"]

    /**
     * Returns the channel mask for this voice.
     * @remarks
     * The <i>pChannelMask</i> argument is a bit-mask of the various channels in the speaker geometry reported by the audio system. This information is needed for the <a href="https://docs.microsoft.com/windows/desktop/api/x3daudio/nf-x3daudio-x3daudioinitialize">X3DAudioInitialize</a> <i>SpeakerChannelMask</i> parameter.
     * 
     * 
     * 
     * The X3DAUDIO.H header declares a number of <b>SPEAKER_</b> positional defines to decode these channels masks.
     * 
     * 
     * 
     * Examples include:
     * 
     * 
     * 
     * 
     * ```
     * SPEAKER_STEREO // SPEAKER_FRONT_LEFT (0x1) | SPEAKER_FRONT_RIGHT (0x2) 
     * 
     * SPEAKER_5POINT1 // SPEAKER_FRONT_LEFT (0x1) | SPEAKER_FRONT_RIGHT (0x2)
     *                                     // | SPEAKER_FRONT_CENTER (0x4)
     *                                     // | SPEAKER_LOW_FREQUENCY (0x8)
     *                                     // | SPEAKER_BACK_LEFT (0x10) | SPEAKER_BACK_RIGHT (0x20)
     * ```
     * 
     * 
     * <div class="alert"><b>Note</b>  For the DirectX SDK versions of XAUDIO, the channel mask for the output device was obtained via the <b>IXAudio2::GetDeviceDetails</b> method, which doesn't exist in Windows 8 and later.</div>
     * <div> </div>
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); 
     *             Windows 8, Windows Phone 8 (XAudio 2.8)
     * @returns {Integer} Returns the channel mask for this voice. This corresponds to the <b>dwChannelMask</b> member of the  <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-waveformatextensible">WAVEFORMATEXTENSIBLE</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2masteringvoice-getchannelmask
     */
    GetChannelMask() {
        result := ComCall(19, this, "uint*", &pChannelmask := 0, "HRESULT")
        return pChannelmask
    }
}
