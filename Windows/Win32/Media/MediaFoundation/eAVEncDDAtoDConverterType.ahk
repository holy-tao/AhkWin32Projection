#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of analog-to-digital (A/D) conversion for a Dolby Digital audio stream. This enumeration is used with the AVEncDDAtoDConverterType property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencddatodconvertertype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncDDAtoDConverterType extends Win32Enum {

    /**
     * Standard.
     * Native name: eAVEncDDAtoDConverterType_Standard
     * @type {Integer (Int32)}
     */
    static Standard => 0

    /**
     * High Definition Compatible Digital (HDCD).
     * Native name: eAVEncDDAtoDConverterType_HDCD
     * @type {Integer (Int32)}
     */
    static HDCD => 1
}
