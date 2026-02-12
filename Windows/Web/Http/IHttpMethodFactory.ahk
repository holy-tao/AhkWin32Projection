#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\HttpMethod.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class IHttpMethodFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpMethodFactory
     * @type {Guid}
     */
    static IID => Guid("{3c51d10d-36d7-40f8-a86d-e759caf2f83f}")

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
     * @param {HSTRING} method 
     * @returns {HttpMethod} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(method) {
        if(method is String) {
            pin := HSTRING.Create(method)
            method := pin.Value
        }
        method := method is Win32Handle ? NumGet(method, "ptr") : method

        result := ComCall(6, this, "ptr", method, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpMethod(value)
    }
}
