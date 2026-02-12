#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VpnAppId.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnTrafficFilter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnTrafficFilter
     * @type {Guid}
     */
    static IID => Guid("{2f691b60-6c9f-47f5-ac36-bb1b042e2c50}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppId", "put_AppId", "get_AppClaims", "get_Protocol", "put_Protocol", "get_LocalPortRanges", "get_RemotePortRanges", "get_LocalAddressRanges", "get_RemoteAddressRanges", "get_RoutingPolicyType", "put_RoutingPolicyType"]

    /**
     * @type {VpnAppId} 
     */
    AppId {
        get => this.get_AppId()
        set => this.put_AppId(value)
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    AppClaims {
        get => this.get_AppClaims()
    }

    /**
     * @type {Integer} 
     */
    Protocol {
        get => this.get_Protocol()
        set => this.put_Protocol(value)
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    LocalPortRanges {
        get => this.get_LocalPortRanges()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    RemotePortRanges {
        get => this.get_RemotePortRanges()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    LocalAddressRanges {
        get => this.get_LocalAddressRanges()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    RemoteAddressRanges {
        get => this.get_RemoteAddressRanges()
    }

    /**
     * @type {Integer} 
     */
    RoutingPolicyType {
        get => this.get_RoutingPolicyType()
        set => this.put_RoutingPolicyType(value)
    }

    /**
     * 
     * @returns {VpnAppId} 
     */
    get_AppId() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VpnAppId(value)
    }

    /**
     * 
     * @param {VpnAppId} value 
     * @returns {HRESULT} 
     */
    put_AppId(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_AppClaims() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Protocol() {
        result := ComCall(9, this, "int*", &value := 0, "int")
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
    put_Protocol(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_LocalPortRanges() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_RemotePortRanges() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_LocalAddressRanges() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_RemoteAddressRanges() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RoutingPolicyType() {
        result := ComCall(15, this, "int*", &value := 0, "int")
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
    put_RoutingPolicyType(value) {
        result := ComCall(16, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
