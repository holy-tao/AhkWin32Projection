#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to obtain the status of a specific download.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/ns-deliveryoptimization-do_download_status
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 * @version v4.0.30319
 */
class DO_DOWNLOAD_STATUS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The total number of bytes to download.
     * @type {Integer}
     */
    BytesTotal {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of bytes that have already been downloaded.
     * @type {Integer}
     */
    BytesTransferred {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The current download state as defined by the **DODownloadState** enumeration.
     * @type {Integer}
     */
    State {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The error information (if it exists) that is associated with the current download.
     * @type {HRESULT}
     */
    Error {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * The extended error information (if it exists) that is associated with the current download.
     * @type {HRESULT}
     */
    ExtendedError {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
