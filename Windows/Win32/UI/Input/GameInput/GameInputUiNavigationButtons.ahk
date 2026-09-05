#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputUiNavigationButtons extends Win32BitflagEnum {

    /**
     * Native name: GameInputUiNavigationNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: GameInputUiNavigationMenu
     * @type {Integer (Int32)}
     */
    static Menu => 1

    /**
     * Native name: GameInputUiNavigationView
     * @type {Integer (Int32)}
     */
    static View => 2

    /**
     * Native name: GameInputUiNavigationAccept
     * @type {Integer (Int32)}
     */
    static Accept => 4

    /**
     * Native name: GameInputUiNavigationCancel
     * @type {Integer (Int32)}
     */
    static Cancel => 8

    /**
     * Native name: GameInputUiNavigationUp
     * @type {Integer (Int32)}
     */
    static Up => 16

    /**
     * Native name: GameInputUiNavigationDown
     * @type {Integer (Int32)}
     */
    static Down => 32

    /**
     * Native name: GameInputUiNavigationLeft
     * @type {Integer (Int32)}
     */
    static Left => 64

    /**
     * Native name: GameInputUiNavigationRight
     * @type {Integer (Int32)}
     */
    static Right => 128

    /**
     * Native name: GameInputUiNavigationContext1
     * @type {Integer (Int32)}
     */
    static Context1 => 256

    /**
     * Native name: GameInputUiNavigationContext2
     * @type {Integer (Int32)}
     */
    static Context2 => 512

    /**
     * Native name: GameInputUiNavigationContext3
     * @type {Integer (Int32)}
     */
    static Context3 => 1024

    /**
     * Native name: GameInputUiNavigationContext4
     * @type {Integer (Int32)}
     */
    static Context4 => 2048

    /**
     * Native name: GameInputUiNavigationPageUp
     * @type {Integer (Int32)}
     */
    static PageUp => 4096

    /**
     * Native name: GameInputUiNavigationPageDown
     * @type {Integer (Int32)}
     */
    static PageDown => 8192

    /**
     * Native name: GameInputUiNavigationPageLeft
     * @type {Integer (Int32)}
     */
    static PageLeft => 16384

    /**
     * Native name: GameInputUiNavigationPageRight
     * @type {Integer (Int32)}
     */
    static PageRight => 32768

    /**
     * Native name: GameInputUiNavigationScrollUp
     * @type {Integer (Int32)}
     */
    static ScrollUp => 65536

    /**
     * Native name: GameInputUiNavigationScrollDown
     * @type {Integer (Int32)}
     */
    static ScrollDown => 131072

    /**
     * Native name: GameInputUiNavigationScrollLeft
     * @type {Integer (Int32)}
     */
    static ScrollLeft => 262144

    /**
     * Native name: GameInputUiNavigationScrollRight
     * @type {Integer (Int32)}
     */
    static ScrollRight => 524288
}
