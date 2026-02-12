#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\HttpMediaTypeHeaderValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class IHttpMediaTypeHeaderValueFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpMediaTypeHeaderValueFactory
     * @type {Guid}
     */
    static IID => Guid("{bed747a8-cd17-42dd-9367-ab9c5b56dd7d}")

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
     * @param {HSTRING} mediaType_ 
     * @returns {HttpMediaTypeHeaderValue} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(mediaType_) {
        if(mediaType_ is String) {
            pin := HSTRING.Create(mediaType_)
            mediaType_ := pin.Value
        }
        mediaType_ := mediaType_ is Win32Handle ? NumGet(mediaType_, "ptr") : mediaType_

        result := ComCall(6, this, "ptr", mediaType_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpMediaTypeHeaderValue(value)
    }
}
