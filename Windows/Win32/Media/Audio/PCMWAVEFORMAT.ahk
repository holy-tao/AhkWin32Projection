#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WAVEFORMAT.ahk

/**
 * The PCMWAVEFORMAT structure describes the data format for PCM waveform-audio data. This structure has been superseded by the WAVEFORMATEX structure.
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-pcmwaveformat
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class PCMWAVEFORMAT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-waveformatex">WAVEFORMAT</a> structure containing general information about the format of the data.
     * @type {WAVEFORMAT}
     */
    wf{
        get {
            if(!this.HasProp("__wf"))
                this.__wf := WAVEFORMAT(0, this)
            return this.__wf
        }
    }

    /**
     * Number of bits per sample.
     * @type {Integer}
     */
    wBitsPerSample {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }
}
