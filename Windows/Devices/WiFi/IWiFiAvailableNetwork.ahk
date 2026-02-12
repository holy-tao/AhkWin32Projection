#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Networking\Connectivity\NetworkSecuritySettings.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class IWiFiAvailableNetwork extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiAvailableNetwork
     * @type {Guid}
     */
    static IID => Guid("{26e96246-183e-4704-9826-71b4a2f0f668}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Uptime", "get_Ssid", "get_Bssid", "get_ChannelCenterFrequencyInKilohertz", "get_NetworkRssiInDecibelMilliwatts", "get_SignalBars", "get_NetworkKind", "get_PhyKind", "get_SecuritySettings", "get_BeaconInterval", "get_IsWiFiDirect"]

    /**
     * @type {TimeSpan} 
     */
    Uptime {
        get => this.get_Uptime()
    }

    /**
     * @type {HSTRING} 
     */
    Ssid {
        get => this.get_Ssid()
    }

    /**
     * @type {HSTRING} 
     */
    Bssid {
        get => this.get_Bssid()
    }

    /**
     * @type {Integer} 
     */
    ChannelCenterFrequencyInKilohertz {
        get => this.get_ChannelCenterFrequencyInKilohertz()
    }

    /**
     * @type {Float} 
     */
    NetworkRssiInDecibelMilliwatts {
        get => this.get_NetworkRssiInDecibelMilliwatts()
    }

    /**
     * @type {Integer} 
     */
    SignalBars {
        get => this.get_SignalBars()
    }

    /**
     * @type {Integer} 
     */
    NetworkKind {
        get => this.get_NetworkKind()
    }

    /**
     * @type {Integer} 
     */
    PhyKind {
        get => this.get_PhyKind()
    }

    /**
     * @type {NetworkSecuritySettings} 
     */
    SecuritySettings {
        get => this.get_SecuritySettings()
    }

    /**
     * @type {TimeSpan} 
     */
    BeaconInterval {
        get => this.get_BeaconInterval()
    }

    /**
     * @type {Boolean} 
     */
    IsWiFiDirect {
        get => this.get_IsWiFiDirect()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Uptime() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Ssid() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Bssid() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChannelCenterFrequencyInKilohertz() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NetworkRssiInDecibelMilliwatts() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SignalBars() {
        result := ComCall(11, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NetworkKind() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PhyKind() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {NetworkSecuritySettings} 
     */
    get_SecuritySettings() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NetworkSecuritySettings(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_BeaconInterval() {
        value := TimeSpan()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsWiFiDirect() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
