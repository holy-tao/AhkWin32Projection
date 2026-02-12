#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HttpRequestMessage.ahk
#Include .\HttpResponseMessage.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class IHttpGetStringResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpGetStringResult
     * @type {Guid}
     */
    static IID => Guid("{9bac466d-8509-4775-b16d-8953f47a7f5f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExtendedError", "get_RequestMessage", "get_ResponseMessage", "get_Succeeded", "get_Value"]

    /**
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * @type {HttpRequestMessage} 
     */
    RequestMessage {
        get => this.get_RequestMessage()
    }

    /**
     * @type {HttpResponseMessage} 
     */
    ResponseMessage {
        get => this.get_ResponseMessage()
    }

    /**
     * @type {Boolean} 
     */
    Succeeded {
        get => this.get_Succeeded()
    }

    /**
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HttpRequestMessage} 
     */
    get_RequestMessage() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpRequestMessage(value)
    }

    /**
     * 
     * @returns {HttpResponseMessage} 
     */
    get_ResponseMessage() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpResponseMessage(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Succeeded() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
