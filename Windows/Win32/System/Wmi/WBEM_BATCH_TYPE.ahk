#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 */
class WBEM_BATCH_TYPE extends Win32Enum {

    /**
     * Native name: WBEM_FLAG_BATCH_IF_NEEDED
     * @type {Integer (Int32)}
     */
    static FLAG_BATCH_IF_NEEDED => 0

    /**
     * Native name: WBEM_FLAG_MUST_BATCH
     * @type {Integer (Int32)}
     */
    static FLAG_MUST_BATCH => 1

    /**
     * Native name: WBEM_FLAG_MUST_NOT_BATCH
     * @type {Integer (Int32)}
     */
    static FLAG_MUST_NOT_BATCH => 2
}
