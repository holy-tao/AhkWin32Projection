#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates a pin's direction.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-pin_direction
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class PIN_DIRECTION{

    /**
     * Input pin.
     * @type {Integer (Int32)}
     */
    static PINDIR_INPUT => 0

    /**
     * Output pin.
     * @type {Integer (Int32)}
     */
    static PINDIR_OUTPUT => 1
}
