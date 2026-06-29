#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains coefficients used to transform multichannel audio into a smaller number of audio channels. This process is called fold-down.
 * @remarks
 * To specify this information in the media type, set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-audio-folddown-matrix-attribute">MF_MT_AUDIO_FOLDDOWN_MATRIX</a> attribute.
 * 
 * The ASF media source supports fold-down from six channels (5.1 audio) to two channels (stereo). It gets the information from the g_wszFold6To2Channels3 attribute in the ASF header. This attribute is documented in the Windows Media Format SDK documentation.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-mffolddown_matrix
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFFOLDDOWN_MATRIX {
    #StructPack 4

    /**
     * Size of the structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Number of source channels.
     */
    cSrcChannels : UInt32

    /**
     * Number of destination channels.
     */
    cDstChannels : UInt32

    /**
     * Specifies the assignment of audio channels to speaker positions in the transformed audio. This member is a bitwise <b>OR</b> of flags that define the speaker positions. For a list of valid flags, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-audio-channel-mask-attribute">MF_MT_AUDIO_CHANNEL_MASK</a> attribute.
     */
    dwChannelMask : UInt32

    /**
     * Array that contains the fold-down coefficients. The number of coefficients is <b>cSrcChannels</b>×<b>cDstChannels</b>. If the number of coefficients is less than the size of the array, the remaining elements in the array are ignored. For more information about how the coefficients are applied, see <a href="https://docs.microsoft.com/previous-versions/ms867218(v=msdn.10)">Windows Media Audio Professional Codec Features</a>.
     */
    Coeff : Int32[64]

}
