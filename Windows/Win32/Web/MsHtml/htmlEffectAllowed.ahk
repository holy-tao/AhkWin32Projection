#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlEffectAllowed extends Win32Enum {

    /**
     * Native name: htmlEffectAllowedCopy
     * @type {Integer (Int32)}
     */
    static Copy => 0

    /**
     * Native name: htmlEffectAllowedLink
     * @type {Integer (Int32)}
     */
    static Link => 1

    /**
     * Native name: htmlEffectAllowedMove
     * @type {Integer (Int32)}
     */
    static Move => 2

    /**
     * Native name: htmlEffectAllowedCopyLink
     * @type {Integer (Int32)}
     */
    static CopyLink => 3

    /**
     * Native name: htmlEffectAllowedCopyMove
     * @type {Integer (Int32)}
     */
    static CopyMove => 4

    /**
     * Native name: htmlEffectAllowedLinkMove
     * @type {Integer (Int32)}
     */
    static LinkMove => 5

    /**
     * Native name: htmlEffectAllowedAll
     * @type {Integer (Int32)}
     */
    static All => 6

    /**
     * Native name: htmlEffectAllowedNone
     * @type {Integer (Int32)}
     */
    static None => 7

    /**
     * Native name: htmlEffectAllowedUninitialized
     * @type {Integer (Int32)}
     */
    static Uninitialized => 8

    /**
     * Native name: htmlEffectAllowed_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
