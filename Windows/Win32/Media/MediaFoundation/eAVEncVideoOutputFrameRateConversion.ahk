#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies whether the encoder converts the frame rate, if the output frame rate does not match the input frame rate. This enumeration is used with the AVEncVideoOutputFrameRateConversion property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideooutputframerateconversion
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncVideoOutputFrameRateConversion{

    /**
     * Disable frame rate conversion.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoOutputFrameRateConversion_Disable => 0

    /**
     * Enable frame rate conversion.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoOutputFrameRateConversion_Enable => 1

    /**
     * Change the time stamps on the samples, but do not interpolate the time stamps.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoOutputFrameRateConversion_Alias => 2
}
