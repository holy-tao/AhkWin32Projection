#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of de-emphasis filter that should be used when decoding. This enumeration is used with the AVEncMPAEmphasisType property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencmpaemphasistype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncMPAEmphasisType extends Win32Enum {

    /**
     * None.
     * Native name: eAVEncMPAEmphasisType_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * 50/15 Î¼s.
     * Native name: eAVEncMPAEmphasisType_50_15
     * @type {Integer (Int32)}
     */
    static 50_15 => 1

    /**
     * Reserved.
     * Native name: eAVEncMPAEmphasisType_Reserved
     * @type {Integer (Int32)}
     */
    static Reserved => 2

    /**
     * CCITT J.17.
     * Native name: eAVEncMPAEmphasisType_CCITT_J17
     * @type {Integer (Int32)}
     */
    static CCITT_J17 => 3
}
