#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Web\Http\HttpRequestMessage.ahk
#Include ..\..\..\Web\Http\HttpResponseMessage.ahk
#Include ..\..\..\Foundation\Deferral.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IWebViewWebResourceRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebViewWebResourceRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{378d21f6-c77f-5d8b-8f30-93c99df79435}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Request", "get_Response", "put_Response", "GetDeferral"]

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
     * @returns {HttpRequestMessage} 
     */
    get_Request() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpRequestMessage(value)
    }

    /**
     * 
     * @returns {HttpResponseMessage} 
     */
    get_Response() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpResponseMessage(value)
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
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(result_)
    }
}
