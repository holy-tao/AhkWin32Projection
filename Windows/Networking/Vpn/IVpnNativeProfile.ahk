#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnNativeProfile extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnNativeProfile
     * @type {Guid}
     */
    static IID => Guid("{a4aee29e-6417-4333-9842-f0a66db69802}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Servers", "get_RoutingPolicyType", "put_RoutingPolicyType", "get_NativeProtocolType", "put_NativeProtocolType", "get_UserAuthenticationMethod", "put_UserAuthenticationMethod", "get_TunnelAuthenticationMethod", "put_TunnelAuthenticationMethod", "get_EapConfiguration", "put_EapConfiguration"]

    /**
     * @type {IVector<HSTRING>} 
     */
    Servers {
        get => this.get_Servers()
    }

    /**
     * @type {Integer} 
     */
    RoutingPolicyType {
        get => this.get_RoutingPolicyType()
        set => this.put_RoutingPolicyType(value)
    }

    /**
     * @type {Integer} 
     */
    NativeProtocolType {
        get => this.get_NativeProtocolType()
        set => this.put_NativeProtocolType(value)
    }

    /**
     * @type {Integer} 
     */
    UserAuthenticationMethod {
        get => this.get_UserAuthenticationMethod()
        set => this.put_UserAuthenticationMethod(value)
    }

    /**
     * @type {Integer} 
     */
    TunnelAuthenticationMethod {
        get => this.get_TunnelAuthenticationMethod()
        set => this.put_TunnelAuthenticationMethod(value)
    }

    /**
     * @type {HSTRING} 
     */
    EapConfiguration {
        get => this.get_EapConfiguration()
        set => this.put_EapConfiguration(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Servers() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
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
        result := ComCall(7, this, "int*", &value := 0, "int")
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
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NativeProtocolType() {
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
    put_NativeProtocolType(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UserAuthenticationMethod() {
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
    put_UserAuthenticationMethod(value) {
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
    get_TunnelAuthenticationMethod() {
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
    put_TunnelAuthenticationMethod(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EapConfiguration() {
        Value := HSTRING()
        result := ComCall(15, this, "ptr", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_EapConfiguration(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
