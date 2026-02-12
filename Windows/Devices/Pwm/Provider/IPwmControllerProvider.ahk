#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents properties and methods common to all PWM controllers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.provider.ipwmcontrollerprovider
 * @namespace Windows.Devices.Pwm.Provider
 * @version WindowsRuntime 1.4
 */
class IPwmControllerProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPwmControllerProvider
     * @type {Guid}
     */
    static IID => Guid("{1300593b-e2e3-40a4-b7d9-48dff0377a52}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PinCount", "get_ActualFrequency", "SetDesiredFrequency", "get_MaxFrequency", "get_MinFrequency", "AcquirePin", "ReleasePin", "EnablePin", "DisablePin", "SetPulseParameters"]

    /**
     * Gets the number of PWM pins available on the system.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.provider.ipwmcontrollerprovider.pincount
     * @type {Integer} 
     */
    PinCount {
        get => this.get_PinCount()
    }

    /**
     * Gets the actual frequency of the PWM.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.provider.ipwmcontrollerprovider.actualfrequency
     * @type {Float} 
     */
    ActualFrequency {
        get => this.get_ActualFrequency()
    }

    /**
     * Gets the maximum frequency offered by the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.provider.ipwmcontrollerprovider.maxfrequency
     * @type {Float} 
     */
    MaxFrequency {
        get => this.get_MaxFrequency()
    }

    /**
     * Gets the minimum frequency offered by the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.provider.ipwmcontrollerprovider.minfrequency
     * @type {Float} 
     */
    MinFrequency {
        get => this.get_MinFrequency()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PinCount() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ActualFrequency() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Sets the desired PWM frequency.
     * @param {Float} frequency The desired frequency in Hz.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.provider.ipwmcontrollerprovider.setdesiredfrequency
     */
    SetDesiredFrequency(frequency) {
        result := ComCall(8, this, "double", frequency, "double*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxFrequency() {
        result := ComCall(9, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinFrequency() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Acquires the specified pin and opens that pin for use.
     * @param {Integer} pin Which pin to open a PWM connection to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.provider.ipwmcontrollerprovider.acquirepin
     */
    AcquirePin(pin) {
        result := ComCall(11, this, "int", pin, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Releases connection to specified pin and makes that pin available to others.
     * @param {Integer} pin Which pin to release.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.provider.ipwmcontrollerprovider.releasepin
     */
    ReleasePin(pin) {
        result := ComCall(12, this, "int", pin, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Starts the PWM signal on the specified pin.
     * @param {Integer} pin Which pin to start the PWM signal on.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.provider.ipwmcontrollerprovider.enablepin
     */
    EnablePin(pin) {
        result := ComCall(13, this, "int", pin, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Stops the PWM on this pin.
     * @param {Integer} pin Which pin to stop the PWM signal on.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.provider.ipwmcontrollerprovider.disablepin
     */
    DisablePin(pin) {
        result := ComCall(14, this, "int", pin, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the PWM parameters for pin, duty cycle, and polarity.
     * @param {Integer} pin Indicates which pin these values apply to.
     * @param {Float} dutyCycle The duty cycle percentage, with value between 0 and 100 inclusive.
     * @param {Boolean} invertPolarity True if polarity of pin should be inverted, otherwise false.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.provider.ipwmcontrollerprovider.setpulseparameters
     */
    SetPulseParameters(pin, dutyCycle, invertPolarity) {
        result := ComCall(15, this, "int", pin, "double", dutyCycle, "int", invertPolarity, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
