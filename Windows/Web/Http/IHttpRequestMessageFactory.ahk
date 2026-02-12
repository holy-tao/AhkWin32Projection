#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HttpRequestMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class IHttpRequestMessageFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpRequestMessageFactory
     * @type {Guid}
     */
    static IID => Guid("{5bac994e-3886-412e-aec3-52ec7f25616f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {HttpMethod} method 
     * @param {Uri} uri_ 
     * @returns {HttpRequestMessage} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(method, uri_) {
        result := ComCall(6, this, "ptr", method, "ptr", uri_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpRequestMessage(value)
    }
}
