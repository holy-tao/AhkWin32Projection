#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains progress information for a data transfer operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.transferprogress
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class TransferProgress extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The number of bytes sent.
     * @type {Integer}
     */
    BytesSent {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The total number of bytes that will be sent during the transfer operation.
     * @type {Integer}
     */
    TotalBytesToSend {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of bytes received.
     * @type {Integer}
     */
    BytesRetrieved {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The total number of bytes that will be received during the transfer operation.
     * @type {Integer}
     */
    TotalBytesToRetrieve {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
