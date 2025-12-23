#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines a set of voices to receive data from a single output voice.
 * @remarks
 * If <b>pSends</b> is not NULL all of its elements must be non-NULL. To send output to the default mastering voice call <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-setoutputvoices">IXAudio2Voice::SetOutputVoices</a> with the pSendList argument set to NULL.
 * 
 * 
 * 
 * Setting <b>SendCount</b> to 0 is useful for certain effects such as volume meters or file writers that don't generate any audio output to pass on to another voice.
 * 
 * 
 * 
 * If needed, a voice will perform a single sample rate conversion, from the voice's input sample rate to the input sample rate of the voice's output voices. Because only one sample rate conversion will be performed, all the voice's output voices must have the same input sample rate. If the input sample rates of the voice and its output voices are the same, no sample rate conversion is performed.
 * 
 * 
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xaudio2/ns-xaudio2-xaudio2_voice_sends
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class XAUDIO2_VOICE_SENDS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of voices to receive the output of the voice. An <b>OutputCount</b> value of 0 indicates the voice should not send output to any voices.
     * @type {Integer}
     */
    SendCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_send_descriptor">XAUDIO2_SEND_DESCRIPTOR</a> structures describing destination voices and the filters that should be used when sending to the voices. This array should contain <b>SendCount</b> elements. If <b>SendCount</b> is 0 <b>pSends</b> should be NULL. Note that <b>pSends</b> cannot contain the same voice more than once.
     * @type {Pointer<XAUDIO2_SEND_DESCRIPTOR>}
     */
    pSends {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
