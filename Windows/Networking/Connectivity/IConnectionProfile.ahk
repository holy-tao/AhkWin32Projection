#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\ConnectionCost.ahk
#Include .\DataPlanStatus.ahk
#Include .\NetworkAdapter.ahk
#Include .\DataUsage.ahk
#Include .\NetworkSecuritySettings.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class IConnectionProfile extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConnectionProfile
     * @type {Guid}
     */
    static IID => Guid("{71ba143c-598e-49d0-84eb-8febaedcc195}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProfileName", "GetNetworkConnectivityLevel", "GetNetworkNames", "GetConnectionCost", "GetDataPlanStatus", "get_NetworkAdapter", "GetLocalUsage", "GetLocalUsagePerRoamingStates", "get_NetworkSecuritySettings"]

    /**
     * @type {HSTRING} 
     */
    ProfileName {
        get => this.get_ProfileName()
    }

    /**
     * @type {NetworkAdapter} 
     */
    NetworkAdapter {
        get => this.get_NetworkAdapter()
    }

    /**
     * @type {NetworkSecuritySettings} 
     */
    NetworkSecuritySettings {
        get => this.get_NetworkSecuritySettings()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProfileName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNetworkConnectivityLevel() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    GetNetworkNames() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {ConnectionCost} 
     */
    GetConnectionCost() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ConnectionCost(value)
    }

    /**
     * 
     * @returns {DataPlanStatus} 
     */
    GetDataPlanStatus() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataPlanStatus(value)
    }

    /**
     * 
     * @returns {NetworkAdapter} 
     */
    get_NetworkAdapter() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NetworkAdapter(value)
    }

    /**
     * 
     * @param {DateTime} StartTime 
     * @param {DateTime} EndTime 
     * @returns {DataUsage} 
     */
    GetLocalUsage(StartTime, EndTime) {
        result := ComCall(12, this, "ptr", StartTime, "ptr", EndTime, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataUsage(value)
    }

    /**
     * 
     * @param {DateTime} StartTime 
     * @param {DateTime} EndTime 
     * @param {Integer} States 
     * @returns {DataUsage} 
     */
    GetLocalUsagePerRoamingStates(StartTime, EndTime, States) {
        result := ComCall(13, this, "ptr", StartTime, "ptr", EndTime, "uint", States, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataUsage(value)
    }

    /**
     * 
     * @returns {NetworkSecuritySettings} 
     */
    get_NetworkSecuritySettings() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NetworkSecuritySettings(value)
    }
}
