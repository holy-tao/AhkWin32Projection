#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Memory
 */
class MEMORY_RESOURCE_NOTIFICATION_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static LowMemoryResourceNotification => 0

    /**
     * @type {Integer (Int32)}
     */
    static HighMemoryResourceNotification => 1
}
