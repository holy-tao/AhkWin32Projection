#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains flags that specify how to convert an audio media type.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ne-mfapi-mfwaveformatexconvertflags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFWaveFormatExConvertFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Convert the media type to a <b>WAVEFORMATEX</b> structure if possible, or a <b>WAVEFORMATEXTENSIBLE</b> structure otherwise.
     * @type {Integer (Int32)}
     */
    static MFWaveFormatExConvertFlag_Normal => 0

    /**
     * Convert the media type to a <b>WAVEFORMATEXTENSIBLE</b> structure.
     * @type {Integer (Int32)}
     */
    static MFWaveFormatExConvertFlag_ForceExtensible => 1
}
