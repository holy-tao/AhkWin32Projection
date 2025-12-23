#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class ENABLECALLBACK_ENABLED_STATE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_CONTROL_CODE_DISABLE_PROVIDER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_CONTROL_CODE_ENABLE_PROVIDER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_CONTROL_CODE_CAPTURE_STATE => 2
}
