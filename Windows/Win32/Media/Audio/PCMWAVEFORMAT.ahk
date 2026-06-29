#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WAVEFORMAT.ahk" { WAVEFORMAT }

/**
 * The PCMWAVEFORMAT structure describes the data format for PCM waveform-audio data. This structure has been superseded by the WAVEFORMATEX structure.
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-pcmwaveformat
 * @namespace Windows.Win32.Media.Audio
 */
export default struct PCMWAVEFORMAT {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-waveformatex">WAVEFORMAT</a> structure containing general information about the format of the data.
     */
    wf : WAVEFORMAT

    /**
     * Number of bits per sample.
     */
    wBitsPerSample : UInt16

}
