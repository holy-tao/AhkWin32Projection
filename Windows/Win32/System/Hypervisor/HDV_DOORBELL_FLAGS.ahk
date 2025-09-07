#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class HDV_DOORBELL_FLAGS{

    /**
     * @type {Integer (Int32)}
     */
    static HDV_DOORBELL_FLAG_TRIGGER_SIZE_ANY => 0

    /**
     * @type {Integer (Int32)}
     */
    static HDV_DOORBELL_FLAG_TRIGGER_SIZE_BYTE => 1

    /**
     * @type {Integer (Int32)}
     */
    static HDV_DOORBELL_FLAG_TRIGGER_SIZE_WORD => 2

    /**
     * @type {Integer (Int32)}
     */
    static HDV_DOORBELL_FLAG_TRIGGER_SIZE_DWORD => 3

    /**
     * @type {Integer (Int32)}
     */
    static HDV_DOORBELL_FLAG_TRIGGER_SIZE_QWORD => 4

    /**
     * @type {Integer (Int32)}
     */
    static HDV_DOORBELL_FLAG_TRIGGER_ANY_VALUE => -2147483648
}
