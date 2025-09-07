#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class VM_HOST_NOTIFY_STATUS{

    /**
     * @type {Integer (Int32)}
     */
    static VM_HOST_STATUS_INIT_PENDING => 0

    /**
     * @type {Integer (Int32)}
     */
    static VM_HOST_STATUS_INIT_IN_PROGRESS => 1

    /**
     * @type {Integer (Int32)}
     */
    static VM_HOST_STATUS_INIT_COMPLETE => 2

    /**
     * @type {Integer (Int32)}
     */
    static VM_HOST_STATUS_INIT_FAILED => 3
}
