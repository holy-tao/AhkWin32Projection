#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
class HDV_DOORBELL_FLAGS extends Win32Enum {

    /**
     * Native name: HDV_DOORBELL_FLAG_TRIGGER_SIZE_ANY
     * @type {Integer (Int32)}
     */
    static FLAG_TRIGGER_SIZE_ANY => 0

    /**
     * Native name: HDV_DOORBELL_FLAG_TRIGGER_SIZE_BYTE
     * @type {Integer (Int32)}
     */
    static FLAG_TRIGGER_SIZE_BYTE => 1

    /**
     * Native name: HDV_DOORBELL_FLAG_TRIGGER_SIZE_WORD
     * @type {Integer (Int32)}
     */
    static FLAG_TRIGGER_SIZE_WORD => 2

    /**
     * Native name: HDV_DOORBELL_FLAG_TRIGGER_SIZE_DWORD
     * @type {Integer (Int32)}
     */
    static FLAG_TRIGGER_SIZE_DWORD => 3

    /**
     * Native name: HDV_DOORBELL_FLAG_TRIGGER_SIZE_QWORD
     * @type {Integer (Int32)}
     */
    static FLAG_TRIGGER_SIZE_QWORD => 4

    /**
     * Native name: HDV_DOORBELL_FLAG_TRIGGER_ANY_VALUE
     * @type {Integer (Int32)}
     */
    static FLAG_TRIGGER_ANY_VALUE => -2147483648
}
