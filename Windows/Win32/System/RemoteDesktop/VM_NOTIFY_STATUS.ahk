#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class VM_NOTIFY_STATUS extends Win32Enum {

    /**
     * Native name: VM_NOTIFY_STATUS_PENDING
     * @type {Integer (Int32)}
     */
    static PENDING => 0

    /**
     * Native name: VM_NOTIFY_STATUS_IN_PROGRESS
     * @type {Integer (Int32)}
     */
    static IN_PROGRESS => 1

    /**
     * Native name: VM_NOTIFY_STATUS_COMPLETE
     * @type {Integer (Int32)}
     */
    static COMPLETE => 2

    /**
     * Native name: VM_NOTIFY_STATUS_FAILED
     * @type {Integer (Int32)}
     */
    static FAILED => 3

    /**
     * Native name: VM_NOTIFY_STATUS_CANCELED
     * @type {Integer (Int32)}
     */
    static CANCELED => 4
}
