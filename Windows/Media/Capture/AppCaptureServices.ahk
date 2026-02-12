#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppCaptureServices.ahk
#Include ..\..\..\Guid.ahk

/**
 * Manages the state of app captures.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * This API may throw an error if the background service has shut down due to idle timeout.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcaptureservices
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppCaptureServices extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppCaptureServices

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppCaptureServices.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value specifying whether app capture can be performed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcaptureservices.cancapture
     * @type {Boolean} 
     */
    CanCapture {
        get => this.get_CanCapture()
    }

    /**
     * Gets a value specifying the current state of the app capture services.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcaptureservices.state
     * @type {AppCaptureState} 
     */
    State {
        get => this.get_State()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Initiates an app capture record operation.
     * @returns {AppCaptureRecordOperation} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcaptureservices.record
     */
    Record() {
        if (!this.HasProp("__IAppCaptureServices")) {
            if ((queryResult := this.QueryInterface(IAppCaptureServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureServices := IAppCaptureServices(outPtr)
        }

        return this.__IAppCaptureServices.Record()
    }

    /**
     * Initiates an app capture record operation beginning at the specified time, for the specified duration.
     * @param {DateTime} startTime The time at which the app capture record operation is initiated.
     * @param {TimeSpan} duration_ The duration of the app capture record operation.
     * @returns {AppCaptureRecordOperation} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcaptureservices.recordtimespan
     */
    RecordTimeSpan(startTime, duration_) {
        if (!this.HasProp("__IAppCaptureServices")) {
            if ((queryResult := this.QueryInterface(IAppCaptureServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureServices := IAppCaptureServices(outPtr)
        }

        return this.__IAppCaptureServices.RecordTimeSpan(startTime, duration_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanCapture() {
        if (!this.HasProp("__IAppCaptureServices")) {
            if ((queryResult := this.QueryInterface(IAppCaptureServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureServices := IAppCaptureServices(outPtr)
        }

        return this.__IAppCaptureServices.get_CanCapture()
    }

    /**
     * 
     * @returns {AppCaptureState} 
     */
    get_State() {
        if (!this.HasProp("__IAppCaptureServices")) {
            if ((queryResult := this.QueryInterface(IAppCaptureServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureServices := IAppCaptureServices(outPtr)
        }

        return this.__IAppCaptureServices.get_State()
    }

;@endregion Instance Methods
}
