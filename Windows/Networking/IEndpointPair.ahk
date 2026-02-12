#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\HostName.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking
 * @version WindowsRuntime 1.4
 */
class IEndpointPair extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEndpointPair
     * @type {Guid}
     */
    static IID => Guid("{33a0aa36-f8fa-4b30-b856-76517c3bd06d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LocalHostName", "put_LocalHostName", "get_LocalServiceName", "put_LocalServiceName", "get_RemoteHostName", "put_RemoteHostName", "get_RemoteServiceName", "put_RemoteServiceName"]

    /**
     * @type {HostName} 
     */
    LocalHostName {
        get => this.get_LocalHostName()
        set => this.put_LocalHostName(value)
    }

    /**
     * @type {HSTRING} 
     */
    LocalServiceName {
        get => this.get_LocalServiceName()
        set => this.put_LocalServiceName(value)
    }

    /**
     * @type {HostName} 
     */
    RemoteHostName {
        get => this.get_RemoteHostName()
        set => this.put_RemoteHostName(value)
    }

    /**
     * @type {HSTRING} 
     */
    RemoteServiceName {
        get => this.get_RemoteServiceName()
        set => this.put_RemoteServiceName(value)
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_LocalHostName() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
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
    put_LocalHostName(value) {
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
    get_LocalServiceName() {
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
    put_LocalServiceName(value) {
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
     * @returns {HostName} 
     */
    get_RemoteHostName() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
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
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteServiceName() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
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
    put_RemoteServiceName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
