#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class SYNTHETIC_DEVICE_CREATION_OPTIONS extends Win32BitflagEnum {

    /**
     * @type {Integer (Int32)}
     */
    static SDCO_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SDCO_PHYSICAL_SIZE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SDCO_TOUCHPAD_GESTURE_ONLY => 2
}
