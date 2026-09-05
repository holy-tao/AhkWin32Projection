#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the adaptive encoding mode for a video encoder.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencadaptivemode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncAdaptiveMode extends Win32Enum {

    /**
     * Do not perform adaptive encoding.
     * Native name: eAVEncAdaptiveMode_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Adaptively change the frame resolution.
     * Native name: eAVEncAdaptiveMode_Resolution
     * @type {Integer (Int32)}
     */
    static Resolution => 1

    /**
     * Adaptively change the frame rate.
     * Native name: eAVEncAdaptiveMode_FrameRate
     * @type {Integer (Int32)}
     */
    static FrameRate => 2
}
