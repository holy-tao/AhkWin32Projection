#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\HttpCookie.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class IHttpCookieFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpCookieFactory
     * @type {Guid}
     */
    static IID => Guid("{6a0585a9-931c-4cd1-a96d-c21701785c5f}")

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
     * @param {HSTRING} name 
     * @param {HSTRING} domain 
     * @param {HSTRING} path_ 
     * @returns {HttpCookie} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(name, domain, path_) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(domain is String) {
            pin := HSTRING.Create(domain)
            domain := pin.Value
        }
        domain := domain is Win32Handle ? NumGet(domain, "ptr") : domain
        if(path_ is String) {
            pin := HSTRING.Create(path_)
            path_ := pin.Value
        }
        path_ := path_ is Win32Handle ? NumGet(path_, "ptr") : path_

        result := ComCall(6, this, "ptr", name, "ptr", domain, "ptr", path_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpCookie(value)
    }
}
