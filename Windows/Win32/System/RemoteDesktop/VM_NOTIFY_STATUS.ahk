#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class VM_NOTIFY_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static VM_NOTIFY_STATUS_PENDING => 0

    /**
     * @type {Integer (Int32)}
     */
    static VM_NOTIFY_STATUS_IN_PROGRESS => 1

    /**
     * @type {Integer (Int32)}
     */
    static VM_NOTIFY_STATUS_COMPLETE => 2

    /**
     * @type {Integer (Int32)}
     */
    static VM_NOTIFY_STATUS_FAILED => 3

    /**
     * @type {Integer (Int32)}
     */
    static VM_NOTIFY_STATUS_CANCELED => 4
}
