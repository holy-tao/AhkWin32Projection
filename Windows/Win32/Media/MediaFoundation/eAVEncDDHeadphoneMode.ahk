#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies headphone mode for a Dolby Digital audio stream. This enumeration is used with the AVEncDDHeadphoneMode property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencddheadphonemode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncDDHeadphoneMode extends Win32Enum {

    /**
     * Headphone mode is not indicated.
     * Native name: eAVEncDDHeadphoneMode_NotIndicated
     * @type {Integer (Int32)}
     */
    static NotIndicated => 0

    /**
     * Headphone mode is disabled.
     * Native name: eAVEncDDHeadphoneMode_NotEncoded
     * @type {Integer (Int32)}
     */
    static NotEncoded => 1

    /**
     * Headphone mode is enabled.
     * Native name: eAVEncDDHeadphoneMode_Encoded
     * @type {Integer (Int32)}
     */
    static Encoded => 2
}
