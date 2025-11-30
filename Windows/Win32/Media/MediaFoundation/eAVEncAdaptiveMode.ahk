#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the adaptive encoding mode for a video encoder.
 * @see https://docs.microsoft.com/windows/win32/api//codecapi/ne-codecapi-eavencadaptivemode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncAdaptiveMode extends Win32Enum{

    /**
     * Do not perform adaptive encoding.
     * @type {Integer (Int32)}
     */
    static eAVEncAdaptiveMode_None => 0

    /**
     * Adaptively change the frame resolution.
     * @type {Integer (Int32)}
     */
    static eAVEncAdaptiveMode_Resolution => 1

    /**
     * Adaptively change the frame rate.
     * @type {Integer (Int32)}
     */
    static eAVEncAdaptiveMode_FrameRate => 2
}
