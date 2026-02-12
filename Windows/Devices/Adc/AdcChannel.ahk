#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdcChannel.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a single ADC channel.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.adcchannel
 * @namespace Windows.Devices.Adc
 * @version WindowsRuntime 1.4
 */
class AdcChannel extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdcChannel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdcChannel.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ADC controller for this channel.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.adcchannel.controller
     * @type {AdcController} 
     */
    Controller {
        get => this.get_Controller()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {AdcController} 
     */
    get_Controller() {
        if (!this.HasProp("__IAdcChannel")) {
            if ((queryResult := this.QueryInterface(IAdcChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdcChannel := IAdcChannel(outPtr)
        }

        return this.__IAdcChannel.get_Controller()
    }

    /**
     * Reads the digital representation of the analog value from the ADC.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.adcchannel.readvalue
     */
    ReadValue() {
        if (!this.HasProp("__IAdcChannel")) {
            if ((queryResult := this.QueryInterface(IAdcChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdcChannel := IAdcChannel(outPtr)
        }

        return this.__IAdcChannel.ReadValue()
    }

    /**
     * Reads the value as a percentage of the max value possible for this controller.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.adcchannel.readratio
     */
    ReadRatio() {
        if (!this.HasProp("__IAdcChannel")) {
            if ((queryResult := this.QueryInterface(IAdcChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdcChannel := IAdcChannel(outPtr)
        }

        return this.__IAdcChannel.ReadRatio()
    }

    /**
     * Closes the connection on this channel, making it available to be opened by others.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.adcchannel.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
