#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UNumberRangeIdentityFallback extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_IDENTITY_FALLBACK_SINGLE_VALUE => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_IDENTITY_FALLBACK_APPROXIMATELY_OR_SINGLE_VALUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_IDENTITY_FALLBACK_APPROXIMATELY => 2

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_IDENTITY_FALLBACK_RANGE => 3
}
