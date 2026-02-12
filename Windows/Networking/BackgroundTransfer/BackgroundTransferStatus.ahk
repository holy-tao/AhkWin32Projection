#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines transfer operation status values.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransferstatus
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class BackgroundTransferStatus extends Win32Enum{

    /**
     * The application is idle.
     * @type {Integer (Int32)}
     */
    static Idle => 0

    /**
     * The transfer is currently in progress.
     * @type {Integer (Int32)}
     */
    static Running => 1

    /**
     * The application has paused the transfer operation.
     * @type {Integer (Int32)}
     */
    static PausedByApplication => 2

    /**
     * The transfer operation is paused due to cost policy (for example, transitioned to a costed network).
     * @type {Integer (Int32)}
     */
    static PausedCostedNetwork => 3

    /**
     * The transfer operation is paused due to a lack of network connectivity.
     * @type {Integer (Int32)}
     */
    static PausedNoNetwork => 4

    /**
     * The transfer operation has completed.
     * @type {Integer (Int32)}
     */
    static Completed => 5

    /**
     * The transfer operation has been cancelled.
     * @type {Integer (Int32)}
     */
    static Canceled => 6

    /**
     * An error was encountered during the transfer operation.
     * @type {Integer (Int32)}
     */
    static Error => 7

    /**
     * One of the app-configured recoverable web error statuses ([RecoverableWebErrorStatuses](downloadoperation_recoverableweberrorstatuses.md)).
     * @type {Integer (Int32)}
     */
    static PausedRecoverableWebErrorStatus => 8

    /**
     * The transfer is paused by the system due to resource constraints. Examples of constraints include the system being on Battery Saver when the application is not in the foreground.
     * @type {Integer (Int32)}
     */
    static PausedSystemPolicy => 32
}
