#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class KD_NAMESPACE_ENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KdNameSpacePCI => 0

    /**
     * @type {Integer (Int32)}
     */
    static KdNameSpaceACPI => 1

    /**
     * @type {Integer (Int32)}
     */
    static KdNameSpaceAny => 2

    /**
     * @type {Integer (Int32)}
     */
    static KdNameSpaceNone => 3

    /**
     * @type {Integer (Int32)}
     */
    static KdNameSpaceMax => 4
}
