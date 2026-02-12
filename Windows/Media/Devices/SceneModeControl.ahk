#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISceneModeControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality for controlling the scene mode settings on a capture device.
 * @remarks
 * The [SceneModeControl  enables apps to tune the post-processing of captured frames to better match the scene being recorded. The [SupportedModes](scenemodecontrol_supportedmodes.md) enumeration specifies the modes, such as [Snow](capturescenemode.md), [Night](capturescenemode.md), and [Sport](capturescenemode.md), that are supported by the device.
 * 
 * To select a mode, call [SceneModeControl.SetValueAsync](scenemodecontrol_setvalueasync_1270895798.md).
 * 
 * You can access the [SceneModeControl  for the capture device through [MediaCapture.VideoDeviceController](../windows.media.capture/mediacapture_videodevicecontroller.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.scenemodecontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class SceneModeControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISceneModeControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISceneModeControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the scene modes supported on the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.scenemodecontrol.supportedmodes
     * @type {IVectorView<Integer>} 
     */
    SupportedModes {
        get => this.get_SupportedModes()
    }

    /**
     * Gets the current scene mod ethe capture device is set to.
     * @remarks
     * To set this property, call [SetValueAsync](scenemodecontrol_setvalueasync_1270895798.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.scenemodecontrol.value
     * @type {Integer} 
     */
    Value {
        get => this.get_Value()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedModes() {
        if (!this.HasProp("__ISceneModeControl")) {
            if ((queryResult := this.QueryInterface(ISceneModeControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneModeControl := ISceneModeControl(outPtr)
        }

        return this.__ISceneModeControl.get_SupportedModes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Value() {
        if (!this.HasProp("__ISceneModeControl")) {
            if ((queryResult := this.QueryInterface(ISceneModeControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneModeControl := ISceneModeControl(outPtr)
        }

        return this.__ISceneModeControl.get_Value()
    }

    /**
     * Asynchronously sets the color temperature [Value](whitebalancecontrol_value.md).
     * @param {Integer} sceneMode The scene mode to set the [Value](scenemodecontrol_value.md) property to.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.scenemodecontrol.setvalueasync
     */
    SetValueAsync(sceneMode) {
        if (!this.HasProp("__ISceneModeControl")) {
            if ((queryResult := this.QueryInterface(ISceneModeControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneModeControl := ISceneModeControl(outPtr)
        }

        return this.__ISceneModeControl.SetValueAsync(sceneMode)
    }

;@endregion Instance Methods
}
