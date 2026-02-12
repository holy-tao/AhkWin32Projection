#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVariablePhotoSequenceCapture.ahk
#Include .\IVariablePhotoSequenceCapture2.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\VariablePhotoSequenceCapture.ahk
#Include .\VariablePhotoCapturedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides methods and events that enable the capture of variable photo sequences.
 * @remarks
 * Call the [MediaCapture.PrepareVariablePhotoSequenceCaptureAsync](../windows.media.capture/mediacapture_preparevariablephotosequencecaptureasync_262453199.md) method to obtain an instance of this class.
 * 
 * After starting a variable photo sequence capture, you must stop the variable photo sequence capture by calling [StopAsync](variablephotosequencecapture_stopasync_1648475005.md) before your app attempts to record video with the [MediaCapture](../windows.media.capture/mediacapture.md) object.
 * 
 * For how-to guidance for using **VariablePhotoSequenceCapture**, see [Capture a photo sequence with VariablePhotoSequence](/windows/uwp/audio-video-camera/variable-photo-sequence).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.core.variablephotosequencecapture
 * @namespace Windows.Media.Capture.Core
 * @version WindowsRuntime 1.4
 */
class VariablePhotoSequenceCapture extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVariablePhotoSequenceCapture

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVariablePhotoSequenceCapture.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPhotoCapturedToken")) {
            this.remove_PhotoCaptured(this.__OnPhotoCapturedToken)
            this.__OnPhotoCaptured.iface.Dispose()
        }

        if(this.HasProp("__OnStoppedToken")) {
            this.remove_Stopped(this.__OnStoppedToken)
            this.__OnStopped.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Starts the capturing of variable photo sequence frames.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.core.variablephotosequencecapture.startasync
     */
    StartAsync() {
        if (!this.HasProp("__IVariablePhotoSequenceCapture")) {
            if ((queryResult := this.QueryInterface(IVariablePhotoSequenceCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariablePhotoSequenceCapture := IVariablePhotoSequenceCapture(outPtr)
        }

        return this.__IVariablePhotoSequenceCapture.StartAsync()
    }

    /**
     * Stops the capturing of variable photo sequence frames.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.core.variablephotosequencecapture.stopasync
     */
    StopAsync() {
        if (!this.HasProp("__IVariablePhotoSequenceCapture")) {
            if ((queryResult := this.QueryInterface(IVariablePhotoSequenceCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariablePhotoSequenceCapture := IVariablePhotoSequenceCapture(outPtr)
        }

        return this.__IVariablePhotoSequenceCapture.StopAsync()
    }

    /**
     * Asynchronously releases the [VariablePhotoSequenceCapture](variablephotosequencecapture.md) object and resources used by the capture operation.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.core.variablephotosequencecapture.finishasync
     */
    FinishAsync() {
        if (!this.HasProp("__IVariablePhotoSequenceCapture")) {
            if ((queryResult := this.QueryInterface(IVariablePhotoSequenceCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariablePhotoSequenceCapture := IVariablePhotoSequenceCapture(outPtr)
        }

        return this.__IVariablePhotoSequenceCapture.FinishAsync()
    }

    /**
     * 
     * @param {TypedEventHandler<VariablePhotoSequenceCapture, VariablePhotoCapturedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PhotoCaptured(handler) {
        if (!this.HasProp("__IVariablePhotoSequenceCapture")) {
            if ((queryResult := this.QueryInterface(IVariablePhotoSequenceCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariablePhotoSequenceCapture := IVariablePhotoSequenceCapture(outPtr)
        }

        return this.__IVariablePhotoSequenceCapture.add_PhotoCaptured(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PhotoCaptured(token) {
        if (!this.HasProp("__IVariablePhotoSequenceCapture")) {
            if ((queryResult := this.QueryInterface(IVariablePhotoSequenceCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariablePhotoSequenceCapture := IVariablePhotoSequenceCapture(outPtr)
        }

        return this.__IVariablePhotoSequenceCapture.remove_PhotoCaptured(token)
    }

    /**
     * 
     * @param {TypedEventHandler<VariablePhotoSequenceCapture, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Stopped(handler) {
        if (!this.HasProp("__IVariablePhotoSequenceCapture")) {
            if ((queryResult := this.QueryInterface(IVariablePhotoSequenceCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariablePhotoSequenceCapture := IVariablePhotoSequenceCapture(outPtr)
        }

        return this.__IVariablePhotoSequenceCapture.add_Stopped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Stopped(token) {
        if (!this.HasProp("__IVariablePhotoSequenceCapture")) {
            if ((queryResult := this.QueryInterface(IVariablePhotoSequenceCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariablePhotoSequenceCapture := IVariablePhotoSequenceCapture(outPtr)
        }

        return this.__IVariablePhotoSequenceCapture.remove_Stopped(token)
    }

    /**
     * Updates the frame control values of the variable photo sequence.
     * @remarks
     * This method allows you to efficiently perform multiple variable photo sequence captures with different sets of frame controller values. An instance of [VariablePhotoSequenceController](../windows.media.devices.core/variablephotosequencecontroller.md) is initially obtained with a call to [MediaCapture.PrepareVariablePhotoSequenceCaptureAsync](../windows.media.capture/mediacapture_preparevariablephotosequencecaptureasync_262453199.md). Frame controller values for each frame are registered by appending a [FrameController](variablephotocapturedeventargs_usedframecontrollerindex.md) to the [DesiredFrameControllers](../windows.media.devices.core/variablephotosequencecontroller_desiredframecontrollers.md) collection. After making an initial variable photo sequence capture, you can change the values of the properties of the frame controllers in the [DesiredFrameControllers](../windows.media.devices.core/variablephotosequencecontroller_desiredframecontrollers.md) collection and then call **UpdateSettingsAsync** to have the system register the new frame controller values with the driver.
     * 
     * This method has the following restrictions:
     * 
     * 
     * + This method can't be called while a variable photo sequence capture is in progress. Attempting to call this method between a call to [VariablePhotoSequence.StartAsync](variablephotosequencecapture_startasync_1931900819.md) and the subsequent call to [VariablePhotoSequence.StopAsync](variablephotosequencecapture_stopasync_1648475005.md) will result in an invalid request error.
     * + This method can't be called after the variable photo sequence capture has been deinitialized with a call to [VariablePhotoSequence.FinishAsync](variablephotosequencecapture_finishasync_1182664592.md). Doing so will result in an invalid request error. After calling [FinishAsync](variablephotosequencecapture_finishasync_1182664592.md), you must call [PrepareVariablePhotoSequenceCaptureAsync](../windows.media.capture/mediacapture_preparevariablephotosequencecaptureasync_262453199.md) again before calling **UpdateSettingsAsync**.
     * + The number of frame controllers must be the same for each variable photo sequence capture separated by calls to **UpdateSettingsAsync**. If you want to capture variable photo sequences with different numbers of frames, you must call [FinishAsync](variablephotosequencecapture_finishasync_1182664592.md) and then call [PrepareVariablePhotoSequenceCaptureAsync](../windows.media.capture/mediacapture_preparevariablephotosequencecaptureasync_262453199.md) again to reinitialize the photo sequence capture.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.core.variablephotosequencecapture.updatesettingsasync
     */
    UpdateSettingsAsync() {
        if (!this.HasProp("__IVariablePhotoSequenceCapture2")) {
            if ((queryResult := this.QueryInterface(IVariablePhotoSequenceCapture2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariablePhotoSequenceCapture2 := IVariablePhotoSequenceCapture2(outPtr)
        }

        return this.__IVariablePhotoSequenceCapture2.UpdateSettingsAsync()
    }

;@endregion Instance Methods
}
