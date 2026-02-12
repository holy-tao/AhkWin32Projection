#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPwmPin.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a single PWM pin on the system.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.pwmpin
 * @namespace Windows.Devices.Pwm
 * @version WindowsRuntime 1.4
 */
class PwmPin extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPwmPin

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPwmPin.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the PWM controller in use by this pin.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.pwmpin.controller
     * @type {PwmController} 
     */
    Controller {
        get => this.get_Controller()
    }

    /**
     * Gets or sets the polarity of the pin.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.pwmpin.polarity
     * @type {Integer} 
     */
    Polarity {
        get => this.get_Polarity()
        set => this.put_Polarity(value)
    }

    /**
     * Gets the started state of the pin.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.pwmpin.isstarted
     * @type {Boolean} 
     */
    IsStarted {
        get => this.get_IsStarted()
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
     * @returns {PwmController} 
     */
    get_Controller() {
        if (!this.HasProp("__IPwmPin")) {
            if ((queryResult := this.QueryInterface(IPwmPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPwmPin := IPwmPin(outPtr)
        }

        return this.__IPwmPin.get_Controller()
    }

    /**
     * Retrieves the duty cycle percentage for this pin.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.pwmpin.getactivedutycyclepercentage
     */
    GetActiveDutyCyclePercentage() {
        if (!this.HasProp("__IPwmPin")) {
            if ((queryResult := this.QueryInterface(IPwmPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPwmPin := IPwmPin(outPtr)
        }

        return this.__IPwmPin.GetActiveDutyCyclePercentage()
    }

    /**
     * Sets the duty cycle percentage for this pin.
     * @param {Float} dutyCyclePercentage The desired duty cycle percentage, represented as a value between 0.0 and 1.0.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.pwmpin.setactivedutycyclepercentage
     */
    SetActiveDutyCyclePercentage(dutyCyclePercentage) {
        if (!this.HasProp("__IPwmPin")) {
            if ((queryResult := this.QueryInterface(IPwmPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPwmPin := IPwmPin(outPtr)
        }

        return this.__IPwmPin.SetActiveDutyCyclePercentage(dutyCyclePercentage)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Polarity() {
        if (!this.HasProp("__IPwmPin")) {
            if ((queryResult := this.QueryInterface(IPwmPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPwmPin := IPwmPin(outPtr)
        }

        return this.__IPwmPin.get_Polarity()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Polarity(value) {
        if (!this.HasProp("__IPwmPin")) {
            if ((queryResult := this.QueryInterface(IPwmPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPwmPin := IPwmPin(outPtr)
        }

        return this.__IPwmPin.put_Polarity(value)
    }

    /**
     * Starts the PWM on this pin.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.pwmpin.start
     */
    Start() {
        if (!this.HasProp("__IPwmPin")) {
            if ((queryResult := this.QueryInterface(IPwmPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPwmPin := IPwmPin(outPtr)
        }

        return this.__IPwmPin.Start()
    }

    /**
     * Stops the PWM on this pin.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.pwmpin.stop
     */
    Stop() {
        if (!this.HasProp("__IPwmPin")) {
            if ((queryResult := this.QueryInterface(IPwmPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPwmPin := IPwmPin(outPtr)
        }

        return this.__IPwmPin.Stop()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStarted() {
        if (!this.HasProp("__IPwmPin")) {
            if ((queryResult := this.QueryInterface(IPwmPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPwmPin := IPwmPin(outPtr)
        }

        return this.__IPwmPin.get_IsStarted()
    }

    /**
     * Closes current connection to the pin, and makes pin available to be opened by others.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.pwmpin.close
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
