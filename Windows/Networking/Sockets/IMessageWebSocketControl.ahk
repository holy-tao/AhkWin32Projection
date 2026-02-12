#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IMessageWebSocketControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMessageWebSocketControl
     * @type {Guid}
     */
    static IID => Guid("{8118388a-c629-4f0a-80fb-81fc05538862}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaxMessageSize", "put_MaxMessageSize", "get_MessageType", "put_MessageType"]

    /**
     * @type {Integer} 
     */
    MaxMessageSize {
        get => this.get_MaxMessageSize()
        set => this.put_MaxMessageSize(value)
    }

    /**
     * @type {Integer} 
     */
    MessageType {
        get => this.get_MessageType()
        set => this.put_MessageType(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxMessageSize() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
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
    put_MaxMessageSize(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageType() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_MessageType(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
