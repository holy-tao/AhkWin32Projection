#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Parameters for use with the FXECHO XAPOFX.
 * @remarks
 * Echo only supports FLOAT32 audio formats.
  * 
  * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
  * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xapofx/ns-xapofx-fxecho_parameters
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class FXECHO_PARAMETERS extends Win32Struct
{
    static sizeof => 12

    static packingSize => 1

    /**
     * Ratio of wet (processed) signal to dry (original) signal.
     * @type {Float}
     */
    WetDryMix {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Amount of output to feed back into input.
     * @type {Float}
     */
    Feedback {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Delay to all channels in milliseconds. This value must be between <b>FXECHO_MIN_DELAY</b> and <a href="https://docs.microsoft.com/windows/desktop/api/xapofx/ns-xapofx-fxecho_initdata">FXECHO_INITDATA</a>.<b>MaxDelay</b>.
     * @type {Float}
     */
    Delay {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}
