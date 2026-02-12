#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [MediaCapture.CaptureDeviceExclusiveControlStatusChanged](mediacapture_capturedeviceexclusivecontrolstatuschanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturedeviceexclusivecontrolstatuschangedeventargs
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class MediaCaptureDeviceExclusiveControlStatusChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the device ID for the capture device for which exlusive control status has changed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturedeviceexclusivecontrolstatuschangedeventargs.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets a value indicating whether exclusive control of the capture device specified with the [DeviceID](mediacapturedeviceexclusivecontrolstatuschangedeventargs_deviceid.md) property is available to the current app.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturedeviceexclusivecontrolstatuschangedeventargs.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs := IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs(outPtr)
        }

        return this.__IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs.get_DeviceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs := IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs(outPtr)
        }

        return this.__IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs.get_Status()
    }

;@endregion Instance Methods
}
