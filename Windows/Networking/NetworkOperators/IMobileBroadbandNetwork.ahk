#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Connectivity\NetworkAdapter.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandNetwork extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandNetwork
     * @type {Guid}
     */
    static IID => Guid("{cb63928c-0309-4cb6-a8c1-6a5a3c8e1ff6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NetworkAdapter", "get_NetworkRegistrationState", "get_RegistrationNetworkError", "get_PacketAttachNetworkError", "get_ActivationNetworkError", "get_AccessPointName", "get_RegisteredDataClass", "get_RegisteredProviderId", "get_RegisteredProviderName", "ShowConnectionUI"]

    /**
     * @type {NetworkAdapter} 
     */
    NetworkAdapter {
        get => this.get_NetworkAdapter()
    }

    /**
     * @type {Integer} 
     */
    NetworkRegistrationState {
        get => this.get_NetworkRegistrationState()
    }

    /**
     * @type {Integer} 
     */
    RegistrationNetworkError {
        get => this.get_RegistrationNetworkError()
    }

    /**
     * @type {Integer} 
     */
    PacketAttachNetworkError {
        get => this.get_PacketAttachNetworkError()
    }

    /**
     * @type {Integer} 
     */
    ActivationNetworkError {
        get => this.get_ActivationNetworkError()
    }

    /**
     * @type {HSTRING} 
     */
    AccessPointName {
        get => this.get_AccessPointName()
    }

    /**
     * @type {Integer} 
     */
    RegisteredDataClass {
        get => this.get_RegisteredDataClass()
    }

    /**
     * @type {HSTRING} 
     */
    RegisteredProviderId {
        get => this.get_RegisteredProviderId()
    }

    /**
     * @type {HSTRING} 
     */
    RegisteredProviderName {
        get => this.get_RegisteredProviderName()
    }

    /**
     * 
     * @returns {NetworkAdapter} 
     */
    get_NetworkAdapter() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NetworkAdapter(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NetworkRegistrationState() {
        result := ComCall(7, this, "int*", &registrationState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return registrationState
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RegistrationNetworkError() {
        result := ComCall(8, this, "uint*", &networkError := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return networkError
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PacketAttachNetworkError() {
        result := ComCall(9, this, "uint*", &networkError := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return networkError
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ActivationNetworkError() {
        result := ComCall(10, this, "uint*", &networkError := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return networkError
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AccessPointName() {
        apn := HSTRING()
        result := ComCall(11, this, "ptr", apn, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return apn
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RegisteredDataClass() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RegisteredProviderId() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RegisteredProviderName() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShowConnectionUI() {
        result := ComCall(15, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
