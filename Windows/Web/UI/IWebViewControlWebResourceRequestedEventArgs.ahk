#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Deferral.ahk
#Include ..\Http\HttpRequestMessage.ahk
#Include ..\Http\HttpResponseMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.UI
 * @version WindowsRuntime 1.4
 */
class IWebViewControlWebResourceRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebViewControlWebResourceRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{44d6524d-55a4-4d8b-891c-931d8e25d42e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeferral", "get_Request", "put_Response", "get_Response"]

    /**
     * @type {HttpRequestMessage} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * @type {HttpResponseMessage} 
     */
    Response {
        get => this.get_Response()
        set => this.put_Response(value)
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(6, this, "ptr*", &deferral_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(deferral_)
    }

    /**
     * 
     * @returns {HttpRequestMessage} 
     */
    get_Request() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpRequestMessage(value)
    }

    /**
     * 
     * @param {HttpResponseMessage} value 
     * @returns {HRESULT} 
     */
    put_Response(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HttpResponseMessage} 
     */
    get_Response() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpResponseMessage(value)
    }
}
