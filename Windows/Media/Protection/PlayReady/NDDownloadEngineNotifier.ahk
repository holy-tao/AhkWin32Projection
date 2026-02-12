#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INDDownloadEngineNotifier.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains methods that a download engine plug-in uses to send notifications to a PlayReady-ND client.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.nddownloadenginenotifier
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class NDDownloadEngineNotifier extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INDDownloadEngineNotifier

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INDDownloadEngineNotifier.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [NDDownloadEngineNotifier](nddownloadenginenotifier.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.NDDownloadEngineNotifier")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Called by the download engine when a stream is opened.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.nddownloadenginenotifier.onstreamopened
     */
    OnStreamOpened() {
        if (!this.HasProp("__INDDownloadEngineNotifier")) {
            if ((queryResult := this.QueryInterface(INDDownloadEngineNotifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDDownloadEngineNotifier := INDDownloadEngineNotifier(outPtr)
        }

        return this.__INDDownloadEngineNotifier.OnStreamOpened()
    }

    /**
     * Called by the download engine once a PlayReady object is received.
     * @param {Integer} dataBytes_length 
     * @param {Pointer<Integer>} dataBytes The byte array that holds the PlayReady object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.nddownloadenginenotifier.onplayreadyobjectreceived
     */
    OnPlayReadyObjectReceived(dataBytes_length, dataBytes) {
        if (!this.HasProp("__INDDownloadEngineNotifier")) {
            if ((queryResult := this.QueryInterface(INDDownloadEngineNotifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDDownloadEngineNotifier := INDDownloadEngineNotifier(outPtr)
        }

        return this.__INDDownloadEngineNotifier.OnPlayReadyObjectReceived(dataBytes_length, dataBytes)
    }

    /**
     * Called by the download engine when a content identifier is received.
     * @param {INDLicenseFetchDescriptor} licenseFetchDescriptor The license from which the download engine receives the content identifier.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.nddownloadenginenotifier.oncontentidreceived
     */
    OnContentIDReceived(licenseFetchDescriptor) {
        if (!this.HasProp("__INDDownloadEngineNotifier")) {
            if ((queryResult := this.QueryInterface(INDDownloadEngineNotifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDDownloadEngineNotifier := INDDownloadEngineNotifier(outPtr)
        }

        return this.__INDDownloadEngineNotifier.OnContentIDReceived(licenseFetchDescriptor)
    }

    /**
     * Called by the download engine when it receives data.
     * @param {Integer} dataBytes_length 
     * @param {Pointer<Integer>} dataBytes The byte array that holds the data.
     * @param {Integer} bytesReceived The number of bytes received from the data stream.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.nddownloadenginenotifier.ondatareceived
     */
    OnDataReceived(dataBytes_length, dataBytes, bytesReceived) {
        if (!this.HasProp("__INDDownloadEngineNotifier")) {
            if ((queryResult := this.QueryInterface(INDDownloadEngineNotifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDDownloadEngineNotifier := INDDownloadEngineNotifier(outPtr)
        }

        return this.__INDDownloadEngineNotifier.OnDataReceived(dataBytes_length, dataBytes, bytesReceived)
    }

    /**
     * Called by the download engine when it reaches the end of a PlayReady-ND media stream.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.nddownloadenginenotifier.onendofstream
     */
    OnEndOfStream() {
        if (!this.HasProp("__INDDownloadEngineNotifier")) {
            if ((queryResult := this.QueryInterface(INDDownloadEngineNotifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDDownloadEngineNotifier := INDDownloadEngineNotifier(outPtr)
        }

        return this.__INDDownloadEngineNotifier.OnEndOfStream()
    }

    /**
     * Called by the download engine if an error occurs during downloading.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.nddownloadenginenotifier.onnetworkerror
     */
    OnNetworkError() {
        if (!this.HasProp("__INDDownloadEngineNotifier")) {
            if ((queryResult := this.QueryInterface(INDDownloadEngineNotifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDDownloadEngineNotifier := INDDownloadEngineNotifier(outPtr)
        }

        return this.__INDDownloadEngineNotifier.OnNetworkError()
    }

;@endregion Instance Methods
}
