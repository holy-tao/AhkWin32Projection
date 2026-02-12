#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGazeInputSourcePreview.ahk
#Include .\IGazeInputSourcePreviewStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\GazeInputSourcePreview.ahk
#Include .\GazeMovedPreviewEventArgs.ahk
#Include .\GazeEnteredPreviewEventArgs.ahk
#Include .\GazeExitedPreviewEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents the eyes and head of the user identified by an eye-tracking device.
 * @remarks
 * This object is associated with an application's UI thread.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazeinputsourcepreview
 * @namespace Windows.Devices.Input.Preview
 * @version WindowsRuntime 1.4
 */
class GazeInputSourcePreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGazeInputSourcePreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGazeInputSourcePreview.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves a reference to the user identified by an eye-tracking device, bound to the active application.
     * @remarks
     * This method must be called on the UI thread, see [Keep the UI thread responsive](/windows/uwp/debug-test-perf/keep-the-ui-thread-responsive).
     * 
     * Calling this method results in a privacy prompt in which the user is asked to grant permission for your app to access their eye-tracking device. The user is prompted only once, when the app is run for the first time.
     * 
     * Windows automatically prompts users with a consent dialog (when the app is first run), with which the user must grant permission for the app to communicate with the eye-tracking device and access gaze data.
     * @returns {GazeInputSourcePreview} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazeinputsourcepreview.getforcurrentview
     */
    static GetForCurrentView() {
        if (!GazeInputSourcePreview.HasProp("__IGazeInputSourcePreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Input.Preview.GazeInputSourcePreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGazeInputSourcePreviewStatics.IID)
            GazeInputSourcePreview.__IGazeInputSourcePreviewStatics := IGazeInputSourcePreviewStatics(factoryPtr)
        }

        return GazeInputSourcePreview.__IGazeInputSourcePreviewStatics.GetForCurrentView()
    }

    /**
     * Creates an object for monitoring the state of the eye-tracker device associated with the current view.
     * @returns {GazeDeviceWatcherPreview} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazeinputsourcepreview.createwatcher
     */
    static CreateWatcher() {
        if (!GazeInputSourcePreview.HasProp("__IGazeInputSourcePreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Input.Preview.GazeInputSourcePreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGazeInputSourcePreviewStatics.IID)
            GazeInputSourcePreview.__IGazeInputSourcePreviewStatics := IGazeInputSourcePreviewStatics(factoryPtr)
        }

        return GazeInputSourcePreview.__IGazeInputSourcePreviewStatics.CreateWatcher()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnGazeMovedToken")) {
            this.remove_GazeMoved(this.__OnGazeMovedToken)
            this.__OnGazeMoved.iface.Dispose()
        }

        if(this.HasProp("__OnGazeEnteredToken")) {
            this.remove_GazeEntered(this.__OnGazeEnteredToken)
            this.__OnGazeEntered.iface.Dispose()
        }

        if(this.HasProp("__OnGazeExitedToken")) {
            this.remove_GazeExited(this.__OnGazeExitedToken)
            this.__OnGazeExited.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<GazeInputSourcePreview, GazeMovedPreviewEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GazeMoved(handler) {
        if (!this.HasProp("__IGazeInputSourcePreview")) {
            if ((queryResult := this.QueryInterface(IGazeInputSourcePreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeInputSourcePreview := IGazeInputSourcePreview(outPtr)
        }

        return this.__IGazeInputSourcePreview.add_GazeMoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GazeMoved(token) {
        if (!this.HasProp("__IGazeInputSourcePreview")) {
            if ((queryResult := this.QueryInterface(IGazeInputSourcePreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeInputSourcePreview := IGazeInputSourcePreview(outPtr)
        }

        return this.__IGazeInputSourcePreview.remove_GazeMoved(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GazeInputSourcePreview, GazeEnteredPreviewEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GazeEntered(handler) {
        if (!this.HasProp("__IGazeInputSourcePreview")) {
            if ((queryResult := this.QueryInterface(IGazeInputSourcePreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeInputSourcePreview := IGazeInputSourcePreview(outPtr)
        }

        return this.__IGazeInputSourcePreview.add_GazeEntered(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GazeEntered(token) {
        if (!this.HasProp("__IGazeInputSourcePreview")) {
            if ((queryResult := this.QueryInterface(IGazeInputSourcePreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeInputSourcePreview := IGazeInputSourcePreview(outPtr)
        }

        return this.__IGazeInputSourcePreview.remove_GazeEntered(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GazeInputSourcePreview, GazeExitedPreviewEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GazeExited(handler) {
        if (!this.HasProp("__IGazeInputSourcePreview")) {
            if ((queryResult := this.QueryInterface(IGazeInputSourcePreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeInputSourcePreview := IGazeInputSourcePreview(outPtr)
        }

        return this.__IGazeInputSourcePreview.add_GazeExited(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GazeExited(token) {
        if (!this.HasProp("__IGazeInputSourcePreview")) {
            if ((queryResult := this.QueryInterface(IGazeInputSourcePreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeInputSourcePreview := IGazeInputSourcePreview(outPtr)
        }

        return this.__IGazeInputSourcePreview.remove_GazeExited(token)
    }

;@endregion Instance Methods
}
