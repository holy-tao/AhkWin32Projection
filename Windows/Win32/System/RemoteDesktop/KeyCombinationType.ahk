#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class KeyCombinationType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KeyCombinationHome => 0

    /**
     * @type {Integer (Int32)}
     */
    static KeyCombinationLeft => 1

    /**
     * @type {Integer (Int32)}
     */
    static KeyCombinationUp => 2

    /**
     * @type {Integer (Int32)}
     */
    static KeyCombinationRight => 3

    /**
     * @type {Integer (Int32)}
     */
    static KeyCombinationDown => 4

    /**
     * @type {Integer (Int32)}
     */
    static KeyCombinationScroll => 5
}
