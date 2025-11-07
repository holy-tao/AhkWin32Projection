#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines stream buffer parameters that remain constant while an XAPO is locked. Used with the IXAPO::LockForProcess method.
 * @remarks
 * 
 * The byte size of the respective stream buffer must be at least <i>MaxFrameCount</i> × (<i>pFormat</i>-&gt;nBlockAlign) bytes.
 * 
 * 
 * 
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xapo/ns-xapo-xapo_lockforprocess_parameters
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class XAPO_LOCKFORPROCESS_PARAMETERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A WAVFORMATEX describing the format for the stream buffer.
     * @type {Pointer<WAVEFORMATEX>}
     */
    pFormat {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Maximum number of frames in the stream buffer that <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-ixapo-process">IXAPO::Process</a> would ever be required to handle, irrespective of dynamic parameter settings.
     * @type {Integer}
     */
    MaxFrameCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
