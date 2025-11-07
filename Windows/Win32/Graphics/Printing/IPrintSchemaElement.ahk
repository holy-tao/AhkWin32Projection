#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaElement extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_XmlNode", "get_Name", "get_NamespaceUri"]

    /**
     * 
     * @returns {IUnknown} 
     */
    get_XmlNode() {
        result := ComCall(7, this, "ptr*", &ppXmlNode := 0, "HRESULT")
        return IUnknown(ppXmlNode)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(8, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_NamespaceUri() {
        pbstrNamespaceUri := BSTR()
        result := ComCall(9, this, "ptr", pbstrNamespaceUri, "HRESULT")
        return pbstrNamespaceUri
    }
}
