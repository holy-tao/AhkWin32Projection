#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IPrintSchemaDisplayableElement.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaFeature extends IPrintSchemaDisplayableElement{
    /**
     * The interface identifier for IPrintSchemaFeature
     * @type {Guid}
     */
    static IID => Guid("{ef189461-5d62-4626-8e57-ff83583c4826}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * 
     * @param {Pointer<IPrintSchemaOption>} ppOption 
     * @returns {HRESULT} 
     */
    get_SelectedOption(ppOption) {
        result := ComCall(11, this, "ptr", ppOption, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPrintSchemaOption>} pOption 
     * @returns {HRESULT} 
     */
    put_SelectedOption(pOption) {
        result := ComCall(12, this, "ptr", pOption, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pSelectionType 
     * @returns {HRESULT} 
     */
    get_SelectionType(pSelectionType) {
        result := ComCall(13, this, "int*", pSelectionType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrNamespaceUri 
     * @param {Pointer<IPrintSchemaOption>} ppOption 
     * @returns {HRESULT} 
     */
    GetOption(bstrName, bstrNamespaceUri, ppOption) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrNamespaceUri := bstrNamespaceUri is String ? BSTR.Alloc(bstrNamespaceUri).Value : bstrNamespaceUri

        result := ComCall(14, this, "ptr", bstrName, "ptr", bstrNamespaceUri, "ptr", ppOption, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbShow 
     * @returns {HRESULT} 
     */
    get_DisplayUI(pbShow) {
        result := ComCall(15, this, "ptr", pbShow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
