#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains status information about the upload operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploadprogress
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class BackgroundUploadProgress extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The total number of bytes received. This value does not include bytes received as part of response headers. If the upload operation has restarted, this value may be smaller than in the previous progress report.
     * @type {Integer}
     */
    BytesReceived {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The total number of bytes sent. If the upload operation has restarted, this value may be smaller than in the previous progress report.
     * @type {Integer}
     */
    BytesSent {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The total number of bytes of data to upload. If this number is unknown, this value is set to 0.
     * @type {Integer}
     */
    TotalBytesToReceive {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The total number of bytes to upload.
     * @type {Integer}
     */
    TotalBytesToSend {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The current status of the upload operation.
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * TRUE if the upload request response has changed; otherwise, FALSE.
     * 
     * Whenever new response information is available due to a new request being invoked, this field is set to true. The application can then choose to read the new response information and update its state, if needed.
     * @type {Boolean}
     */
    HasResponseChanged {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * **true** if a upload transfer operation has restarted; otherwise **false**.
     * 
     * Uploads cannot be resumed. Whenever a new request is sent to the server to restart the upload, this property is set to **true** in the first progress notification for the new request. After the first progress notification, **HasRestarted** is set to **false** in later notifications.
     * @type {Boolean}
     */
    HasRestarted {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}
