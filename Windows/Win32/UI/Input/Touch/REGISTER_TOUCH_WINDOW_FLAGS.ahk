#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.Touch
 * @version v4.0.30319
 */
class REGISTER_TOUCH_WINDOW_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static TWF_FINETOUCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TWF_WANTPALM => 2
}
