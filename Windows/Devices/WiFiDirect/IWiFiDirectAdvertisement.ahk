#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\WiFiDirectInformationElement.ahk
#Include .\WiFiDirectLegacySettings.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class IWiFiDirectAdvertisement extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiDirectAdvertisement
     * @type {Guid}
     */
    static IID => Guid("{ab511a2d-2a06-49a1-a584-61435c7905a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InformationElements", "put_InformationElements", "get_ListenStateDiscoverability", "put_ListenStateDiscoverability", "get_IsAutonomousGroupOwnerEnabled", "put_IsAutonomousGroupOwnerEnabled", "get_LegacySettings"]

    /**
     * @type {IVector<WiFiDirectInformationElement>} 
     */
    InformationElements {
        get => this.get_InformationElements()
        set => this.put_InformationElements(value)
    }

    /**
     * @type {Integer} 
     */
    ListenStateDiscoverability {
        get => this.get_ListenStateDiscoverability()
        set => this.put_ListenStateDiscoverability(value)
    }

    /**
     * @type {Boolean} 
     */
    IsAutonomousGroupOwnerEnabled {
        get => this.get_IsAutonomousGroupOwnerEnabled()
        set => this.put_IsAutonomousGroupOwnerEnabled(value)
    }

    /**
     * @type {WiFiDirectLegacySettings} 
     */
    LegacySettings {
        get => this.get_LegacySettings()
    }

    /**
     * 
     * @returns {IVector<WiFiDirectInformationElement>} 
     */
    get_InformationElements() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(WiFiDirectInformationElement, value)
    }

    /**
     * 
     * @param {IVector<WiFiDirectInformationElement>} value 
     * @returns {HRESULT} 
     */
    put_InformationElements(value) {
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
    get_ListenStateDiscoverability() {
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
    put_ListenStateDiscoverability(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAutonomousGroupOwnerEnabled() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_IsAutonomousGroupOwnerEnabled(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {WiFiDirectLegacySettings} 
     */
    get_LegacySettings() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WiFiDirectLegacySettings(value)
    }
}
