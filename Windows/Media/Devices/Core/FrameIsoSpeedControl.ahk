#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFrameIsoSpeedControl.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the ISO speed settings for a frame in a variable photo sequence.
 * @remarks
 * Get an instance of this class by accessing the [IsoSpeedControl](framecontroller_isospeedcontrol.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameisospeedcontrol
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class FrameIsoSpeedControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFrameIsoSpeedControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFrameIsoSpeedControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value indicating whether ISO speed is automatically set for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameisospeedcontrol.auto
     * @type {Boolean} 
     */
    Auto {
        get => this.get_Auto()
        set => this.put_Auto(value)
    }

    /**
     * Gets or sets the ISO speed for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameisospeedcontrol.value
     * @type {IReference<Integer>} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
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
    get_Auto() {
        if (!this.HasProp("__IFrameIsoSpeedControl")) {
            if ((queryResult := this.QueryInterface(IFrameIsoSpeedControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameIsoSpeedControl := IFrameIsoSpeedControl(outPtr)
        }

        return this.__IFrameIsoSpeedControl.get_Auto()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Auto(value) {
        if (!this.HasProp("__IFrameIsoSpeedControl")) {
            if ((queryResult := this.QueryInterface(IFrameIsoSpeedControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameIsoSpeedControl := IFrameIsoSpeedControl(outPtr)
        }

        return this.__IFrameIsoSpeedControl.put_Auto(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Value() {
        if (!this.HasProp("__IFrameIsoSpeedControl")) {
            if ((queryResult := this.QueryInterface(IFrameIsoSpeedControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameIsoSpeedControl := IFrameIsoSpeedControl(outPtr)
        }

        return this.__IFrameIsoSpeedControl.get_Value()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IFrameIsoSpeedControl")) {
            if ((queryResult := this.QueryInterface(IFrameIsoSpeedControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameIsoSpeedControl := IFrameIsoSpeedControl(outPtr)
        }

        return this.__IFrameIsoSpeedControl.put_Value(value)
    }

;@endregion Instance Methods
}
