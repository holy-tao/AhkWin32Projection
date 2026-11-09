#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_TRANSFER_FIRMWARE_ACTION extends Win32Enum {

    /**
     * Native name: CxlMailboxTransferFWAction_FullFWTransfer
     * @type {Integer (Int32)}
     */
    static TransferFWAction_FullFWTransfer => 0

    /**
     * Native name: CxlMailboxTransferFWAction_InitiateFWTransfer
     * @type {Integer (Int32)}
     */
    static TransferFWAction_InitiateFWTransfer => 1

    /**
     * Native name: CxlMailboxTransferFWAction_ContinueFWTransfer
     * @type {Integer (Int32)}
     */
    static TransferFWAction_ContinueFWTransfer => 2

    /**
     * Native name: CxlMailboxTransferFWAction_EndTransfer
     * @type {Integer (Int32)}
     */
    static TransferFWAction_EndTransfer => 3

    /**
     * Native name: CxlMailboxTransferFWAction_AbortTransfer
     * @type {Integer (Int32)}
     */
    static TransferFWAction_AbortTransfer => 4

    /**
     * Native name: CxlMailboxTransferFWAction_Max
     * @type {Integer (Int32)}
     */
    static TransferFWAction_Max => 5
}
