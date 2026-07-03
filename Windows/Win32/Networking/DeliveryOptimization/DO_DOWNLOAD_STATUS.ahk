#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DODownloadState.ahk" { DODownloadState }

/**
 * Used to obtain the status of a specific download.
 * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/ns-deliveryoptimization-do_download_status
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 */
export default struct DO_DOWNLOAD_STATUS {
    #StructPack 8

    /**
     * The total number of bytes to download.
     */
    BytesTotal : Int64

    /**
     * The number of bytes that have already been downloaded.
     */
    BytesTransferred : Int64

    /**
     * The current download state as defined by the **DODownloadState** enumeration.
     */
    State : DODownloadState

    /**
     * The error information (if it exists) that is associated with the current download.
     */
    Error : HRESULT

    /**
     * The extended error information (if it exists) that is associated with the current download.
     */
    ExtendedError : HRESULT

}
