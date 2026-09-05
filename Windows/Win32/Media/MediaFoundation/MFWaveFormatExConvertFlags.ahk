#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags that specify how to convert an audio media type.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ne-mfapi-mfwaveformatexconvertflags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFWaveFormatExConvertFlags extends Win32Enum {

    /**
     * Convert the media type to a <b>WAVEFORMATEX</b> structure if possible, or a <b>WAVEFORMATEXTENSIBLE</b> structure otherwise.
     * Native name: MFWaveFormatExConvertFlag_Normal
     * @type {Integer (Int32)}
     */
    static Flag_Normal => 0

    /**
     * Convert the media type to a <b>WAVEFORMATEXTENSIBLE</b> structure.
     * Native name: MFWaveFormatExConvertFlag_ForceExtensible
     * @type {Integer (Int32)}
     */
    static Flag_ForceExtensible => 1
}
