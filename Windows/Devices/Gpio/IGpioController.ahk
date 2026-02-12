#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\GpioPin.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Opens and returns the general-purpose I/O (GPIO) pin provider for a specific pin.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.provider.igpiocontrollerprovider.openpinprovider
 * @namespace Windows.Devices.Gpio
 * @version WindowsRuntime 1.4
 */
class IGpioController extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGpioController
     * @type {Guid}
     */
    static IID => Guid("{284012e3-7461-469c-a8bc-61d69d08a53c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PinCount", "OpenPin", "OpenPinWithSharingMode", "TryOpenPin"]

    /**
     * @type {Integer} 
     */
    PinCount {
        get => this.get_PinCount()
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
     * @param {Integer} pinNumber 
     * @returns {GpioPin} 
     */
    OpenPin(pinNumber) {
        result := ComCall(7, this, "int", pinNumber, "ptr*", &pin := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GpioPin(pin)
    }

    /**
     * 
     * @param {Integer} pinNumber 
     * @param {Integer} sharingMode 
     * @returns {GpioPin} 
     */
    OpenPinWithSharingMode(pinNumber, sharingMode) {
        result := ComCall(8, this, "int", pinNumber, "int", sharingMode, "ptr*", &pin := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GpioPin(pin)
    }

    /**
     * 
     * @param {Integer} pinNumber 
     * @param {Integer} sharingMode 
     * @param {Pointer<GpioPin>} pin 
     * @param {Pointer<Int32>} openStatus 
     * @returns {Boolean} 
     */
    TryOpenPin(pinNumber, sharingMode, pin, openStatus) {
        result := ComCall(9, this, "int", pinNumber, "int", sharingMode, "ptr", pin, "ptr", openStatus, "int*", &succeeded := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return succeeded
    }
}
