#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintSchemaElement.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaDisplayableElement extends IPrintSchemaElement{
    /**
     * The interface identifier for IPrintSchemaDisplayableElement
     * @type {Guid}
     */
    static IID => Guid("{af45af49-d6aa-407d-bf87-3912236e9d94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDisplayName 
     * @returns {HRESULT} 
     */
    get_DisplayName(pbstrDisplayName) {
        result := ComCall(10, this, "ptr", pbstrDisplayName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
