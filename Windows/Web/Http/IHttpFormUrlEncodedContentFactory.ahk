#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HttpFormUrlEncodedContent.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class IHttpFormUrlEncodedContentFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpFormUrlEncodedContentFactory
     * @type {Guid}
     */
    static IID => Guid("{43f0138c-2f73-4302-b5f3-eae9238a5e01}")

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
     * @param {IIterable<IKeyValuePair<HSTRING, HSTRING>>} content 
     * @returns {HttpFormUrlEncodedContent} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(content) {
        result := ComCall(6, this, "ptr", content, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpFormUrlEncodedContent(value)
    }
}
