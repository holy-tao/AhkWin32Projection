#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class AUDIO_CURVE_TYPE extends Win32Enum {

    /**
     * Native name: AUDIO_CURVE_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: AUDIO_CURVE_TYPE_WINDOWS_FADE
     * @type {Integer (Int32)}
     */
    static WINDOWS_FADE => 1
}
