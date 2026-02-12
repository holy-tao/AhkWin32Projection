#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\HttpContentCodingHeaderValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class IHttpContentCodingHeaderValueFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpContentCodingHeaderValueFactory
     * @type {Guid}
     */
    static IID => Guid("{c53d2bd7-332b-4350-8510-2e67a2289a5a}")

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
     * @param {HSTRING} contentCoding 
     * @returns {HttpContentCodingHeaderValue} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(contentCoding) {
        if(contentCoding is String) {
            pin := HSTRING.Create(contentCoding)
            contentCoding := pin.Value
        }
        contentCoding := contentCoding is Win32Handle ? NumGet(contentCoding, "ptr") : contentCoding

        result := ComCall(6, this, "ptr", contentCoding, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpContentCodingHeaderValue(value)
    }
}
