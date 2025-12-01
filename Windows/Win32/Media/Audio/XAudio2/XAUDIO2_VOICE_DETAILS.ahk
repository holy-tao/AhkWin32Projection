#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the creation flags, input channels, and sample rate of a voice.
 * @remarks
 * Note the DirectX SDK versions of XAUDIO2 do not support the <b>ActiveFlags</b> member.
 * 
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xaudio2/ns-xaudio2-xaudio2_voice_details
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class XAUDIO2_VOICE_DETAILS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Flags used to create the voice; see the individual voice <a href="https://docs.microsoft.com/windows/desktop/xaudio2/interfaces">interfaces</a> for more information.
     * @type {Integer}
     */
    CreationFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Flags that are currently set on the voice.
     * @type {Integer}
     */
    ActiveFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of input channels the voice expects.
     * @type {Integer}
     */
    InputChannels {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The input sample rate the voice expects.
     * @type {Integer}
     */
    InputSampleRate {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
