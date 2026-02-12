#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdcController.ahk
#Include .\IAdcControllerStatics.ahk
#Include .\IAdcControllerStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an ADC controller on the system
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.adccontroller
 * @namespace Windows.Devices.Adc
 * @version WindowsRuntime 1.4
 */
class AdcController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdcController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdcController.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets all the controllers that are connected to the system asynchronously .
     * @param {IAdcProvider} provider The ADC provider for the controllers on the system.
     * @returns {IAsyncOperation<IVectorView<AdcController>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.adccontroller.getcontrollersasync
     */
    static GetControllersAsync(provider) {
        if (!AdcController.HasProp("__IAdcControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Adc.AdcController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAdcControllerStatics.IID)
            AdcController.__IAdcControllerStatics := IAdcControllerStatics(factoryPtr)
        }

        return AdcController.__IAdcControllerStatics.GetControllersAsync(provider)
    }

    /**
     * Gets the default ADC controller on the system.
     * @returns {IAsyncOperation<AdcController>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.adccontroller.getdefaultasync
     */
    static GetDefaultAsync() {
        if (!AdcController.HasProp("__IAdcControllerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Adc.AdcController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAdcControllerStatics2.IID)
            AdcController.__IAdcControllerStatics2 := IAdcControllerStatics2(factoryPtr)
        }

        return AdcController.__IAdcControllerStatics2.GetDefaultAsync()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The number of channels available on the ADC controller.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.adccontroller.channelcount
     * @type {Integer} 
     */
    ChannelCount {
        get => this.get_ChannelCount()
    }

    /**
     * Gets the resolution of the controller as number of bits it has. For example, if we have a 10-bit ADC, that means it can detect 1024 (2^10) discrete levels.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.adccontroller.resolutioninbits
     * @type {Integer} 
     */
    ResolutionInBits {
        get => this.get_ResolutionInBits()
    }

    /**
     * The minimum value the controller can report.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.adccontroller.minvalue
     * @type {Integer} 
     */
    MinValue {
        get => this.get_MinValue()
    }

    /**
     * Gets the maximum value that the controller can report.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.adccontroller.maxvalue
     * @type {Integer} 
     */
    MaxValue {
        get => this.get_MaxValue()
    }

    /**
     * Gets or sets the channel mode for the ADC controller.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.adccontroller.channelmode
     * @type {Integer} 
     */
    ChannelMode {
        get => this.get_ChannelMode()
        set => this.put_ChannelMode(value)
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
    get_ChannelCount() {
        if (!this.HasProp("__IAdcController")) {
            if ((queryResult := this.QueryInterface(IAdcController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdcController := IAdcController(outPtr)
        }

        return this.__IAdcController.get_ChannelCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResolutionInBits() {
        if (!this.HasProp("__IAdcController")) {
            if ((queryResult := this.QueryInterface(IAdcController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdcController := IAdcController(outPtr)
        }

        return this.__IAdcController.get_ResolutionInBits()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinValue() {
        if (!this.HasProp("__IAdcController")) {
            if ((queryResult := this.QueryInterface(IAdcController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdcController := IAdcController(outPtr)
        }

        return this.__IAdcController.get_MinValue()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxValue() {
        if (!this.HasProp("__IAdcController")) {
            if ((queryResult := this.QueryInterface(IAdcController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdcController := IAdcController(outPtr)
        }

        return this.__IAdcController.get_MaxValue()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChannelMode() {
        if (!this.HasProp("__IAdcController")) {
            if ((queryResult := this.QueryInterface(IAdcController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdcController := IAdcController(outPtr)
        }

        return this.__IAdcController.get_ChannelMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ChannelMode(value) {
        if (!this.HasProp("__IAdcController")) {
            if ((queryResult := this.QueryInterface(IAdcController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdcController := IAdcController(outPtr)
        }

        return this.__IAdcController.put_ChannelMode(value)
    }

    /**
     * Verifies that the specified channel mode is supported by the controller.
     * @param {Integer} channelMode The channel mode.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.adccontroller.ischannelmodesupported
     */
    IsChannelModeSupported(channelMode) {
        if (!this.HasProp("__IAdcController")) {
            if ((queryResult := this.QueryInterface(IAdcController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdcController := IAdcController(outPtr)
        }

        return this.__IAdcController.IsChannelModeSupported(channelMode)
    }

    /**
     * Opens a connection to the specified ADC channel.
     * @param {Integer} channelNumber The channel to connect to.
     * @returns {AdcChannel} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.adccontroller.openchannel
     */
    OpenChannel(channelNumber) {
        if (!this.HasProp("__IAdcController")) {
            if ((queryResult := this.QueryInterface(IAdcController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdcController := IAdcController(outPtr)
        }

        return this.__IAdcController.OpenChannel(channelNumber)
    }

;@endregion Instance Methods
}
