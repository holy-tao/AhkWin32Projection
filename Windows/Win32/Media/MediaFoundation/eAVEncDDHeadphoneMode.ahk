#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies headphone mode for a Dolby Digital audio stream. This enumeration is used with the AVEncDDHeadphoneMode property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencddheadphonemode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncDDHeadphoneMode extends Win32Enum{

    /**
     * Headphone mode is not indicated.
     * @type {Integer (Int32)}
     */
    static eAVEncDDHeadphoneMode_NotIndicated => 0

    /**
     * Headphone mode is disabled.
     * @type {Integer (Int32)}
     */
    static eAVEncDDHeadphoneMode_NotEncoded => 1

    /**
     * Headphone mode is enabled.
     * @type {Integer (Int32)}
     */
    static eAVEncDDHeadphoneMode_Encoded => 2
}
