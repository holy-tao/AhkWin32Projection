#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the priority that a BackgroundTransfer operation(download or upload) has in terms of scheduling within an app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransferpriority
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class BackgroundTransferPriority extends Win32Enum{

    /**
     * Default priority setting for an operation. By default when a new operation is created, it is placed at the end of the current transfer queue.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * High priority setting for an operation. Ensures that the operation doesn't get placed at the very end of the queue, and is instead placed near the front.
     * @type {Integer (Int32)}
     */
    static High => 1

    /**
     * Low priority setting for an operation. Ensures that the operation doesn't get placed at the very front of the queue, and is instead placed near the end.
     * @type {Integer (Int32)}
     */
    static Low => 2
}
