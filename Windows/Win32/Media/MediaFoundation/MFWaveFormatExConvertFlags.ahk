#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains flags that specify how to convert an audio media type.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ne-mfapi-mfwaveformatexconvertflags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFWaveFormatExConvertFlags{

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
