#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaExtensionManager.ahk
#Include .\IMediaExtensionManager2.ahk
#Include ..\..\Guid.ahk

/**
 * Registers a media parser or codec.
 * @remarks
 * Media extensions have the following limitations.
 * 
 * + A plugin can override inbox media formats.
 * + The registration is local to the application and does not affect other applications.
 * + The registration persists for the lifetime of the MediaExtensionManager instance. 
 * <!--ie the app process lifetime. Need to figure out what that means exactly in a MoApp with MoLifetime MoState MoManagement.-->
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaextensionmanager
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class MediaExtensionManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaExtensionManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaExtensionManager.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Creates a new [MediaExtensionManager](mediaextensionmanager.md) object that is used to register a media parser or codec.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaExtensionManager")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Registers a scheme handler for the specified URL scheme.
     * @param {HSTRING} activatableClassId The class identifier of the activatable runtime class of the scheme handler. The runtime class must implement the [IMediaExtension](imediaextension.md) interface.
     * @param {HSTRING} scheme The URL scheme that will be recognized to invoke the scheme handler. For example, "myscheme://".
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaextensionmanager.registerschemehandler
     */
    RegisterSchemeHandler(activatableClassId, scheme) {
        if (!this.HasProp("__IMediaExtensionManager")) {
            if ((queryResult := this.QueryInterface(IMediaExtensionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaExtensionManager := IMediaExtensionManager(outPtr)
        }

        return this.__IMediaExtensionManager.RegisterSchemeHandler(activatableClassId, scheme)
    }

    /**
     * Registers a scheme handler for the specified URL scheme with an optional configuration parameter.
     * @param {HSTRING} activatableClassId The class identifier of the activatable runtime class of the scheme handler. The runtime class must implement the [IMediaExtension](imediaextension.md) interface.
     * @param {HSTRING} scheme The URL scheme that will be recognized to invoke the scheme handler. For example, "myscheme://".
     * @param {IPropertySet} configuration An optional parameter that contains configuration properties for the scheme handler.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaextensionmanager.registerschemehandler
     */
    RegisterSchemeHandlerWithSettings(activatableClassId, scheme, configuration) {
        if (!this.HasProp("__IMediaExtensionManager")) {
            if ((queryResult := this.QueryInterface(IMediaExtensionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaExtensionManager := IMediaExtensionManager(outPtr)
        }

        return this.__IMediaExtensionManager.RegisterSchemeHandlerWithSettings(activatableClassId, scheme, configuration)
    }

    /**
     * Registers a byte-stream handler by file name extension and MIME type.
     * @param {HSTRING} activatableClassId The class identifier of the activatable runtime class of the byte-stream handler. The runtime class must implement the [IMediaExtension](imediaextension.md) interface.
     * @param {HSTRING} fileExtension The file name extension that is registered for this byte-stream handler.
     * @param {HSTRING} mimeType The MIME type that is registered for this byte-stream handler.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaextensionmanager.registerbytestreamhandler
     */
    RegisterByteStreamHandler(activatableClassId, fileExtension, mimeType) {
        if (!this.HasProp("__IMediaExtensionManager")) {
            if ((queryResult := this.QueryInterface(IMediaExtensionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaExtensionManager := IMediaExtensionManager(outPtr)
        }

        return this.__IMediaExtensionManager.RegisterByteStreamHandler(activatableClassId, fileExtension, mimeType)
    }

    /**
     * Registers a byte-stream handler by file name extension and MIME type, with an optional configuration parameter.
     * @param {HSTRING} activatableClassId The class identifier of the activatable runtime class of the byte-stream handler. The runtime class must implement the [IMediaExtension](imediaextension.md) interface.
     * @param {HSTRING} fileExtension The file name extension that is registered for this byte-stream handler.
     * @param {HSTRING} mimeType The MIME type that is registered for this byte-stream handler.
     * @param {IPropertySet} configuration An optional parameter that contains configuration properties for the byte-stream handler.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaextensionmanager.registerbytestreamhandler
     */
    RegisterByteStreamHandlerWithSettings(activatableClassId, fileExtension, mimeType, configuration) {
        if (!this.HasProp("__IMediaExtensionManager")) {
            if ((queryResult := this.QueryInterface(IMediaExtensionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaExtensionManager := IMediaExtensionManager(outPtr)
        }

        return this.__IMediaExtensionManager.RegisterByteStreamHandlerWithSettings(activatableClassId, fileExtension, mimeType, configuration)
    }

    /**
     * Registers an audio decoder for the specified input and output media types.
     * @param {HSTRING} activatableClassId The class identifier of the activatable runtime class of the audio decoder. The runtime class must implement the [IMediaExtension](imediaextension.md) interface.
     * @param {Guid} inputSubtype The guid identifier of the media type that the audio decoder accepts as input.
     * @param {Guid} outputSubtype The guid identifier of the media type that is output by the audio decoder.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaextensionmanager.registeraudiodecoder
     */
    RegisterAudioDecoder(activatableClassId, inputSubtype, outputSubtype) {
        if (!this.HasProp("__IMediaExtensionManager")) {
            if ((queryResult := this.QueryInterface(IMediaExtensionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaExtensionManager := IMediaExtensionManager(outPtr)
        }

        return this.__IMediaExtensionManager.RegisterAudioDecoder(activatableClassId, inputSubtype, outputSubtype)
    }

    /**
     * Registers an audio decoder for the specified input and output media types with an optional configuration parameter.
     * @param {HSTRING} activatableClassId The class identifier of the activatable runtime class of the audio decoder. The runtime class must implement the [IMediaExtension](imediaextension.md) interface.
     * @param {Guid} inputSubtype The guid identifier of the media type that the audio decoder accepts as input.
     * @param {Guid} outputSubtype The guid identifier of the media type that is output by the audio decoder.
     * @param {IPropertySet} configuration An optional parameter that contains the configuration properties to be passed to the audio decoder.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaextensionmanager.registeraudiodecoder
     */
    RegisterAudioDecoderWithSettings(activatableClassId, inputSubtype, outputSubtype, configuration) {
        if (!this.HasProp("__IMediaExtensionManager")) {
            if ((queryResult := this.QueryInterface(IMediaExtensionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaExtensionManager := IMediaExtensionManager(outPtr)
        }

        return this.__IMediaExtensionManager.RegisterAudioDecoderWithSettings(activatableClassId, inputSubtype, outputSubtype, configuration)
    }

    /**
     * Registers an audio encoder for the specified input and output media types.
     * @param {HSTRING} activatableClassId The class identifier of the activatable runtime class of the audio encoder. The runtime class must implement the [IMediaExtension](imediaextension.md) interface.
     * @param {Guid} inputSubtype The guid identifier of the media type that the audio encoder accepts as input.
     * @param {Guid} outputSubtype The guid identifier of the media type that is output by the audio encoder.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaextensionmanager.registeraudioencoder
     */
    RegisterAudioEncoder(activatableClassId, inputSubtype, outputSubtype) {
        if (!this.HasProp("__IMediaExtensionManager")) {
            if ((queryResult := this.QueryInterface(IMediaExtensionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaExtensionManager := IMediaExtensionManager(outPtr)
        }

        return this.__IMediaExtensionManager.RegisterAudioEncoder(activatableClassId, inputSubtype, outputSubtype)
    }

    /**
     * Registers an audio encoder for the specified input and output media types with an optional configuration parameter.
     * @param {HSTRING} activatableClassId The class identifier of the activatable runtime class of the audio encoder. The runtime class must implement the [IMediaExtension](imediaextension.md) interface.
     * @param {Guid} inputSubtype The guid identifier of the media type that the audio encoder accepts as input.
     * @param {Guid} outputSubtype The guid identifier of the media type that is output by the audio encoder.
     * @param {IPropertySet} configuration An optional parameter that contains the configuration properties to be passed to the audio encoder.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaextensionmanager.registeraudioencoder
     */
    RegisterAudioEncoderWithSettings(activatableClassId, inputSubtype, outputSubtype, configuration) {
        if (!this.HasProp("__IMediaExtensionManager")) {
            if ((queryResult := this.QueryInterface(IMediaExtensionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaExtensionManager := IMediaExtensionManager(outPtr)
        }

        return this.__IMediaExtensionManager.RegisterAudioEncoderWithSettings(activatableClassId, inputSubtype, outputSubtype, configuration)
    }

    /**
     * Registers an video decoder for the specified input and output media types.
     * @param {HSTRING} activatableClassId The class identifier of the activatable runtime class of the video decoder. The runtime class must implement the [IMediaExtension](imediaextension.md) interface.
     * @param {Guid} inputSubtype The guid identifier of the media type that the video decoder accepts as input.
     * @param {Guid} outputSubtype The guid identifier of the media type that is output by the video decoder.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaextensionmanager.registervideodecoder
     */
    RegisterVideoDecoder(activatableClassId, inputSubtype, outputSubtype) {
        if (!this.HasProp("__IMediaExtensionManager")) {
            if ((queryResult := this.QueryInterface(IMediaExtensionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaExtensionManager := IMediaExtensionManager(outPtr)
        }

        return this.__IMediaExtensionManager.RegisterVideoDecoder(activatableClassId, inputSubtype, outputSubtype)
    }

    /**
     * Registers a video decoder for the specified input and output media types with an optional configuration parameter.
     * @param {HSTRING} activatableClassId The class identifier of the activatable runtime class of the video decoder. The runtime class must implement the [IMediaExtension](imediaextension.md) interface.
     * @param {Guid} inputSubtype The guid identifier of the media type that the video decoder accepts as input.
     * @param {Guid} outputSubtype The guid identifier of the media type that is output by the video decoder.
     * @param {IPropertySet} configuration An optional parameter that contains the configuration properties to be passed to the video decoder.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaextensionmanager.registervideodecoder
     */
    RegisterVideoDecoderWithSettings(activatableClassId, inputSubtype, outputSubtype, configuration) {
        if (!this.HasProp("__IMediaExtensionManager")) {
            if ((queryResult := this.QueryInterface(IMediaExtensionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaExtensionManager := IMediaExtensionManager(outPtr)
        }

        return this.__IMediaExtensionManager.RegisterVideoDecoderWithSettings(activatableClassId, inputSubtype, outputSubtype, configuration)
    }

    /**
     * Registers a video encoder for the specified input and output media types.
     * @param {HSTRING} activatableClassId The class identifier of the activatable runtime class of the video encoder. The runtime class must implement the [IMediaExtension](imediaextension.md) interface.
     * @param {Guid} inputSubtype The guid identifier of the media type that the video encoder accepts as input.
     * @param {Guid} outputSubtype The guid identifier of the media type that is output by the video encoder.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaextensionmanager.registervideoencoder
     */
    RegisterVideoEncoder(activatableClassId, inputSubtype, outputSubtype) {
        if (!this.HasProp("__IMediaExtensionManager")) {
            if ((queryResult := this.QueryInterface(IMediaExtensionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaExtensionManager := IMediaExtensionManager(outPtr)
        }

        return this.__IMediaExtensionManager.RegisterVideoEncoder(activatableClassId, inputSubtype, outputSubtype)
    }

    /**
     * Registers a video encoder for the specified input and output media types with an optional configuration parameter.
     * @param {HSTRING} activatableClassId The class identifier of the activatable runtime class of the video encoder. The runtime class must implement the [IMediaExtension](imediaextension.md) interface.
     * @param {Guid} inputSubtype The guid identifier of the media type that the video encoder accepts as input.
     * @param {Guid} outputSubtype The guid identifier of the media type that is output by the video encoder.
     * @param {IPropertySet} configuration An optional parameter that contains the configuration properties to be passed to the video encoder.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaextensionmanager.registervideoencoder
     */
    RegisterVideoEncoderWithSettings(activatableClassId, inputSubtype, outputSubtype, configuration) {
        if (!this.HasProp("__IMediaExtensionManager")) {
            if ((queryResult := this.QueryInterface(IMediaExtensionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaExtensionManager := IMediaExtensionManager(outPtr)
        }

        return this.__IMediaExtensionManager.RegisterVideoEncoderWithSettings(activatableClassId, inputSubtype, outputSubtype, configuration)
    }

    /**
     * Registers a media extension that provides a background task that decodes media.
     * @remarks
     * Call this method from within the [Run](../windows.applicationmodel.background/ibackgroundtask_run_2017283929.md) method of a Windows Runtime Component that exposes your media extension.
     * 
     * Get an instance of [AppServiceConnection](../windows.applicationmodel.appservice/appserviceconnection.md) by casting the [TriggerDetails](../windows.applicationmodel.background/ibackgroundtaskinstance_triggerdetails.md)  property of the [IBackgroundTaskInstance](../windows.applicationmodel.background/ibackgroundtaskinstance.md) passed into the **Run** method to an [AppServiceTriggerDetails](../windows.applicationmodel.appservice/appservicetriggerdetails.md)  object and then accessing the [AppServiceConnection](../windows.applicationmodel.appservice/appservicetriggerdetails_appserviceconnection.md) property. 
     * 
     * In order for your background task to receive an [AppServiceTriggerDetails](../windows.applicationmodel.appservice/appservicetriggerdetails.md) object, you must register it as an app service in you app manifest file. For more information, see [Create and consume an app service](/windows/uwp/launch-resume/how-to-create-and-consume-an-app-service).
     * @param {IMediaExtension} extension_ An object that implements [IMediaExtension](../windows.media/imediaextension.md).
     * @param {AppServiceConnection} connection_ An [AppServiceConnection](../windows.applicationmodel.appservice/appserviceconnection.md)  object that represents an endpoint connection for an app service.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaextensionmanager.registermediaextensionforappservice
     */
    RegisterMediaExtensionForAppService(extension_, connection_) {
        if (!this.HasProp("__IMediaExtensionManager2")) {
            if ((queryResult := this.QueryInterface(IMediaExtensionManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaExtensionManager2 := IMediaExtensionManager2(outPtr)
        }

        return this.__IMediaExtensionManager2.RegisterMediaExtensionForAppService(extension_, connection_)
    }

;@endregion Instance Methods
}
