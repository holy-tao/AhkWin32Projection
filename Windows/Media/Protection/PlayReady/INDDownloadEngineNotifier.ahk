#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Contains methods that a download engine plug-in uses to send notifications to a PlayReady-ND client.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.inddownloadenginenotifier
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class INDDownloadEngineNotifier extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INDDownloadEngineNotifier
     * @type {Guid}
     */
    static IID => Guid("{d720b4d4-f4b8-4530-a809-9193a571e7fc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnStreamOpened", "OnPlayReadyObjectReceived", "OnContentIDReceived", "OnDataReceived", "OnEndOfStream", "OnNetworkError"]

    /**
     * Called by the download engine when a stream is opened.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.inddownloadenginenotifier.onstreamopened
     */
    OnStreamOpened() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called by the download engine once a PlayReady object is received.
     * @param {Integer} dataBytes_length 
     * @param {Pointer<Integer>} dataBytes The byte array that holds the PlayReady object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.inddownloadenginenotifier.onplayreadyobjectreceived
     */
    OnPlayReadyObjectReceived(dataBytes_length, dataBytes) {
        dataBytesMarshal := dataBytes is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "uint", dataBytes_length, dataBytesMarshal, dataBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called by the download engine when a content identifier is received.
     * @param {INDLicenseFetchDescriptor} licenseFetchDescriptor The license from which the download engine receives the content identifier.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.inddownloadenginenotifier.oncontentidreceived
     */
    OnContentIDReceived(licenseFetchDescriptor) {
        result := ComCall(8, this, "ptr", licenseFetchDescriptor, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called by the download engine when it receives data.
     * @param {Integer} dataBytes_length 
     * @param {Pointer<Integer>} dataBytes The byte array that holds the data.
     * @param {Integer} bytesReceived The number of bytes received from the data stream.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.inddownloadenginenotifier.ondatareceived
     */
    OnDataReceived(dataBytes_length, dataBytes, bytesReceived) {
        dataBytesMarshal := dataBytes is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "uint", dataBytes_length, dataBytesMarshal, dataBytes, "uint", bytesReceived, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called by the download engine when it reaches the end of a PlayReady-ND media stream.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.inddownloadenginenotifier.onendofstream
     */
    OnEndOfStream() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called by the download engine if an error occurs during downloading.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.inddownloadenginenotifier.onnetworkerror
     */
    OnNetworkError() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
