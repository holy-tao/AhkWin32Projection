#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.I2c.Provider
 * @version WindowsRuntime 1.4
 */
class IProviderI2cConnectionSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProviderI2cConnectionSettings
     * @type {Guid}
     */
    static IID => Guid("{e9db4e34-e510-44b7-809d-f2f85b555339}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SlaveAddress", "put_SlaveAddress", "get_BusSpeed", "put_BusSpeed", "get_SharingMode", "put_SharingMode"]

    /**
     * @type {Integer} 
     */
    SlaveAddress {
        get => this.get_SlaveAddress()
        set => this.put_SlaveAddress(value)
    }

    /**
     * @type {Integer} 
     */
    BusSpeed {
        get => this.get_BusSpeed()
        set => this.put_BusSpeed(value)
    }

    /**
     * @type {Integer} 
     */
    SharingMode {
        get => this.get_SharingMode()
        set => this.put_SharingMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SlaveAddress() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_SlaveAddress(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BusSpeed() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_BusSpeed(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SharingMode() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_SharingMode(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
