#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class KD_NAMESPACE_ENUM extends Win32Enum {

    /**
     * Native name: KdNameSpacePCI
     * @type {Integer (Int32)}
     */
    static NameSpacePCI => 0

    /**
     * Native name: KdNameSpaceACPI
     * @type {Integer (Int32)}
     */
    static NameSpaceACPI => 1

    /**
     * Native name: KdNameSpaceAny
     * @type {Integer (Int32)}
     */
    static NameSpaceAny => 2

    /**
     * Native name: KdNameSpaceNone
     * @type {Integer (Int32)}
     */
    static NameSpaceNone => 3

    /**
     * Native name: KdNameSpaceMax
     * @type {Integer (Int32)}
     */
    static NameSpaceMax => 4
}
