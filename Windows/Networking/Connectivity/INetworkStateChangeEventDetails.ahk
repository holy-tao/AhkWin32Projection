#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class INetworkStateChangeEventDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkStateChangeEventDetails
     * @type {Guid}
     */
    static IID => Guid("{1f0cf333-d7a6-44dd-a4e9-687c476b903d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HasNewInternetConnectionProfile", "get_HasNewConnectionCost", "get_HasNewNetworkConnectivityLevel", "get_HasNewDomainConnectivityLevel", "get_HasNewHostNameList", "get_HasNewWwanRegistrationState"]

    /**
     * @type {Boolean} 
     */
    HasNewInternetConnectionProfile {
        get => this.get_HasNewInternetConnectionProfile()
    }

    /**
     * @type {Boolean} 
     */
    HasNewConnectionCost {
        get => this.get_HasNewConnectionCost()
    }

    /**
     * @type {Boolean} 
     */
    HasNewNetworkConnectivityLevel {
        get => this.get_HasNewNetworkConnectivityLevel()
    }

    /**
     * @type {Boolean} 
     */
    HasNewDomainConnectivityLevel {
        get => this.get_HasNewDomainConnectivityLevel()
    }

    /**
     * @type {Boolean} 
     */
    HasNewHostNameList {
        get => this.get_HasNewHostNameList()
    }

    /**
     * @type {Boolean} 
     */
    HasNewWwanRegistrationState {
        get => this.get_HasNewWwanRegistrationState()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasNewInternetConnectionProfile() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasNewConnectionCost() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasNewNetworkConnectivityLevel() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasNewDomainConnectivityLevel() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasNewHostNameList() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasNewWwanRegistrationState() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
