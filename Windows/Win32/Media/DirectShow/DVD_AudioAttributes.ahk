#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DVD_AudioAttributes structure is used in IDvdInfo2::GetAudioAttributes to receive the various audio attributes of the disc.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-dvd_audioattributes
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_AudioAttributes extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * Indicates the current audio mode. If the mode returned is DVD_AudioMode_Karaoke, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getkaraokeattributes">IDvdInfo2::GetKaraokeAttributes</a> to get more info.
     * @type {Integer}
     */
    AppMode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    AppModeData {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * Describes the format (encoding mode) of the audio stream.
     * @type {Integer}
     */
    AudioFormat {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * An <b>LCID</b> value indicating the language of the audio stream. Is zero if no language is present.
     * @type {Integer}
     */
    Language {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A [DVD_AUDIO_LANG_EXT](/windows/desktop/api/strmif/ne-strmif-dvd_audio_lang_ext) enumeration that will be filled in if any information is available on the disc.
     * @type {Integer}
     */
    LanguageExtension {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Indicates whether multichannel attributes are present. If <b>TRUE</b>, it means there is additional mixing information available, such as for SurroundSound. Call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-gettitleattributes">IDvdInfo2::GetTitleAttributes</a> to retrieve the multichannel information.
     * @type {BOOL}
     */
    fHasMultichannelInfo {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * The frequency in hertz (48k, 96k) of the audio stream.
     * @type {Integer}
     */
    dwFrequency {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The resolution of the audio stream (16, 20, 24 bits, or other) Zero indicates the resolution is unknown.
     * @type {Integer}
     */
    bQuantization {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }

    /**
     * The number of channels. For example, 5.1 Dolby AC-3 has six channels.
     * @type {Integer}
     */
    bNumberOfChannels {
        get => NumGet(this, 29, "char")
        set => NumPut("char", value, this, 29)
    }

    /**
     * Reserved.
     * @type {Array<UInt32>}
     */
    dwReserved{
        get {
            if(!this.HasProp("__dwReservedProxyArray"))
                this.__dwReservedProxyArray := Win32FixedArray(this.ptr + 32, 2, Primitive, "uint")
            return this.__dwReservedProxyArray
        }
    }
}
