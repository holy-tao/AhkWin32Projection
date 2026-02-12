#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGazeDeviceWatcherPreview.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\GazeDeviceWatcherPreview.ahk
#Include .\GazeDeviceWatcherAddedPreviewEventArgs.ahk
#Include .\GazeDeviceWatcherRemovedPreviewEventArgs.ahk
#Include .\GazeDeviceWatcherUpdatedPreviewEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Dynamically detects and enumerates eye-tracking devices, and receives event notifications when a device is added, removed, or updated after the initial enumeration.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazedevicewatcherpreview
 * @namespace Windows.Devices.Input.Preview
 * @version WindowsRuntime 1.4
 */
class GazeDeviceWatcherPreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGazeDeviceWatcherPreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGazeDeviceWatcherPreview.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAddedToken")) {
            this.remove_Added(this.__OnAddedToken)
            this.__OnAdded.iface.Dispose()
        }

        if(this.HasProp("__OnRemovedToken")) {
            this.remove_Removed(this.__OnRemovedToken)
            this.__OnRemoved.iface.Dispose()
        }

        if(this.HasProp("__OnUpdatedToken")) {
            this.remove_Updated(this.__OnUpdatedToken)
            this.__OnUpdated.iface.Dispose()
        }

        if(this.HasProp("__OnEnumerationCompletedToken")) {
            this.remove_EnumerationCompleted(this.__OnEnumerationCompletedToken)
            this.__OnEnumerationCompleted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<GazeDeviceWatcherPreview, GazeDeviceWatcherAddedPreviewEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Added(handler) {
        if (!this.HasProp("__IGazeDeviceWatcherPreview")) {
            if ((queryResult := this.QueryInterface(IGazeDeviceWatcherPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeDeviceWatcherPreview := IGazeDeviceWatcherPreview(outPtr)
        }

        return this.__IGazeDeviceWatcherPreview.add_Added(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Added(token) {
        if (!this.HasProp("__IGazeDeviceWatcherPreview")) {
            if ((queryResult := this.QueryInterface(IGazeDeviceWatcherPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeDeviceWatcherPreview := IGazeDeviceWatcherPreview(outPtr)
        }

        return this.__IGazeDeviceWatcherPreview.remove_Added(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GazeDeviceWatcherPreview, GazeDeviceWatcherRemovedPreviewEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Removed(handler) {
        if (!this.HasProp("__IGazeDeviceWatcherPreview")) {
            if ((queryResult := this.QueryInterface(IGazeDeviceWatcherPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeDeviceWatcherPreview := IGazeDeviceWatcherPreview(outPtr)
        }

        return this.__IGazeDeviceWatcherPreview.add_Removed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Removed(token) {
        if (!this.HasProp("__IGazeDeviceWatcherPreview")) {
            if ((queryResult := this.QueryInterface(IGazeDeviceWatcherPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeDeviceWatcherPreview := IGazeDeviceWatcherPreview(outPtr)
        }

        return this.__IGazeDeviceWatcherPreview.remove_Removed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GazeDeviceWatcherPreview, GazeDeviceWatcherUpdatedPreviewEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Updated(handler) {
        if (!this.HasProp("__IGazeDeviceWatcherPreview")) {
            if ((queryResult := this.QueryInterface(IGazeDeviceWatcherPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeDeviceWatcherPreview := IGazeDeviceWatcherPreview(outPtr)
        }

        return this.__IGazeDeviceWatcherPreview.add_Updated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Updated(token) {
        if (!this.HasProp("__IGazeDeviceWatcherPreview")) {
            if ((queryResult := this.QueryInterface(IGazeDeviceWatcherPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeDeviceWatcherPreview := IGazeDeviceWatcherPreview(outPtr)
        }

        return this.__IGazeDeviceWatcherPreview.remove_Updated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GazeDeviceWatcherPreview, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EnumerationCompleted(handler) {
        if (!this.HasProp("__IGazeDeviceWatcherPreview")) {
            if ((queryResult := this.QueryInterface(IGazeDeviceWatcherPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeDeviceWatcherPreview := IGazeDeviceWatcherPreview(outPtr)
        }

        return this.__IGazeDeviceWatcherPreview.add_EnumerationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EnumerationCompleted(token) {
        if (!this.HasProp("__IGazeDeviceWatcherPreview")) {
            if ((queryResult := this.QueryInterface(IGazeDeviceWatcherPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeDeviceWatcherPreview := IGazeDeviceWatcherPreview(outPtr)
        }

        return this.__IGazeDeviceWatcherPreview.remove_EnumerationCompleted(token)
    }

    /**
     * Starts monitoring the state of an eye-tracker device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazedevicewatcherpreview.start
     */
    Start() {
        if (!this.HasProp("__IGazeDeviceWatcherPreview")) {
            if ((queryResult := this.QueryInterface(IGazeDeviceWatcherPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeDeviceWatcherPreview := IGazeDeviceWatcherPreview(outPtr)
        }

        return this.__IGazeDeviceWatcherPreview.Start()
    }

    /**
     * Stops monitoring the state of an eye-tracker device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazedevicewatcherpreview.stop
     */
    Stop() {
        if (!this.HasProp("__IGazeDeviceWatcherPreview")) {
            if ((queryResult := this.QueryInterface(IGazeDeviceWatcherPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeDeviceWatcherPreview := IGazeDeviceWatcherPreview(outPtr)
        }

        return this.__IGazeDeviceWatcherPreview.Stop()
    }

;@endregion Instance Methods
}
