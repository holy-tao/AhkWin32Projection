#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class IConnectionProfileFilter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConnectionProfileFilter
     * @type {Guid}
     */
    static IID => Guid("{204c7cc8-bd2d-4e8d-a4b3-455ec337388a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_IsConnected", "get_IsConnected", "put_IsWwanConnectionProfile", "get_IsWwanConnectionProfile", "put_IsWlanConnectionProfile", "get_IsWlanConnectionProfile", "put_NetworkCostType", "get_NetworkCostType", "put_ServiceProviderGuid", "get_ServiceProviderGuid"]

    /**
     * @type {Boolean} 
     */
    IsConnected {
        get => this.get_IsConnected()
        set => this.put_IsConnected(value)
    }

    /**
     * @type {Boolean} 
     */
    IsWwanConnectionProfile {
        get => this.get_IsWwanConnectionProfile()
        set => this.put_IsWwanConnectionProfile(value)
    }

    /**
     * @type {Boolean} 
     */
    IsWlanConnectionProfile {
        get => this.get_IsWlanConnectionProfile()
        set => this.put_IsWlanConnectionProfile(value)
    }

    /**
     * @type {Integer} 
     */
    NetworkCostType {
        get => this.get_NetworkCostType()
        set => this.put_NetworkCostType(value)
    }

    /**
     * @type {IReference<Guid>} 
     */
    ServiceProviderGuid {
        get => this.get_ServiceProviderGuid()
        set => this.put_ServiceProviderGuid(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsConnected(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConnected() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_IsWwanConnectionProfile(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsWwanConnectionProfile() {
        result := ComCall(9, this, "int*", &value := 0, "int")
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
    put_IsWlanConnectionProfile(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsWlanConnectionProfile() {
        result := ComCall(11, this, "int*", &value := 0, "int")
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
    put_NetworkCostType(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NetworkCostType() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IReference<Guid>} value 
     * @returns {HRESULT} 
     */
    put_ServiceProviderGuid(value) {
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Guid>} 
     */
    get_ServiceProviderGuid() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetGuid(), value)
    }
}
