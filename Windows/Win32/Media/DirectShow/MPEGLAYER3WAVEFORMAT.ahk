#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Audio\WAVEFORMATEX.ahk

/**
 * The MPEGLAYER3WAVEFORMAT structure describes an MPEG Audio Layer-3 (MP3) audio format.
 * @see https://learn.microsoft.com/windows/win32/api/mmreg/ns-mmreg-mpeglayer3waveformat
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class MPEGLAYER3WAVEFORMAT extends Win32Struct
{
    static sizeof => 30

    static packingSize => 1

    /**
     * <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure that specifies the basic audio format. The <b>wFormatTag</b> member must be <b>WAVE_FORMAT_MPEGLAYER3</b>. The <b>cbSize</b> member must be at least 12. (For <b>cbSize</b>, you can use the constant <b>MPEGLAYER3_WFX_EXTRA_BYTES</b>, defined in the Mmreg.h.)
     * @type {WAVEFORMATEX}
     */
    wfx{
        get {
            if(!this.HasProp("__wfx"))
                this.__wfx := WAVEFORMATEX(this.ptr + 0)
            return this.__wfx
        }
    }

    /**
     * Set this structure member to <b>MPEGLAYER3_ID_MPEG</b>.
     * @type {Integer}
     */
    wID {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * 
     * @type {Integer}
     */
    fdwFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Block size in bytes. This value equals the frame length in bytes x <b>nFramesPerBlock</b>. For MP3 audio, the frame length is calculated as follows: 144 x (bitrate / sample rate) + padding.
     * @type {Integer}
     */
    nBlockSize {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * Number of audio frames per block.
     * @type {Integer}
     */
    nFramesPerBlock {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }

    /**
     * Encoder delay in samples. If you do not know this value, set this structure member to zero.
     * @type {Integer}
     */
    nCodecDelay {
        get => NumGet(this, 28, "ushort")
        set => NumPut("ushort", value, this, 28)
    }
}
