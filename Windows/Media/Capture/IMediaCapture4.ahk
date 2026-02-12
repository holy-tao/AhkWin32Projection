#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\IMediaExtension.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\VideoFrame.ahk
#Include .\AdvancedPhotoCapture.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IMediaCapture4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaCapture4
     * @type {Guid}
     */
    static IID => Guid("{bacd6fd6-fb08-4947-aea2-ce14eff0ce13}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddAudioEffectAsync", "AddVideoEffectAsync", "PauseRecordAsync", "ResumeRecordAsync", "add_CameraStreamStateChanged", "remove_CameraStreamStateChanged", "get_CameraStreamState", "GetPreviewFrameAsync", "GetPreviewFrameCopyAsync", "add_ThermalStatusChanged", "remove_ThermalStatusChanged", "get_ThermalStatus", "PrepareAdvancedPhotoCaptureAsync"]

    /**
     * @type {Integer} 
     */
    CameraStreamState {
        get => this.get_CameraStreamState()
    }

    /**
     * @type {Integer} 
     */
    ThermalStatus {
        get => this.get_ThermalStatus()
    }

    /**
     * 
     * @param {IAudioEffectDefinition} definition 
     * @returns {IAsyncOperation<IMediaExtension>} 
     */
    AddAudioEffectAsync(definition) {
        result := ComCall(6, this, "ptr", definition, "ptr*", &op := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IMediaExtension, op)
    }

    /**
     * 
     * @param {IVideoEffectDefinition} definition 
     * @param {Integer} mediaStreamType_ 
     * @returns {IAsyncOperation<IMediaExtension>} 
     */
    AddVideoEffectAsync(definition, mediaStreamType_) {
        result := ComCall(7, this, "ptr", definition, "int", mediaStreamType_, "ptr*", &op := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IMediaExtension, op)
    }

    /**
     * 
     * @param {Integer} behavior 
     * @returns {IAsyncAction} 
     */
    PauseRecordAsync(behavior) {
        result := ComCall(8, this, "int", behavior, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ResumeRecordAsync() {
        result := ComCall(9, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaCapture, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CameraStreamStateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CameraStreamStateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CameraStreamState() {
        result := ComCall(12, this, "int*", &streamState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return streamState
    }

    /**
     * 
     * @returns {IAsyncOperation<VideoFrame>} 
     */
    GetPreviewFrameAsync() {
        result := ComCall(13, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(VideoFrame, operation)
    }

    /**
     * 
     * @param {VideoFrame} destination 
     * @returns {IAsyncOperation<VideoFrame>} 
     */
    GetPreviewFrameCopyAsync(destination) {
        result := ComCall(14, this, "ptr", destination, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(VideoFrame, operation)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaCapture, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ThermalStatusChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(15, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ThermalStatusChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(16, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ThermalStatus() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {ImageEncodingProperties} encodingProperties 
     * @returns {IAsyncOperation<AdvancedPhotoCapture>} 
     */
    PrepareAdvancedPhotoCaptureAsync(encodingProperties) {
        result := ComCall(18, this, "ptr", encodingProperties, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AdvancedPhotoCapture, operation)
    }
}
