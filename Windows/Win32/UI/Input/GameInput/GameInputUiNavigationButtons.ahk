#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputUiNavigationButtons extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUiNavigationNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUiNavigationMenu => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUiNavigationView => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUiNavigationAccept => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUiNavigationCancel => 8

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUiNavigationUp => 16

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUiNavigationDown => 32

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUiNavigationLeft => 64

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUiNavigationRight => 128

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUiNavigationContext1 => 256

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUiNavigationContext2 => 512

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUiNavigationContext3 => 1024

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUiNavigationContext4 => 2048

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUiNavigationPageUp => 4096

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUiNavigationPageDown => 8192

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUiNavigationPageLeft => 16384

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUiNavigationPageRight => 32768

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUiNavigationScrollUp => 65536

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUiNavigationScrollDown => 131072

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUiNavigationScrollLeft => 262144

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUiNavigationScrollRight => 524288
}
