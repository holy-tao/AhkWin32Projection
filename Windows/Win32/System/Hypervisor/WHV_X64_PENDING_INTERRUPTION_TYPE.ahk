#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
class WHV_X64_PENDING_INTERRUPTION_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64PendingInterrupt => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64PendingNmi => 2

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64PendingException => 3
}
