#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFrameExposureControl.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the exposure time settings for a frame in a variable photo sequence.
 * @remarks
 * Get an instance of this class by accessing the [ExposureControl](framecontroller_exposurecontrol.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameexposurecontrol
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class FrameExposureControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFrameExposureControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFrameExposureControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value indicating whether auto exposure is enabled for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameexposurecontrol.auto
     * @type {Boolean} 
     */
    Auto {
        get => this.get_Auto()
        set => this.put_Auto(value)
    }

    /**
     * Gets or sets the exposure time for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameexposurecontrol.value
     * @type {IReference<TimeSpan>} 
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
        if (!this.HasProp("__IFrameExposureControl")) {
            if ((queryResult := this.QueryInterface(IFrameExposureControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameExposureControl := IFrameExposureControl(outPtr)
        }

        return this.__IFrameExposureControl.get_Auto()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Auto(value) {
        if (!this.HasProp("__IFrameExposureControl")) {
            if ((queryResult := this.QueryInterface(IFrameExposureControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameExposureControl := IFrameExposureControl(outPtr)
        }

        return this.__IFrameExposureControl.put_Auto(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Value() {
        if (!this.HasProp("__IFrameExposureControl")) {
            if ((queryResult := this.QueryInterface(IFrameExposureControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameExposureControl := IFrameExposureControl(outPtr)
        }

        return this.__IFrameExposureControl.get_Value()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IFrameExposureControl")) {
            if ((queryResult := this.QueryInterface(IFrameExposureControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameExposureControl := IFrameExposureControl(outPtr)
        }

        return this.__IFrameExposureControl.put_Value(value)
    }

;@endregion Instance Methods
}
