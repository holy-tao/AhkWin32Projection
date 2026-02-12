#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFrameFlashControl.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the flash settings for a frame in a variable photo sequence.
 * @remarks
 * Get an instance of this class by accessing the [FrameController.FlashControl](framecontroller_flashcontrol.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameflashcontrol
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class FrameFlashControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFrameFlashControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFrameFlashControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the flash mode for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameflashcontrol.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

    /**
     * Gets or sets a value indicating whether flash settings are automatically set for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameflashcontrol.auto
     * @type {Boolean} 
     */
    Auto {
        get => this.get_Auto()
        set => this.put_Auto(value)
    }

    /**
     * Gets or sets a value indicating if red eye reduction is enabled for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameflashcontrol.redeyereduction
     * @type {Boolean} 
     */
    RedEyeReduction {
        get => this.get_RedEyeReduction()
        set => this.put_RedEyeReduction(value)
    }

    /**
     * Gets or sets the flash power for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameflashcontrol.powerpercent
     * @type {Float} 
     */
    PowerPercent {
        get => this.get_PowerPercent()
        set => this.put_PowerPercent(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        if (!this.HasProp("__IFrameFlashControl")) {
            if ((queryResult := this.QueryInterface(IFrameFlashControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameFlashControl := IFrameFlashControl(outPtr)
        }

        return this.__IFrameFlashControl.get_Mode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Mode(value) {
        if (!this.HasProp("__IFrameFlashControl")) {
            if ((queryResult := this.QueryInterface(IFrameFlashControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameFlashControl := IFrameFlashControl(outPtr)
        }

        return this.__IFrameFlashControl.put_Mode(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Auto() {
        if (!this.HasProp("__IFrameFlashControl")) {
            if ((queryResult := this.QueryInterface(IFrameFlashControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameFlashControl := IFrameFlashControl(outPtr)
        }

        return this.__IFrameFlashControl.get_Auto()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Auto(value) {
        if (!this.HasProp("__IFrameFlashControl")) {
            if ((queryResult := this.QueryInterface(IFrameFlashControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameFlashControl := IFrameFlashControl(outPtr)
        }

        return this.__IFrameFlashControl.put_Auto(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RedEyeReduction() {
        if (!this.HasProp("__IFrameFlashControl")) {
            if ((queryResult := this.QueryInterface(IFrameFlashControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameFlashControl := IFrameFlashControl(outPtr)
        }

        return this.__IFrameFlashControl.get_RedEyeReduction()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RedEyeReduction(value) {
        if (!this.HasProp("__IFrameFlashControl")) {
            if ((queryResult := this.QueryInterface(IFrameFlashControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameFlashControl := IFrameFlashControl(outPtr)
        }

        return this.__IFrameFlashControl.put_RedEyeReduction(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PowerPercent() {
        if (!this.HasProp("__IFrameFlashControl")) {
            if ((queryResult := this.QueryInterface(IFrameFlashControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameFlashControl := IFrameFlashControl(outPtr)
        }

        return this.__IFrameFlashControl.get_PowerPercent()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_PowerPercent(value) {
        if (!this.HasProp("__IFrameFlashControl")) {
            if ((queryResult := this.QueryInterface(IFrameFlashControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameFlashControl := IFrameFlashControl(outPtr)
        }

        return this.__IFrameFlashControl.put_PowerPercent(value)
    }

;@endregion Instance Methods
}
