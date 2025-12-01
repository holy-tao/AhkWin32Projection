#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the MPEG audio layer. This enumeration is used with the AVEncMPALayer property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencmpalayer
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncMPALayer extends Win32Enum{

    /**
     * MPEG Audio Layer-1.
     * @type {Integer (Int32)}
     */
    static eAVEncMPALayer_1 => 1

    /**
     * MPEG Audio Layer-2.
     * @type {Integer (Int32)}
     */
    static eAVEncMPALayer_2 => 2

    /**
     * MPEG Audio Layer-3.
     * @type {Integer (Int32)}
     */
    static eAVEncMPALayer_3 => 3
}
