#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\MediaCaptureSettings.ahk
#Include ..\Devices\AudioDeviceController.ahk
#Include ..\Devices\VideoDeviceController.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IMediaCapture extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaCapture
     * @type {Guid}
     */
    static IID => Guid("{c61afbb4-fb10-4a34-ac18-ca80d9c8e7ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeAsync", "InitializeWithSettingsAsync", "StartRecordToStorageFileAsync", "StartRecordToStreamAsync", "StartRecordToCustomSinkAsync", "StartRecordToCustomSinkIdAsync", "StopRecordAsync", "CapturePhotoToStorageFileAsync", "CapturePhotoToStreamAsync", "AddEffectAsync", "ClearEffectsAsync", "SetEncoderProperty", "GetEncoderProperty", "add_Failed", "remove_Failed", "add_RecordLimitationExceeded", "remove_RecordLimitationExceeded", "get_MediaCaptureSettings", "get_AudioDeviceController", "get_VideoDeviceController", "SetPreviewMirroring", "GetPreviewMirroring", "SetPreviewRotation", "GetPreviewRotation", "SetRecordRotation", "GetRecordRotation"]

    /**
     * @type {MediaCaptureSettings} 
     */
    MediaCaptureSettings {
        get => this.get_MediaCaptureSettings()
    }

    /**
     * @type {AudioDeviceController} 
     */
    AudioDeviceController {
        get => this.get_AudioDeviceController()
    }

    /**
     * @type {VideoDeviceController} 
     */
    VideoDeviceController {
        get => this.get_VideoDeviceController()
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    InitializeAsync() {
        result := ComCall(6, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {MediaCaptureInitializationSettings} mediaCaptureInitializationSettings_ 
     * @returns {IAsyncAction} 
     */
    InitializeWithSettingsAsync(mediaCaptureInitializationSettings_) {
        result := ComCall(7, this, "ptr", mediaCaptureInitializationSettings_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {MediaEncodingProfile} encodingProfile 
     * @param {IStorageFile} file_ 
     * @returns {IAsyncAction} 
     */
    StartRecordToStorageFileAsync(encodingProfile, file_) {
        result := ComCall(8, this, "ptr", encodingProfile, "ptr", file_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {MediaEncodingProfile} encodingProfile 
     * @param {IRandomAccessStream} stream 
     * @returns {IAsyncAction} 
     */
    StartRecordToStreamAsync(encodingProfile, stream) {
        result := ComCall(9, this, "ptr", encodingProfile, "ptr", stream, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {MediaEncodingProfile} encodingProfile 
     * @param {IMediaExtension} customMediaSink 
     * @returns {IAsyncAction} 
     */
    StartRecordToCustomSinkAsync(encodingProfile, customMediaSink) {
        result := ComCall(10, this, "ptr", encodingProfile, "ptr", customMediaSink, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {MediaEncodingProfile} encodingProfile 
     * @param {HSTRING} customSinkActivationId 
     * @param {IPropertySet} customSinkSettings 
     * @returns {IAsyncAction} 
     */
    StartRecordToCustomSinkIdAsync(encodingProfile, customSinkActivationId, customSinkSettings) {
        if(customSinkActivationId is String) {
            pin := HSTRING.Create(customSinkActivationId)
            customSinkActivationId := pin.Value
        }
        customSinkActivationId := customSinkActivationId is Win32Handle ? NumGet(customSinkActivationId, "ptr") : customSinkActivationId

        result := ComCall(11, this, "ptr", encodingProfile, "ptr", customSinkActivationId, "ptr", customSinkSettings, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    StopRecordAsync() {
        result := ComCall(12, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {ImageEncodingProperties} type 
     * @param {IStorageFile} file_ 
     * @returns {IAsyncAction} 
     */
    CapturePhotoToStorageFileAsync(type, file_) {
        result := ComCall(13, this, "ptr", type, "ptr", file_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {ImageEncodingProperties} type 
     * @param {IRandomAccessStream} stream 
     * @returns {IAsyncAction} 
     */
    CapturePhotoToStreamAsync(type, stream) {
        result := ComCall(14, this, "ptr", type, "ptr", stream, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {Integer} mediaStreamType_ 
     * @param {HSTRING} effectActivationID 
     * @param {IPropertySet} effectSettings 
     * @returns {IAsyncAction} 
     */
    AddEffectAsync(mediaStreamType_, effectActivationID, effectSettings) {
        if(effectActivationID is String) {
            pin := HSTRING.Create(effectActivationID)
            effectActivationID := pin.Value
        }
        effectActivationID := effectActivationID is Win32Handle ? NumGet(effectActivationID, "ptr") : effectActivationID

        result := ComCall(15, this, "int", mediaStreamType_, "ptr", effectActivationID, "ptr", effectSettings, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {Integer} mediaStreamType_ 
     * @returns {IAsyncAction} 
     */
    ClearEffectsAsync(mediaStreamType_) {
        result := ComCall(16, this, "int", mediaStreamType_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {Integer} mediaStreamType_ 
     * @param {Guid} propertyId 
     * @param {IInspectable} propertyValue_ 
     * @returns {HRESULT} 
     */
    SetEncoderProperty(mediaStreamType_, propertyId, propertyValue_) {
        result := ComCall(17, this, "int", mediaStreamType_, "ptr", propertyId, "ptr", propertyValue_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} mediaStreamType_ 
     * @param {Guid} propertyId 
     * @returns {IInspectable} 
     */
    GetEncoderProperty(mediaStreamType_, propertyId) {
        result := ComCall(18, this, "int", mediaStreamType_, "ptr", propertyId, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * 
     * @param {MediaCaptureFailedEventHandler} errorEventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Failed(errorEventHandler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(19, this, "ptr", errorEventHandler, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return eventCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_Failed(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(20, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RecordLimitationExceededEventHandler} recordLimitationExceededEventHandler_ 
     * @returns {EventRegistrationToken} 
     */
    add_RecordLimitationExceeded(recordLimitationExceededEventHandler_) {
        eventCookie := EventRegistrationToken()
        result := ComCall(21, this, "ptr", recordLimitationExceededEventHandler_, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return eventCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_RecordLimitationExceeded(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(22, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaCaptureSettings} 
     */
    get_MediaCaptureSettings() {
        result := ComCall(23, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaCaptureSettings(value)
    }

    /**
     * 
     * @returns {AudioDeviceController} 
     */
    get_AudioDeviceController() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioDeviceController(value)
    }

    /**
     * 
     * @returns {VideoDeviceController} 
     */
    get_VideoDeviceController() {
        result := ComCall(25, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoDeviceController(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetPreviewMirroring(value) {
        result := ComCall(26, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    GetPreviewMirroring() {
        result := ComCall(27, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetPreviewRotation(value) {
        result := ComCall(28, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPreviewRotation() {
        result := ComCall(29, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetRecordRotation(value) {
        result := ComCall(30, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetRecordRotation() {
        result := ComCall(31, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
