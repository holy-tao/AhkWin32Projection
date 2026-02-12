#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFrameController.ahk
#Include .\IFrameController2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the settings for a frame in a variable photo sequence.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.framecontroller
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class FrameController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFrameController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFrameController.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the exposure settings for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.framecontroller.exposurecontrol
     * @type {FrameExposureControl} 
     */
    ExposureControl {
        get => this.get_ExposureControl()
    }

    /**
     * Gets the exposure compensation settings for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.framecontroller.exposurecompensationcontrol
     * @type {FrameExposureCompensationControl} 
     */
    ExposureCompensationControl {
        get => this.get_ExposureCompensationControl()
    }

    /**
     * Gets the ISO speed settings for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.framecontroller.isospeedcontrol
     * @type {FrameIsoSpeedControl} 
     */
    IsoSpeedControl {
        get => this.get_IsoSpeedControl()
    }

    /**
     * Gets the focus settings for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.framecontroller.focuscontrol
     * @type {FrameFocusControl} 
     */
    FocusControl {
        get => this.get_FocusControl()
    }

    /**
     * Gets or sets whether photo confirmation is enabled for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.framecontroller.photoconfirmationenabled
     * @type {IReference<Boolean>} 
     */
    PhotoConfirmationEnabled {
        get => this.get_PhotoConfirmationEnabled()
        set => this.put_PhotoConfirmationEnabled(value)
    }

    /**
     * Gets the flash settings for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.framecontroller.flashcontrol
     * @type {FrameFlashControl} 
     */
    FlashControl {
        get => this.get_FlashControl()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [FrameController](framecontroller.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Devices.Core.FrameController")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {FrameExposureControl} 
     */
    get_ExposureControl() {
        if (!this.HasProp("__IFrameController")) {
            if ((queryResult := this.QueryInterface(IFrameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameController := IFrameController(outPtr)
        }

        return this.__IFrameController.get_ExposureControl()
    }

    /**
     * 
     * @returns {FrameExposureCompensationControl} 
     */
    get_ExposureCompensationControl() {
        if (!this.HasProp("__IFrameController")) {
            if ((queryResult := this.QueryInterface(IFrameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameController := IFrameController(outPtr)
        }

        return this.__IFrameController.get_ExposureCompensationControl()
    }

    /**
     * 
     * @returns {FrameIsoSpeedControl} 
     */
    get_IsoSpeedControl() {
        if (!this.HasProp("__IFrameController")) {
            if ((queryResult := this.QueryInterface(IFrameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameController := IFrameController(outPtr)
        }

        return this.__IFrameController.get_IsoSpeedControl()
    }

    /**
     * 
     * @returns {FrameFocusControl} 
     */
    get_FocusControl() {
        if (!this.HasProp("__IFrameController")) {
            if ((queryResult := this.QueryInterface(IFrameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameController := IFrameController(outPtr)
        }

        return this.__IFrameController.get_FocusControl()
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_PhotoConfirmationEnabled() {
        if (!this.HasProp("__IFrameController")) {
            if ((queryResult := this.QueryInterface(IFrameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameController := IFrameController(outPtr)
        }

        return this.__IFrameController.get_PhotoConfirmationEnabled()
    }

    /**
     * 
     * @param {IReference<Boolean>} value 
     * @returns {HRESULT} 
     */
    put_PhotoConfirmationEnabled(value) {
        if (!this.HasProp("__IFrameController")) {
            if ((queryResult := this.QueryInterface(IFrameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameController := IFrameController(outPtr)
        }

        return this.__IFrameController.put_PhotoConfirmationEnabled(value)
    }

    /**
     * 
     * @returns {FrameFlashControl} 
     */
    get_FlashControl() {
        if (!this.HasProp("__IFrameController2")) {
            if ((queryResult := this.QueryInterface(IFrameController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameController2 := IFrameController2(outPtr)
        }

        return this.__IFrameController2.get_FlashControl()
    }

;@endregion Instance Methods
}
