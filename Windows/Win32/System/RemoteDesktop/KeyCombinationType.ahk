#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class KeyCombinationType extends Win32Enum {

    /**
     * Native name: KeyCombinationHome
     * @type {Integer (Int32)}
     */
    static Home => 0

    /**
     * Native name: KeyCombinationLeft
     * @type {Integer (Int32)}
     */
    static Left => 1

    /**
     * Native name: KeyCombinationUp
     * @type {Integer (Int32)}
     */
    static Up => 2

    /**
     * Native name: KeyCombinationRight
     * @type {Integer (Int32)}
     */
    static Right => 3

    /**
     * Native name: KeyCombinationDown
     * @type {Integer (Int32)}
     */
    static Down => 4

    /**
     * Native name: KeyCombinationScroll
     * @type {Integer (Int32)}
     */
    static Scroll => 5
}
