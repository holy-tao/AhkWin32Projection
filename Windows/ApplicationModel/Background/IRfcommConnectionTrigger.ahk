#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Devices\Bluetooth\Background\RfcommInboundConnectionInformation.ahk
#Include ..\..\Devices\Bluetooth\Background\RfcommOutboundConnectionInformation.ahk
#Include ..\..\Networking\HostName.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IRfcommConnectionTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRfcommConnectionTrigger
     * @type {Guid}
     */
    static IID => Guid("{e8c4cae2-0b53-4464-9394-fd875654de64}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InboundConnection", "get_OutboundConnection", "get_AllowMultipleConnections", "put_AllowMultipleConnections", "get_ProtectionLevel", "put_ProtectionLevel", "get_RemoteHostName", "put_RemoteHostName"]

    /**
     * @type {RfcommInboundConnectionInformation} 
     */
    InboundConnection {
        get => this.get_InboundConnection()
    }

    /**
     * @type {RfcommOutboundConnectionInformation} 
     */
    OutboundConnection {
        get => this.get_OutboundConnection()
    }

    /**
     * @type {Boolean} 
     */
    AllowMultipleConnections {
        get => this.get_AllowMultipleConnections()
        set => this.put_AllowMultipleConnections(value)
    }

    /**
     * @type {Integer} 
     */
    ProtectionLevel {
        get => this.get_ProtectionLevel()
        set => this.put_ProtectionLevel(value)
    }

    /**
     * @type {HostName} 
     */
    RemoteHostName {
        get => this.get_RemoteHostName()
        set => this.put_RemoteHostName(value)
    }

    /**
     * 
     * @returns {RfcommInboundConnectionInformation} 
     */
    get_InboundConnection() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RfcommInboundConnectionInformation(value)
    }

    /**
     * 
     * @returns {RfcommOutboundConnectionInformation} 
     */
    get_OutboundConnection() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RfcommOutboundConnectionInformation(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowMultipleConnections() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_AllowMultipleConnections(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtectionLevel() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_ProtectionLevel(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_RemoteHostName() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
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
    put_RemoteHostName(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
