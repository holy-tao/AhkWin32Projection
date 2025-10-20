#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaElement extends IDispatch{
    /**
     * The interface identifier for IPrintSchemaElement
     * @type {Guid}
     */
    static IID => Guid("{724c1646-e64b-4bbf-8eb4-d45e4fd580da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IUnknown>} ppXmlNode 
     * @returns {HRESULT} 
     */
    get_XmlNode(ppXmlNode) {
        result := ComCall(7, this, "ptr", ppXmlNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrName) {
        result := ComCall(8, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrNamespaceUri 
     * @returns {HRESULT} 
     */
    get_NamespaceUri(pbstrNamespaceUri) {
        result := ComCall(9, this, "ptr", pbstrNamespaceUri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
