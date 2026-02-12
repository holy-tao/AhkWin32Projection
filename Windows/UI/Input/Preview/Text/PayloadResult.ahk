#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class PayloadResult extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static InEditing => 0

    /**
     * @type {Integer (Int32)}
     */
    static Pending => 1

    /**
     * @type {Integer (Int32)}
     */
    static Completed => 2

    /**
     * @type {Integer (Int32)}
     */
    static Overridden => 3

    /**
     * @type {Integer (Int32)}
     */
    static Outrun => 4

    /**
     * @type {Integer (Int32)}
     */
    static Rejected => 5

    /**
     * @type {Integer (Int32)}
     */
    static Canceled => 6
}
