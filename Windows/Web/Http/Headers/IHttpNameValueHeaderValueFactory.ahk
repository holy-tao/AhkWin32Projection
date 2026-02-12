#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\HttpNameValueHeaderValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class IHttpNameValueHeaderValueFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpNameValueHeaderValueFactory
     * @type {Guid}
     */
    static IID => Guid("{770e2267-cbf8-4736-a925-93fbe10c7ca8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromName", "CreateFromNameWithValue"]

    /**
     * 
     * @param {HSTRING} name 
     * @returns {HttpNameValueHeaderValue} 
     */
    CreateFromName(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(6, this, "ptr", name, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpNameValueHeaderValue(value)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {HSTRING} value 
     * @returns {HttpNameValueHeaderValue} 
     */
    CreateFromNameWithValue(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", name, "ptr", value, "ptr*", &nameValueHeaderValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpNameValueHeaderValue(nameValueHeaderValue)
    }
}
