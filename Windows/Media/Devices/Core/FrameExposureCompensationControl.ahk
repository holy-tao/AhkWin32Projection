#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFrameExposureCompensationControl.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the exposure compensation settings for a frame in a variable photo sequence.
 * @remarks
 * Get an instance of this class by accessing the [ExposureCompensation](framecontrolcapabilities_exposurecompensation.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameexposurecompensationcontrol
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class FrameExposureCompensationControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFrameExposureCompensationControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFrameExposureCompensationControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the exposure compensation time for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameexposurecompensationcontrol.value
     * @type {IReference<Float>} 
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
     * @returns {IReference<Float>} 
     */
    get_Value() {
        if (!this.HasProp("__IFrameExposureCompensationControl")) {
            if ((queryResult := this.QueryInterface(IFrameExposureCompensationControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameExposureCompensationControl := IFrameExposureCompensationControl(outPtr)
        }

        return this.__IFrameExposureCompensationControl.get_Value()
    }

    /**
     * 
     * @param {IReference<Float>} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IFrameExposureCompensationControl")) {
            if ((queryResult := this.QueryInterface(IFrameExposureCompensationControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameExposureCompensationControl := IFrameExposureCompensationControl(outPtr)
        }

        return this.__IFrameExposureCompensationControl.put_Value(value)
    }

;@endregion Instance Methods
}
