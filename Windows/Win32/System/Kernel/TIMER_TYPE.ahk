#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Kernel
 * @version v4.0.30319
 */
class TIMER_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NotificationTimer => 0

    /**
     * @type {Integer (Int32)}
     */
    static SynchronizationTimer => 1
}
