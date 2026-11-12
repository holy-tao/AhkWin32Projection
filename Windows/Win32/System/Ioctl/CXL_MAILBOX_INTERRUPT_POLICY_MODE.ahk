#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_INTERRUPT_POLICY_MODE extends Win32Enum {

    /**
     * Native name: CxlMailboxInterruptPolicyMode_NoInterrupts
     * @type {Integer (Int32)}
     */
    static NoInterrupts => 0

    /**
     * Native name: CxlMailboxInterruptPolicyMode_MsiMsiX
     * @type {Integer (Int32)}
     */
    static MsiMsiX => 1

    /**
     * Native name: CxlMailboxInterruptPolicyMode_FwInterrupt
     * @type {Integer (Int32)}
     */
    static FwInterrupt => 2

    /**
     * Native name: CxlMailboxInterruptPolicyMode_Reserved
     * @type {Integer (Int32)}
     */
    static Reserved => 3
}
