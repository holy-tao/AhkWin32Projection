#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INDClient.ahk
#Include .\INDClientFactory.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\NDClient.ahk
#Include .\INDRegistrationCompletedEventArgs.ahk
#Include .\INDProximityDetectionCompletedEventArgs.ahk
#Include .\INDLicenseFetchCompletedEventArgs.ahk
#Include .\INDClosedCaptionDataReceivedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Creates PlayReady-ND sessions, coordinates with the download engine and the stream parser (for example, an MPEG-2 demuxer), manages the sample buffer, and listens to media stream source events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndclient
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class NDClient extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INDClient

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INDClient.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of the [NDClient](ndclient.md) class.
     * @param {INDDownloadEngine} downloadEngine The download engine used to stream protected media content from a transmitter.
     * @param {INDStreamParser} streamParser The stream parser used to parse data from a media stream.
     * @param {INDMessenger} pMessenger The messenger used to send messages between the PlayReady-ND receiver and transmitter.
     * @returns {NDClient} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndclient.#ctor
     */
    static CreateInstance(downloadEngine, streamParser, pMessenger) {
        if (!NDClient.HasProp("__INDClientFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.NDClient")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INDClientFactory.IID)
            NDClient.__INDClientFactory := INDClientFactory(factoryPtr)
        }

        return NDClient.__INDClientFactory.CreateInstance(downloadEngine, streamParser, pMessenger)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnRegistrationCompletedToken")) {
            this.remove_RegistrationCompleted(this.__OnRegistrationCompletedToken)
            this.__OnRegistrationCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnProximityDetectionCompletedToken")) {
            this.remove_ProximityDetectionCompleted(this.__OnProximityDetectionCompletedToken)
            this.__OnProximityDetectionCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnLicenseFetchCompletedToken")) {
            this.remove_LicenseFetchCompleted(this.__OnLicenseFetchCompletedToken)
            this.__OnLicenseFetchCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnReRegistrationNeededToken")) {
            this.remove_ReRegistrationNeeded(this.__OnReRegistrationNeededToken)
            this.__OnReRegistrationNeeded.iface.Dispose()
        }

        if(this.HasProp("__OnClosedCaptionDataReceivedToken")) {
            this.remove_ClosedCaptionDataReceived(this.__OnClosedCaptionDataReceivedToken)
            this.__OnClosedCaptionDataReceived.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<NDClient, INDRegistrationCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RegistrationCompleted(handler) {
        if (!this.HasProp("__INDClient")) {
            if ((queryResult := this.QueryInterface(INDClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDClient := INDClient(outPtr)
        }

        return this.__INDClient.add_RegistrationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RegistrationCompleted(token) {
        if (!this.HasProp("__INDClient")) {
            if ((queryResult := this.QueryInterface(INDClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDClient := INDClient(outPtr)
        }

        return this.__INDClient.remove_RegistrationCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<NDClient, INDProximityDetectionCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ProximityDetectionCompleted(handler) {
        if (!this.HasProp("__INDClient")) {
            if ((queryResult := this.QueryInterface(INDClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDClient := INDClient(outPtr)
        }

        return this.__INDClient.add_ProximityDetectionCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ProximityDetectionCompleted(token) {
        if (!this.HasProp("__INDClient")) {
            if ((queryResult := this.QueryInterface(INDClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDClient := INDClient(outPtr)
        }

        return this.__INDClient.remove_ProximityDetectionCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<NDClient, INDLicenseFetchCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LicenseFetchCompleted(handler) {
        if (!this.HasProp("__INDClient")) {
            if ((queryResult := this.QueryInterface(INDClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDClient := INDClient(outPtr)
        }

        return this.__INDClient.add_LicenseFetchCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LicenseFetchCompleted(token) {
        if (!this.HasProp("__INDClient")) {
            if ((queryResult := this.QueryInterface(INDClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDClient := INDClient(outPtr)
        }

        return this.__INDClient.remove_LicenseFetchCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<NDClient, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReRegistrationNeeded(handler) {
        if (!this.HasProp("__INDClient")) {
            if ((queryResult := this.QueryInterface(INDClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDClient := INDClient(outPtr)
        }

        return this.__INDClient.add_ReRegistrationNeeded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReRegistrationNeeded(token) {
        if (!this.HasProp("__INDClient")) {
            if ((queryResult := this.QueryInterface(INDClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDClient := INDClient(outPtr)
        }

        return this.__INDClient.remove_ReRegistrationNeeded(token)
    }

    /**
     * 
     * @param {TypedEventHandler<NDClient, INDClosedCaptionDataReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ClosedCaptionDataReceived(handler) {
        if (!this.HasProp("__INDClient")) {
            if ((queryResult := this.QueryInterface(INDClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDClient := INDClient(outPtr)
        }

        return this.__INDClient.add_ClosedCaptionDataReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ClosedCaptionDataReceived(token) {
        if (!this.HasProp("__INDClient")) {
            if ((queryResult := this.QueryInterface(INDClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDClient := INDClient(outPtr)
        }

        return this.__INDClient.remove_ClosedCaptionDataReceived(token)
    }

    /**
     * Starts the registration, proximity detection, and license fetch procedures between a client receiver and a transmitter.
     * @remarks
     * This method sets up a PlayReady-ND session with a transmitter and notifies the download engine to begin streaming content as soon as it has established the session.
     * 
     * This method also notifies listeners that each task has completed by firing the appropriate [ClosedCaptionDataReceived](ndclient_closedcaptiondatareceived.md), [LicenseFetchCompleted](ndclient_licensefetchcompleted.md), [ProximityDetectionCompleted](ndclient_proximitydetectioncompleted.md), [RegistrationCompleted](ndclient_registrationcompleted.md), and [ReRegistrationNeeded](ndclient_reregistrationneeded.md) events.
     * @param {Uri} contentUrl The URL of the streamed content.
     * @param {Integer} startAsyncOptions The asynchronous start options. See the [NDStartAsyncOptions](ndstartasyncoptions.md) enumeration for a detailed description of these options.
     * @param {INDCustomData} registrationCustomData The custom data type identifier that is used for registration with the transmitter.
     * @param {INDLicenseFetchDescriptor} licenseFetchDescriptor The descriptor used for license fetching.
     * @returns {IAsyncOperation<INDStartResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndclient.startasync
     */
    StartAsync(contentUrl, startAsyncOptions, registrationCustomData, licenseFetchDescriptor) {
        if (!this.HasProp("__INDClient")) {
            if ((queryResult := this.QueryInterface(INDClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDClient := INDClient(outPtr)
        }

        return this.__INDClient.StartAsync(contentUrl, startAsyncOptions, registrationCustomData, licenseFetchDescriptor)
    }

    /**
     * Performs a license fetch between a client receiver and a transmitter.
     * @remarks
     * Apps typically call this method during key rotation for new root licenses.
     * @param {INDLicenseFetchDescriptor} licenseFetchDescriptor Descriptor for the license being fetched.
     * @returns {IAsyncOperation<INDLicenseFetchResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndclient.licensefetchasync
     */
    LicenseFetchAsync(licenseFetchDescriptor) {
        if (!this.HasProp("__INDClient")) {
            if ((queryResult := this.QueryInterface(INDClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDClient := INDClient(outPtr)
        }

        return this.__INDClient.LicenseFetchAsync(licenseFetchDescriptor)
    }

    /**
     * Performs a proximity detection and reregistration between a client receiver and a transmitter.
     * @remarks
     * The PlayReady Network Device (PRND) protocol requires a receiver to reregister with a transmitter within 48 hours after a successful proximity detection operation so that the receiver can continue to receive protected data from the transmitter. An app should call this method immediately after it receives a [ReRegistrationNeeded](ndclient_reregistrationneeded.md) event.
     * @param {INDCustomData} registrationCustomData Custom data for the registration request.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndclient.reregistrationasync
     */
    ReRegistrationAsync(registrationCustomData) {
        if (!this.HasProp("__INDClient")) {
            if ((queryResult := this.QueryInterface(INDClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDClient := INDClient(outPtr)
        }

        return this.__INDClient.ReRegistrationAsync(registrationCustomData)
    }

    /**
     * Closes the current playback session regardless of whether it is in the registration, proximity detection, license fetch, or play state.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndclient.close
     */
    Close() {
        if (!this.HasProp("__INDClient")) {
            if ((queryResult := this.QueryInterface(INDClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDClient := INDClient(outPtr)
        }

        return this.__INDClient.Close()
    }

;@endregion Instance Methods
}
