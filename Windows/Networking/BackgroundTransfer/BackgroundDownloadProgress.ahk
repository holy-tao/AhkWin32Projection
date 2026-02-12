#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains status information about the download operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounddownloadprogress
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class BackgroundDownloadProgress extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The total number of data bytes received. This value does not include bytes received as response headers. Download operations can be restarted (for example, after a network outage). When operations are restarted, they might have to discard previously downloaded bytes and therefore the number of bytes downloaded might not always increase from one report to the next.
     * @type {Integer}
     */
    BytesReceived {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The total number of bytes of data to download. If this number is unknown, this value is set to 0.
     * @type {Integer}
     */
    TotalBytesToReceive {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A [BackgroundTransferStatus](backgroundtransferstatus.md) containing the current status of the download operation.
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * **true** if the download request response has changed; otherwise, **false**.
     * 
     * Whenever new response information is available due to a new request being invoked, this field is set to true. The application can then choose to read the new response information and update its state, if needed.
     * @type {Boolean}
     */
    HasResponseChanged {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * **true** if a data transfer operation has restarted; otherwise **false**.
     * 
     * When a download is interrupted and a new request is sent to the server to resume the download, **HasRestarted** is set to **true** if the server does not support resume and the download had to start over.
     * 
     * **HasRestarted** is set to **true** only in the first progress notification sent after the restart. After the first progress notification, **HasRestarted** is set to **false** in later notifications.
     * @type {Boolean}
     */
    HasRestarted {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
