#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @architecture X64
 */
class WHV_X64_PENDING_EVENT_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64PendingEventException => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64PendingEventExtInt => 5

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64PendingEventSvmNestedExit => 7

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64PendingEventVmxNestedExit => 8
}
