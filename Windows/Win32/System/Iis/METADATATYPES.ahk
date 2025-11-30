#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class METADATATYPES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ALL_METADATA => 0

    /**
     * @type {Integer (Int32)}
     */
    static DWORD_METADATA => 1

    /**
     * @type {Integer (Int32)}
     */
    static STRING_METADATA => 2

    /**
     * @type {Integer (Int32)}
     */
    static BINARY_METADATA => 3

    /**
     * @type {Integer (Int32)}
     */
    static EXPANDSZ_METADATA => 4

    /**
     * @type {Integer (Int32)}
     */
    static MULTISZ_METADATA => 5

    /**
     * @type {Integer (Int32)}
     */
    static INVALID_END_METADATA => 6
}
