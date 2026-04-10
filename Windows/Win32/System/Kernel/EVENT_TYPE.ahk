#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Kernel
 */
class EVENT_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static NotificationEvent => 0

    /**
     * @type {Integer (Int32)}
     */
    static SynchronizationEvent => 1
}
