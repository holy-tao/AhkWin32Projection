#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PwmPin.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Acquires the specified pin and opens that pin for use.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.provider.ipwmcontrollerprovider.acquirepin
 * @namespace Windows.Devices.Pwm
 * @version WindowsRuntime 1.4
 */
class IPwmController extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPwmController
     * @type {Guid}
     */
    static IID => Guid("{c45f5c85-d2e8-42cf-9bd6-cf5ed029e6a7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PinCount", "get_ActualFrequency", "SetDesiredFrequency", "get_MinFrequency", "get_MaxFrequency", "OpenPin"]

    /**
     * @type {Integer} 
     */
    PinCount {
        get => this.get_PinCount()
    }

    /**
     * @type {Float} 
     */
    ActualFrequency {
        get => this.get_ActualFrequency()
    }

    /**
     * @type {Float} 
     */
    MinFrequency {
        get => this.get_MinFrequency()
    }

    /**
     * @type {Float} 
     */
    MaxFrequency {
        get => this.get_MaxFrequency()
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
     * 
     * @param {Float} desiredFrequency 
     * @returns {Float} 
     */
    SetDesiredFrequency(desiredFrequency) {
        result := ComCall(8, this, "double", desiredFrequency, "double*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinFrequency() {
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
    get_MaxFrequency() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} pinNumber 
     * @returns {PwmPin} 
     */
    OpenPin(pinNumber) {
        result := ComCall(11, this, "int", pinNumber, "ptr*", &pin := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PwmPin(pin)
    }
}
