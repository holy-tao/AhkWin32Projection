#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppCaptureRecordOperation.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AppCaptureRecordOperation.ahk
#Include .\AppCaptureRecordingStateChangedEventArgs.ahk
#Include .\AppCaptureDurationGeneratedEventArgs.ahk
#Include .\AppCaptureFileGeneratedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents an app capture record operation.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * This API may throw an error if the background service has shut down due to idle timeout.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturerecordoperation
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppCaptureRecordOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppCaptureRecordOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppCaptureRecordOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value specifying the current state of the app capture record operation.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturerecordoperation.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Gets the error code associated with the recording operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturerecordoperation.errorcode
     * @type {IReference<Integer>} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

    /**
     * Gets the duration of the recording operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturerecordoperation.duration
     * @type {IReference<TimeSpan>} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * Gets the file associated with the recording operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturerecordoperation.file
     * @type {StorageFile} 
     */
    File {
        get => this.get_File()
    }

    /**
     * Gets a value indicating whether the file associated with the recording operation is truncated.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturerecordoperation.isfiletruncated
     * @type {IReference<Boolean>} 
     */
    IsFileTruncated {
        get => this.get_IsFileTruncated()
    }

    /**
     * Occurs when the state of the app capture record operation changes.
     * @type {TypedEventHandler<AppCaptureRecordOperation, AppCaptureRecordingStateChangedEventArgs>}
    */
    OnStateChanged {
        get {
            if(!this.HasProp("__OnStateChanged")){
                this.__OnStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{227cbf02-2dfb-5425-85b1-0d62ce5d1243}"),
                    AppCaptureRecordOperation,
                    AppCaptureRecordingStateChangedEventArgs
                )
                this.__OnStateChangedToken := this.add_StateChanged(this.__OnStateChanged.iface)
            }
            return this.__OnStateChanged
        }
    }

    /**
     * Occurs when the recording state changes due to the duration of the recording operation.
     * @type {TypedEventHandler<AppCaptureRecordOperation, AppCaptureDurationGeneratedEventArgs>}
    */
    OnDurationGenerated {
        get {
            if(!this.HasProp("__OnDurationGenerated")){
                this.__OnDurationGenerated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ab6419b5-9917-5275-9876-9e46b9abada7}"),
                    AppCaptureRecordOperation,
                    AppCaptureDurationGeneratedEventArgs
                )
                this.__OnDurationGeneratedToken := this.add_DurationGenerated(this.__OnDurationGenerated.iface)
            }
            return this.__OnDurationGenerated
        }
    }

    /**
     * Occurs when the recording state changes due to the file associated with the recording operation.
     * @type {TypedEventHandler<AppCaptureRecordOperation, AppCaptureFileGeneratedEventArgs>}
    */
    OnFileGenerated {
        get {
            if(!this.HasProp("__OnFileGenerated")){
                this.__OnFileGenerated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f00f69e5-9ee6-5119-9c39-f279f9ffd908}"),
                    AppCaptureRecordOperation,
                    AppCaptureFileGeneratedEventArgs
                )
                this.__OnFileGeneratedToken := this.add_FileGenerated(this.__OnFileGenerated.iface)
            }
            return this.__OnFileGenerated
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnStateChangedToken")) {
            this.remove_StateChanged(this.__OnStateChangedToken)
            this.__OnStateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnDurationGeneratedToken")) {
            this.remove_DurationGenerated(this.__OnDurationGeneratedToken)
            this.__OnDurationGenerated.iface.Dispose()
        }

        if(this.HasProp("__OnFileGeneratedToken")) {
            this.remove_FileGenerated(this.__OnFileGeneratedToken)
            this.__OnFileGenerated.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Stops the app capture record operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturerecordoperation.stoprecording
     */
    StopRecording() {
        if (!this.HasProp("__IAppCaptureRecordOperation")) {
            if ((queryResult := this.QueryInterface(IAppCaptureRecordOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureRecordOperation := IAppCaptureRecordOperation(outPtr)
        }

        return this.__IAppCaptureRecordOperation.StopRecording()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IAppCaptureRecordOperation")) {
            if ((queryResult := this.QueryInterface(IAppCaptureRecordOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureRecordOperation := IAppCaptureRecordOperation(outPtr)
        }

        return this.__IAppCaptureRecordOperation.get_State()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__IAppCaptureRecordOperation")) {
            if ((queryResult := this.QueryInterface(IAppCaptureRecordOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureRecordOperation := IAppCaptureRecordOperation(outPtr)
        }

        return this.__IAppCaptureRecordOperation.get_ErrorCode()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Duration() {
        if (!this.HasProp("__IAppCaptureRecordOperation")) {
            if ((queryResult := this.QueryInterface(IAppCaptureRecordOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureRecordOperation := IAppCaptureRecordOperation(outPtr)
        }

        return this.__IAppCaptureRecordOperation.get_Duration()
    }

    /**
     * 
     * @returns {StorageFile} 
     */
    get_File() {
        if (!this.HasProp("__IAppCaptureRecordOperation")) {
            if ((queryResult := this.QueryInterface(IAppCaptureRecordOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureRecordOperation := IAppCaptureRecordOperation(outPtr)
        }

        return this.__IAppCaptureRecordOperation.get_File()
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_IsFileTruncated() {
        if (!this.HasProp("__IAppCaptureRecordOperation")) {
            if ((queryResult := this.QueryInterface(IAppCaptureRecordOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureRecordOperation := IAppCaptureRecordOperation(outPtr)
        }

        return this.__IAppCaptureRecordOperation.get_IsFileTruncated()
    }

    /**
     * 
     * @param {TypedEventHandler<AppCaptureRecordOperation, AppCaptureRecordingStateChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_StateChanged(value) {
        if (!this.HasProp("__IAppCaptureRecordOperation")) {
            if ((queryResult := this.QueryInterface(IAppCaptureRecordOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureRecordOperation := IAppCaptureRecordOperation(outPtr)
        }

        return this.__IAppCaptureRecordOperation.add_StateChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StateChanged(token) {
        if (!this.HasProp("__IAppCaptureRecordOperation")) {
            if ((queryResult := this.QueryInterface(IAppCaptureRecordOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureRecordOperation := IAppCaptureRecordOperation(outPtr)
        }

        return this.__IAppCaptureRecordOperation.remove_StateChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppCaptureRecordOperation, AppCaptureDurationGeneratedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_DurationGenerated(value) {
        if (!this.HasProp("__IAppCaptureRecordOperation")) {
            if ((queryResult := this.QueryInterface(IAppCaptureRecordOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureRecordOperation := IAppCaptureRecordOperation(outPtr)
        }

        return this.__IAppCaptureRecordOperation.add_DurationGenerated(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DurationGenerated(token) {
        if (!this.HasProp("__IAppCaptureRecordOperation")) {
            if ((queryResult := this.QueryInterface(IAppCaptureRecordOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureRecordOperation := IAppCaptureRecordOperation(outPtr)
        }

        return this.__IAppCaptureRecordOperation.remove_DurationGenerated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppCaptureRecordOperation, AppCaptureFileGeneratedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_FileGenerated(value) {
        if (!this.HasProp("__IAppCaptureRecordOperation")) {
            if ((queryResult := this.QueryInterface(IAppCaptureRecordOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureRecordOperation := IAppCaptureRecordOperation(outPtr)
        }

        return this.__IAppCaptureRecordOperation.add_FileGenerated(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FileGenerated(token) {
        if (!this.HasProp("__IAppCaptureRecordOperation")) {
            if ((queryResult := this.QueryInterface(IAppCaptureRecordOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureRecordOperation := IAppCaptureRecordOperation(outPtr)
        }

        return this.__IAppCaptureRecordOperation.remove_FileGenerated(token)
    }

;@endregion Instance Methods
}
