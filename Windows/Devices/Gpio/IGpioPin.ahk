#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Gets the pin's currently configured drive mode.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.provider.igpiopinprovider.getdrivemode
 * @namespace Windows.Devices.Gpio
 * @version WindowsRuntime 1.4
 */
class IGpioPin extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGpioPin
     * @type {Guid}
     */
    static IID => Guid("{11d9b087-afae-4790-9ee9-e0eac942d201}")

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
     * @type {TimeSpan} 
     */
    DebounceTimeout {
        get => this.get_DebounceTimeout()
        set => this.put_DebounceTimeout(value)
    }

    /**
     * @type {Integer} 
     */
    PinNumber {
        get => this.get_PinNumber()
    }

    /**
     * @type {Integer} 
     */
    SharingMode {
        get => this.get_SharingMode()
    }

    /**
     * 
     * @param {TypedEventHandler<GpioPin, GpioPinValueChangedEventArgs>} handler 
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
     * 
     * @param {Integer} driveMode 
     * @returns {Boolean} 
     */
    IsDriveModeSupported(driveMode) {
        result := ComCall(12, this, "int", driveMode, "int*", &supported := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return supported
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDriveMode() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetDriveMode(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This article helps you to configure the Script Task.
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/integration-services/extending-packages-scripting-task-examples/write-event-log-script-task
     */
    Write(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Learn how to read a FILESTREAM column to a file using the IBCPSession interface in OLE DB Driver for SQL Server and write a format file with this example.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/oledb/ole-db-how-to/filestream/read-a-filestream-column-to-file-using-ibcpsession-ole-db
     */
    Read() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
