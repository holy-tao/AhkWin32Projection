#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents actions common to general-purpose I/O (GPIO) pin providers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.provider.igpiopinprovider
 * @namespace Windows.Devices.Gpio.Provider
 * @version WindowsRuntime 1.4
 */
class IGpioPinProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGpioPinProvider
     * @type {Guid}
     */
    static IID => Guid("{42344cb7-6abc-40ff-9ce7-73b85301b900}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_ValueChanged", "remove_ValueChanged", "get_DebounceTimeout", "put_DebounceTimeout", "get_PinNumber", "get_SharingMode", "IsDriveModeSupported", "GetDriveMode", "SetDriveMode", "Write", "Read"]

    /**
     * Gets or sets the debounce timeout for the general-purpose I/O (GPIO) pin, which is an interval during which changes to the value of the pin are filtered out and do not generate [ValueChanged](igpiopinprovider_valuechanged.md) events.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.provider.igpiopinprovider.debouncetimeout
     * @type {TimeSpan} 
     */
    DebounceTimeout {
        get => this.get_DebounceTimeout()
        set => this.put_DebounceTimeout(value)
    }

    /**
     * Gets the pin number of the general-purpose I/O (GPIO) pin.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.provider.igpiopinprovider.pinnumber
     * @type {Integer} 
     */
    PinNumber {
        get => this.get_PinNumber()
    }

    /**
     * Gets the sharing mode in which the general-purpose I/O (GPIO) pin is open.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.provider.igpiopinprovider.sharingmode
     * @type {Integer} 
     */
    SharingMode {
        get => this.get_SharingMode()
    }

    /**
     * 
     * @param {TypedEventHandler<IGpioPinProvider, GpioPinProviderValueChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ValueChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ValueChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DebounceTimeout() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_DebounceTimeout(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PinNumber() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SharingMode() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Determines if a drive mode is supported for the pin.
     * @param {Integer} driveMode The desired drive mode.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.provider.igpiopinprovider.isdrivemodesupported
     */
    IsDriveModeSupported(driveMode) {
        result := ComCall(12, this, "int", driveMode, "int*", &supported := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return supported
    }

    /**
     * Gets the pin's currently configured drive mode.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.provider.igpiopinprovider.getdrivemode
     */
    GetDriveMode() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Sets the pin's drive mode.
     * @param {Integer} value The desired drive mode for the pin.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.provider.igpiopinprovider.setdrivemode
     */
    SetDriveMode(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Writes a value to the pin.
     * @param {Integer} value The value to write.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.provider.igpiopinprovider.write
     */
    Write(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Reads the current value of the pin.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.provider.igpiopinprovider.read
     */
    Read() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
