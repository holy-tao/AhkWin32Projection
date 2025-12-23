#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of de-emphasis filter that should be used when decoding. This enumeration is used with the AVEncMPAEmphasisType property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencmpaemphasistype
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncMPAEmphasisType extends Win32Enum{

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static eAVEncMPAEmphasisType_None => 0

    /**
     * 50/15 Î¼s.
     * @type {Integer (Int32)}
     */
    static eAVEncMPAEmphasisType_50_15 => 1

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static eAVEncMPAEmphasisType_Reserved => 2

    /**
     * CCITT J.17.
     * @type {Integer (Int32)}
     */
    static eAVEncMPAEmphasisType_CCITT_J17 => 3
}
