#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IGpioPinProvider.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents the actions common to all general-purpose I/O (GPIO) controllers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.provider.igpiocontrollerprovider
 * @namespace Windows.Devices.Gpio.Provider
 * @version WindowsRuntime 1.4
 */
class IGpioControllerProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGpioControllerProvider
     * @type {Guid}
     */
    static IID => Guid("{ad11cec7-19ea-4b21-874f-b91aed4a25db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PinCount", "OpenPinProvider"]

    /**
     * Gets the number of general-purpose I/O (GPIO) pins available.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.provider.igpiocontrollerprovider.pincount
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
     * Opens and returns the general-purpose I/O (GPIO) pin provider for a specific pin.
     * @param {Integer} pin The desired GPIO pin number.
     * @param {Integer} sharingMode The sharing mode to open the pin as.
     * @returns {IGpioPinProvider} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.provider.igpiocontrollerprovider.openpinprovider
     */
    OpenPinProvider(pin, sharingMode) {
        result := ComCall(7, this, "int", pin, "int", sharingMode, "ptr*", &gpioPinProvider := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IGpioPinProvider(gpioPinProvider)
    }
}
