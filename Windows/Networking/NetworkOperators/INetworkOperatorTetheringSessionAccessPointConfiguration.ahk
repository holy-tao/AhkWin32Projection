#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class INetworkOperatorTetheringSessionAccessPointConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkOperatorTetheringSessionAccessPointConfiguration
     * @type {Guid}
     */
    static IID => Guid("{0bcc1104-34b7-5212-858c-59d97404920a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Ssid", "put_Ssid", "get_Passphrase", "put_Passphrase", "IsBandSupported", "IsBandSupportedAsync", "get_Band", "put_Band", "IsAuthenticationKindSupported", "IsAuthenticationKindSupportedAsync", "get_AuthenticationKind", "put_AuthenticationKind", "get_PerformancePriority", "put_PerformancePriority"]

    /**
     * @type {HSTRING} 
     */
    Ssid {
        get => this.get_Ssid()
        set => this.put_Ssid(value)
    }

    /**
     * @type {HSTRING} 
     */
    Passphrase {
        get => this.get_Passphrase()
        set => this.put_Passphrase(value)
    }

    /**
     * @type {Integer} 
     */
    Band {
        get => this.get_Band()
        set => this.put_Band(value)
    }

    /**
     * @type {Integer} 
     */
    AuthenticationKind {
        get => this.get_AuthenticationKind()
        set => this.put_AuthenticationKind(value)
    }

    /**
     * @type {Integer} 
     */
    PerformancePriority {
        get => this.get_PerformancePriority()
        set => this.put_PerformancePriority(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Ssid() {
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
    put_Ssid(value) {
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
     * @returns {HSTRING} 
     */
    get_Passphrase() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
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
    put_Passphrase(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} band 
     * @returns {Boolean} 
     */
    IsBandSupported(band) {
        result := ComCall(10, this, "int", band, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} band 
     * @returns {IAsyncOperation<Boolean>} 
     */
    IsBandSupportedAsync(band) {
        result := ComCall(11, this, "int", band, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Band() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_Band(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} authenticationKind 
     * @returns {Boolean} 
     */
    IsAuthenticationKindSupported(authenticationKind) {
        result := ComCall(14, this, "int", authenticationKind, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} authenticationKind 
     * @returns {IAsyncOperation<Boolean>} 
     */
    IsAuthenticationKindSupportedAsync(authenticationKind) {
        result := ComCall(15, this, "int", authenticationKind, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AuthenticationKind() {
        result := ComCall(16, this, "int*", &value := 0, "int")
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
    put_AuthenticationKind(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PerformancePriority() {
        result := ComCall(18, this, "int*", &value := 0, "int")
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
    put_PerformancePriority(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
