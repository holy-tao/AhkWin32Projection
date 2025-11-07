#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains coefficients used to transform multichannel audio into a smaller number of audio channels. This process is called fold-down.
 * @remarks
 * 
 * To specify this information in the media type, set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-audio-folddown-matrix-attribute">MF_MT_AUDIO_FOLDDOWN_MATRIX</a> attribute.
 * 
 * The ASF media source supports fold-down from six channels (5.1 audio) to two channels (stereo). It gets the information from the g_wszFold6To2Channels3 attribute in the ASF header. This attribute is documented in the Windows Media Format SDK documentation.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ns-mfapi-mffolddown_matrix
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFFOLDDOWN_MATRIX extends Win32Struct
{
    static sizeof => 272

    static packingSize => 4

    /**
     * Size of the structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of source channels.
     * @type {Integer}
     */
    cSrcChannels {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Number of destination channels.
     * @type {Integer}
     */
    cDstChannels {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the assignment of audio channels to speaker positions in the transformed audio. This member is a bitwise <b>OR</b> of flags that define the speaker positions. For a list of valid flags, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-audio-channel-mask-attribute">MF_MT_AUDIO_CHANNEL_MASK</a> attribute.
     * @type {Integer}
     */
    dwChannelMask {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Array that contains the fold-down coefficients. The number of coefficients is <b>cSrcChannels</b>×<b>cDstChannels</b>. If the number of coefficients is less than the size of the array, the remaining elements in the array are ignored. For more information about how the coefficients are applied, see <a href="https://docs.microsoft.com/previous-versions/ms867218(v=msdn.10)">Windows Media Audio Professional Codec Features</a>.
     * @type {Array<Int32>}
     */
    Coeff{
        get {
            if(!this.HasProp("__CoeffProxyArray"))
                this.__CoeffProxyArray := Win32FixedArray(this.ptr + 16, 64, Primitive, "int")
            return this.__CoeffProxyArray
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 272
    }
}
