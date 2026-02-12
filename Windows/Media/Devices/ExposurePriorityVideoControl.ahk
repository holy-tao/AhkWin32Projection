#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IExposurePriorityVideoControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * When supported, allows an app to specify whether the camera driver can dynamically adjust the frame rate of video capture in order to improve video quality in low-light conditions.
 * @remarks
 * When the ExposurePriorityVideoControl is enabled, the driver may adjust the frame rate in order to compensate for low-light conditions. Apps that require a constant frame rate should disable this control.
 * 
 * For how-to guidance for using manual video capture controls, see [Manual camera controls for video capture](/windows/uwp/audio-video-camera/capture-device-controls-for-video-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.exposurepriorityvideocontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class ExposurePriorityVideoControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IExposurePriorityVideoControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IExposurePriorityVideoControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that specifies if [ExposurePriorityVideoControl](exposurepriorityvideocontrol.md) is supported on the current device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.exposurepriorityvideocontrol.supported
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * Gets or sets a value that specifies if [ExposurePriorityVideoControl](exposurepriorityvideocontrol.md) is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.exposurepriorityvideocontrol.enabled
     * @type {Boolean} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Supported() {
        if (!this.HasProp("__IExposurePriorityVideoControl")) {
            if ((queryResult := this.QueryInterface(IExposurePriorityVideoControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExposurePriorityVideoControl := IExposurePriorityVideoControl(outPtr)
        }

        return this.__IExposurePriorityVideoControl.get_Supported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Enabled() {
        if (!this.HasProp("__IExposurePriorityVideoControl")) {
            if ((queryResult := this.QueryInterface(IExposurePriorityVideoControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExposurePriorityVideoControl := IExposurePriorityVideoControl(outPtr)
        }

        return this.__IExposurePriorityVideoControl.get_Enabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Enabled(value) {
        if (!this.HasProp("__IExposurePriorityVideoControl")) {
            if ((queryResult := this.QueryInterface(IExposurePriorityVideoControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExposurePriorityVideoControl := IExposurePriorityVideoControl(outPtr)
        }

        return this.__IExposurePriorityVideoControl.put_Enabled(value)
    }

;@endregion Instance Methods
}
