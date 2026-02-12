#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class TextChangeSource extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static External => 0

    /**
     * @type {Integer (Int32)}
     */
    static HardwareKeyTyped => 1

    /**
     * @type {Integer (Int32)}
     */
    static SoftwareKeyTyped => 2

    /**
     * @type {Integer (Int32)}
     */
    static KeyboardImeInsertion => 3

    /**
     * @type {Integer (Int32)}
     */
    static OtherImeInsertion => 4

    /**
     * @type {Integer (Int32)}
     */
    static Reconversion => 5

    /**
     * @type {Integer (Int32)}
     */
    static AutoCompletion => 6

    /**
     * @type {Integer (Int32)}
     */
    static Mixed => 7
}
