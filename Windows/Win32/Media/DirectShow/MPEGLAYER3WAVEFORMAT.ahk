#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import ".\MPEGLAYER3WAVEFORMAT_FLAGS.ahk" { MPEGLAYER3WAVEFORMAT_FLAGS }

/**
 * The MPEGLAYER3WAVEFORMAT structure describes an MPEG Audio Layer-3 (MP3) audio format.
 * @see https://learn.microsoft.com/windows/win32/api/mmreg/ns-mmreg-mpeglayer3waveformat
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct MPEGLAYER3WAVEFORMAT {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure that specifies the basic audio format. The <b>wFormatTag</b> member must be <b>WAVE_FORMAT_MPEGLAYER3</b>. The <b>cbSize</b> member must be at least 12. (For <b>cbSize</b>, you can use the constant <b>MPEGLAYER3_WFX_EXTRA_BYTES</b>, defined in the Mmreg.h.)
     */
    wfx : WAVEFORMATEX

    /**
     * Set this structure member to <b>MPEGLAYER3_ID_MPEG</b>.
     */
    wID : UInt16

    fdwFlags : MPEGLAYER3WAVEFORMAT_FLAGS

    /**
     * Block size in bytes. This value equals the frame length in bytes x <b>nFramesPerBlock</b>. For MP3 audio, the frame length is calculated as follows: 144 x (bitrate / sample rate) + padding.
     */
    nBlockSize : UInt16

    /**
     * Number of audio frames per block.
     */
    nFramesPerBlock : UInt16

    /**
     * Encoder delay in samples. If you do not know this value, set this structure member to zero.
     */
    nCodecDelay : UInt16

}
