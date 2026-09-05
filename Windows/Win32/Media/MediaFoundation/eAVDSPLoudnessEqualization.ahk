#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether loudness equalization is enabled in an audio decoder or digital signal processor (DSP).
 * @remarks
 * Loudness equalization is a DSP process that maintains a consistent volume level when the audio stream changes.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavdsploudnessequalization
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVDSPLoudnessEqualization extends Win32Enum {

    /**
     * Loudness equalization is disabled.
     * Native name: eAVDSPLoudnessEqualization_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 0

    /**
     * Loudness equalization is enabled.
     * Native name: eAVDSPLoudnessEqualization_ON
     * @type {Integer (Int32)}
     */
    static ON => 1

    /**
     * The decoder or DSP automatically selects the equalization mode.
     * Native name: eAVDSPLoudnessEqualization_AUTO
     * @type {Integer (Int32)}
     */
    static AUTO => 2
}
