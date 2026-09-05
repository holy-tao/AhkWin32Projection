#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether the encoder converts the frame rate, if the output frame rate does not match the input frame rate. This enumeration is used with the AVEncVideoOutputFrameRateConversion property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideooutputframerateconversion
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncVideoOutputFrameRateConversion extends Win32Enum {

    /**
     * Disable frame rate conversion.
     * Native name: eAVEncVideoOutputFrameRateConversion_Disable
     * @type {Integer (Int32)}
     */
    static Disable => 0

    /**
     * Enable frame rate conversion.
     * Native name: eAVEncVideoOutputFrameRateConversion_Enable
     * @type {Integer (Int32)}
     */
    static Enable => 1

    /**
     * Change the time stamps on the samples, but do not interpolate the time stamps.
     * Native name: eAVEncVideoOutputFrameRateConversion_Alias
     * @type {Integer (Int32)}
     */
    static Alias => 2
}
