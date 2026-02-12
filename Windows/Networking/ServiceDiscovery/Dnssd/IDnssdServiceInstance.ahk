#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\HostName.ahk
#Include ..\..\..\Foundation\Collections\IMap.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\DnssdRegistrationResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.ServiceDiscovery.Dnssd
 * @version WindowsRuntime 1.4
 */
class IDnssdServiceInstance extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDnssdServiceInstance
     * @type {Guid}
     */
    static IID => Guid("{e246db7e-98a5-4ca1-b9e4-c253d33c35ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DnssdServiceInstanceName", "put_DnssdServiceInstanceName", "get_HostName", "put_HostName", "get_Port", "put_Port", "get_Priority", "put_Priority", "get_Weight", "put_Weight", "get_TextAttributes", "RegisterStreamSocketListenerAsync1", "RegisterStreamSocketListenerAsync2", "RegisterDatagramSocketAsync1", "RegisterDatagramSocketAsync2"]

    /**
     * @type {HSTRING} 
     */
    DnssdServiceInstanceName {
        get => this.get_DnssdServiceInstanceName()
        set => this.put_DnssdServiceInstanceName(value)
    }

    /**
     * @type {HostName} 
     */
    HostName {
        get => this.get_HostName()
        set => this.put_HostName(value)
    }

    /**
     * @type {Integer} 
     */
    Port {
        get => this.get_Port()
        set => this.put_Port(value)
    }

    /**
     * @type {Integer} 
     */
    Priority {
        get => this.get_Priority()
        set => this.put_Priority(value)
    }

    /**
     * @type {Integer} 
     */
    Weight {
        get => this.get_Weight()
        set => this.put_Weight(value)
    }

    /**
     * @type {IMap<HSTRING, HSTRING>} 
     */
    TextAttributes {
        get => this.get_TextAttributes()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DnssdServiceInstanceName() {
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
    put_DnssdServiceInstanceName(value) {
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
     * @returns {HostName} 
     */
    get_HostName() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HostName(value)
    }

    /**
     * 
     * @param {HostName} value 
     * @returns {HRESULT} 
     */
    put_HostName(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Port() {
        result := ComCall(10, this, "ushort*", &value := 0, "int")
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
    put_Port(value) {
        result := ComCall(11, this, "ushort", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Priority() {
        result := ComCall(12, this, "ushort*", &value := 0, "int")
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
    put_Priority(value) {
        result := ComCall(13, this, "ushort", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Weight() {
        result := ComCall(14, this, "ushort*", &value := 0, "int")
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
    put_Weight(value) {
        result := ComCall(15, this, "ushort", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_TextAttributes() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @param {StreamSocketListener} socket_ 
     * @returns {IAsyncOperation<DnssdRegistrationResult>} 
     */
    RegisterStreamSocketListenerAsync1(socket_) {
        result := ComCall(17, this, "ptr", socket_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DnssdRegistrationResult, result_)
    }

    /**
     * 
     * @param {StreamSocketListener} socket_ 
     * @param {NetworkAdapter} adapter_ 
     * @returns {IAsyncOperation<DnssdRegistrationResult>} 
     */
    RegisterStreamSocketListenerAsync2(socket_, adapter_) {
        result := ComCall(18, this, "ptr", socket_, "ptr", adapter_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DnssdRegistrationResult, result_)
    }

    /**
     * 
     * @param {DatagramSocket} socket_ 
     * @returns {IAsyncOperation<DnssdRegistrationResult>} 
     */
    RegisterDatagramSocketAsync1(socket_) {
        result := ComCall(19, this, "ptr", socket_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DnssdRegistrationResult, result_)
    }

    /**
     * 
     * @param {DatagramSocket} socket_ 
     * @param {NetworkAdapter} adapter_ 
     * @returns {IAsyncOperation<DnssdRegistrationResult>} 
     */
    RegisterDatagramSocketAsync2(socket_, adapter_) {
        result := ComCall(20, this, "ptr", socket_, "ptr", adapter_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DnssdRegistrationResult, result_)
    }
}
