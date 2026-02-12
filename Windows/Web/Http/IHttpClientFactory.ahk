#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HttpClient.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class IHttpClientFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpClientFactory
     * @type {Guid}
     */
    static IID => Guid("{c30c4eca-e3fa-4f99-afb4-63cc65009462}")

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
     * @param {IHttpFilter} filter 
     * @returns {HttpClient} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(filter) {
        result := ComCall(6, this, "ptr", filter, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpClient(value)
    }
}
