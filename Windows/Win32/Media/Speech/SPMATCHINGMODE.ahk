#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPMATCHINGMODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AllWords => 0

    /**
     * @type {Integer (Int32)}
     */
    static Subsequence => 1

    /**
     * @type {Integer (Int32)}
     */
    static OrderedSubset => 3

    /**
     * @type {Integer (Int32)}
     */
    static SubsequenceContentRequired => 5

    /**
     * @type {Integer (Int32)}
     */
    static OrderedSubsetContentRequired => 7
}
