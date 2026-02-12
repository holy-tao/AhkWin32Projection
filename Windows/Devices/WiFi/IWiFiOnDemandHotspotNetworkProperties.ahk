#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Security\Credentials\PasswordCredential.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class IWiFiOnDemandHotspotNetworkProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiOnDemandHotspotNetworkProperties
     * @type {Guid}
     */
    static IID => Guid("{c810a1f2-c81d-5852-be50-e4bd4d81e98d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayName", "put_DisplayName", "get_Availability", "put_Availability", "get_RemainingBatteryPercent", "put_RemainingBatteryPercent", "get_CellularBars", "put_CellularBars", "get_IsMetered", "put_IsMetered", "get_Ssid", "put_Ssid", "get_Password", "put_Password"]

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * @type {Integer} 
     */
    Availability {
        get => this.get_Availability()
        set => this.put_Availability(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    RemainingBatteryPercent {
        get => this.get_RemainingBatteryPercent()
        set => this.put_RemainingBatteryPercent(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    CellularBars {
        get => this.get_CellularBars()
        set => this.put_CellularBars(value)
    }

    /**
     * @type {Boolean} 
     */
    IsMetered {
        get => this.get_IsMetered()
        set => this.put_IsMetered(value)
    }

    /**
     * @type {HSTRING} 
     */
    Ssid {
        get => this.get_Ssid()
        set => this.put_Ssid(value)
    }

    /**
     * @type {PasswordCredential} 
     */
    Password {
        get => this.get_Password()
        set => this.put_Password(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Availability() {
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
    put_Availability(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_RemainingBatteryPercent() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_RemainingBatteryPercent(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_CellularBars() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_CellularBars(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMetered() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsMetered(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Ssid() {
        value := HSTRING()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Ssid(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_Password() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PasswordCredential(value)
    }

    /**
     * 
     * @param {PasswordCredential} value 
     * @returns {HRESULT} 
     */
    put_Password(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
