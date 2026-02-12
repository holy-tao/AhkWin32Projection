#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICapturedFrameControlValues.ahk
#Include .\ICapturedFrameControlValues2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the capture device settings that were used for a frame in a variable photo sequence.
 * @remarks
 * Get an instance of this class by handling the [VariablePhotoCaptured](../windows.media.capture.core/variablephotocapturedeventargs.md) event and then accessing the [VariablePhotoCapturedEventArgs.CapturedFrameControlValues](../windows.media.capture.core/variablephotocapturedeventargs_capturedframecontrolvalues.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframecontrolvalues
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class CapturedFrameControlValues extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICapturedFrameControlValues

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICapturedFrameControlValues.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the exposure time used for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframecontrolvalues.exposure
     * @type {IReference<TimeSpan>} 
     */
    Exposure {
        get => this.get_Exposure()
    }

    /**
     * Gets the exposure compensation value used for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframecontrolvalues.exposurecompensation
     * @type {IReference<Float>} 
     */
    ExposureCompensation {
        get => this.get_ExposureCompensation()
    }

    /**
     * Gets the ISO speed used for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframecontrolvalues.isospeed
     * @type {IReference<Integer>} 
     */
    IsoSpeed {
        get => this.get_IsoSpeed()
    }

    /**
     * Gets the focus lens position used for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframecontrolvalues.focus
     * @type {IReference<Integer>} 
     */
    Focus {
        get => this.get_Focus()
    }

    /**
     * Gets the scene mode used for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframecontrolvalues.scenemode
     * @type {IReference<Integer>} 
     */
    SceneMode {
        get => this.get_SceneMode()
    }

    /**
     * Gets a value indicating if the flash was used for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframecontrolvalues.flashed
     * @type {IReference<Boolean>} 
     */
    Flashed {
        get => this.get_Flashed()
    }

    /**
     * Gets the flash power used for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframecontrolvalues.flashpowerpercent
     * @type {IReference<Float>} 
     */
    FlashPowerPercent {
        get => this.get_FlashPowerPercent()
    }

    /**
     * Gets the white balance setting used for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframecontrolvalues.whitebalance
     * @type {IReference<Integer>} 
     */
    WhiteBalance {
        get => this.get_WhiteBalance()
    }

    /**
     * Gets the zoom factor used for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframecontrolvalues.zoomfactor
     * @type {IReference<Float>} 
     */
    ZoomFactor {
        get => this.get_ZoomFactor()
    }

    /**
     * Gets the focus state for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframecontrolvalues.focusstate
     * @type {IReference<Integer>} 
     */
    FocusState {
        get => this.get_FocusState()
    }

    /**
     * Gets the ISO digital gain used for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframecontrolvalues.isodigitalgain
     * @type {IReference<Float>} 
     */
    IsoDigitalGain {
        get => this.get_IsoDigitalGain()
    }

    /**
     * Gets the ISO analog gain used for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframecontrolvalues.isoanaloggain
     * @type {IReference<Float>} 
     */
    IsoAnalogGain {
        get => this.get_IsoAnalogGain()
    }

    /**
     * Gets the sensor frame rate used for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframecontrolvalues.sensorframerate
     * @type {MediaRatio} 
     */
    SensorFrameRate {
        get => this.get_SensorFrameRate()
    }

    /**
     * Gets the white balance gain used for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframecontrolvalues.whitebalancegain
     * @type {IReference<WhiteBalanceGain>} 
     */
    WhiteBalanceGain {
        get => this.get_WhiteBalanceGain()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Exposure() {
        if (!this.HasProp("__ICapturedFrameControlValues")) {
            if ((queryResult := this.QueryInterface(ICapturedFrameControlValues.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICapturedFrameControlValues := ICapturedFrameControlValues(outPtr)
        }

        return this.__ICapturedFrameControlValues.get_Exposure()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_ExposureCompensation() {
        if (!this.HasProp("__ICapturedFrameControlValues")) {
            if ((queryResult := this.QueryInterface(ICapturedFrameControlValues.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICapturedFrameControlValues := ICapturedFrameControlValues(outPtr)
        }

        return this.__ICapturedFrameControlValues.get_ExposureCompensation()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_IsoSpeed() {
        if (!this.HasProp("__ICapturedFrameControlValues")) {
            if ((queryResult := this.QueryInterface(ICapturedFrameControlValues.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICapturedFrameControlValues := ICapturedFrameControlValues(outPtr)
        }

        return this.__ICapturedFrameControlValues.get_IsoSpeed()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Focus() {
        if (!this.HasProp("__ICapturedFrameControlValues")) {
            if ((queryResult := this.QueryInterface(ICapturedFrameControlValues.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICapturedFrameControlValues := ICapturedFrameControlValues(outPtr)
        }

        return this.__ICapturedFrameControlValues.get_Focus()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_SceneMode() {
        if (!this.HasProp("__ICapturedFrameControlValues")) {
            if ((queryResult := this.QueryInterface(ICapturedFrameControlValues.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICapturedFrameControlValues := ICapturedFrameControlValues(outPtr)
        }

        return this.__ICapturedFrameControlValues.get_SceneMode()
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_Flashed() {
        if (!this.HasProp("__ICapturedFrameControlValues")) {
            if ((queryResult := this.QueryInterface(ICapturedFrameControlValues.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICapturedFrameControlValues := ICapturedFrameControlValues(outPtr)
        }

        return this.__ICapturedFrameControlValues.get_Flashed()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_FlashPowerPercent() {
        if (!this.HasProp("__ICapturedFrameControlValues")) {
            if ((queryResult := this.QueryInterface(ICapturedFrameControlValues.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICapturedFrameControlValues := ICapturedFrameControlValues(outPtr)
        }

        return this.__ICapturedFrameControlValues.get_FlashPowerPercent()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_WhiteBalance() {
        if (!this.HasProp("__ICapturedFrameControlValues")) {
            if ((queryResult := this.QueryInterface(ICapturedFrameControlValues.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICapturedFrameControlValues := ICapturedFrameControlValues(outPtr)
        }

        return this.__ICapturedFrameControlValues.get_WhiteBalance()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_ZoomFactor() {
        if (!this.HasProp("__ICapturedFrameControlValues")) {
            if ((queryResult := this.QueryInterface(ICapturedFrameControlValues.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICapturedFrameControlValues := ICapturedFrameControlValues(outPtr)
        }

        return this.__ICapturedFrameControlValues.get_ZoomFactor()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_FocusState() {
        if (!this.HasProp("__ICapturedFrameControlValues2")) {
            if ((queryResult := this.QueryInterface(ICapturedFrameControlValues2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICapturedFrameControlValues2 := ICapturedFrameControlValues2(outPtr)
        }

        return this.__ICapturedFrameControlValues2.get_FocusState()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_IsoDigitalGain() {
        if (!this.HasProp("__ICapturedFrameControlValues2")) {
            if ((queryResult := this.QueryInterface(ICapturedFrameControlValues2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICapturedFrameControlValues2 := ICapturedFrameControlValues2(outPtr)
        }

        return this.__ICapturedFrameControlValues2.get_IsoDigitalGain()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_IsoAnalogGain() {
        if (!this.HasProp("__ICapturedFrameControlValues2")) {
            if ((queryResult := this.QueryInterface(ICapturedFrameControlValues2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICapturedFrameControlValues2 := ICapturedFrameControlValues2(outPtr)
        }

        return this.__ICapturedFrameControlValues2.get_IsoAnalogGain()
    }

    /**
     * 
     * @returns {MediaRatio} 
     */
    get_SensorFrameRate() {
        if (!this.HasProp("__ICapturedFrameControlValues2")) {
            if ((queryResult := this.QueryInterface(ICapturedFrameControlValues2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICapturedFrameControlValues2 := ICapturedFrameControlValues2(outPtr)
        }

        return this.__ICapturedFrameControlValues2.get_SensorFrameRate()
    }

    /**
     * 
     * @returns {IReference<WhiteBalanceGain>} 
     */
    get_WhiteBalanceGain() {
        if (!this.HasProp("__ICapturedFrameControlValues2")) {
            if ((queryResult := this.QueryInterface(ICapturedFrameControlValues2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICapturedFrameControlValues2 := ICapturedFrameControlValues2(outPtr)
        }

        return this.__ICapturedFrameControlValues2.get_WhiteBalanceGain()
    }

;@endregion Instance Methods
}
