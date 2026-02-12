#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGazeDeviceWatcherAddedPreviewEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [GazeDeviceWatcherPreview.Added](gazedevicewatcherpreview_added.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazedevicewatcheraddedprevieweventargs
 * @namespace Windows.Devices.Input.Preview
 * @version WindowsRuntime 1.4
 */
class GazeDeviceWatcherAddedPreviewEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGazeDeviceWatcherAddedPreviewEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGazeDeviceWatcherAddedPreviewEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a reference to the eye-tracker device being monitored through the [GazeDeviceWatcherPreview](gazedevicewatcherpreview.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazedevicewatcheraddedprevieweventargs.device
     * @type {GazeDevicePreview} 
     */
    Device {
        get => this.get_Device()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {GazeDevicePreview} 
     */
    get_Device() {
        if (!this.HasProp("__IGazeDeviceWatcherAddedPreviewEventArgs")) {
            if ((queryResult := this.QueryInterface(IGazeDeviceWatcherAddedPreviewEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeDeviceWatcherAddedPreviewEventArgs := IGazeDeviceWatcherAddedPreviewEventArgs(outPtr)
        }

        return this.__IGazeDeviceWatcherAddedPreviewEventArgs.get_Device()
    }

;@endregion Instance Methods
}
