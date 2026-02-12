#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IServerMessageWebSocketControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServerMessageWebSocketControl
     * @type {Guid}
     */
    static IID => Guid("{69c2f051-1c1f-587a-4519-2181610192b7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MessageType", "put_MessageType"]

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
    get_MessageType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
