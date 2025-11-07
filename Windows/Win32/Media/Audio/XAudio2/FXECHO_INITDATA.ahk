#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Initialization parameters for use with the FXECHO XAPOFX.
 * @remarks
 * 
 * Use of this structure is optional. The default <b>MaxDelay</b> is <b>FXECHO_DEFAULT_DELAY</b>.
 * 
 * <div class="alert"><b>Note</b>  The DirectX SDK versions of XAUDIO2 don't support this functionality.</div>
 * <div> </div>
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xapofx/ns-xapofx-fxecho_initdata
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class FXECHO_INITDATA extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Maximum delay (all channels) in milliseconds. This must be within <b>FXECHO_MIN_DELAY</b> and <b>FXECHO_MAX_DELAY</b>.
     * @type {Float}
     */
    MaxDelay {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }
}
