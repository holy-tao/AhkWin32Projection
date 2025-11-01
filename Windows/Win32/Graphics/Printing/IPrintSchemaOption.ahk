#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IPrintSchemaDisplayableElement.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaOption extends IPrintSchemaDisplayableElement{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSchemaOption
     * @type {Guid}
     */
    static IID => Guid("{66bb2f51-5844-4997-8d70-4b7cc221cf92}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Selected", "get_Constrained", "GetPropertyValue"]

    /**
     * 
     * @param {Pointer<BOOL>} pbIsSelected 
     * @returns {HRESULT} 
     */
    get_Selected(pbIsSelected) {
        result := ComCall(11, this, "ptr", pbIsSelected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pSetting 
     * @returns {HRESULT} 
     */
    get_Constrained(pSetting) {
        pSettingMarshal := pSetting is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pSettingMarshal, pSetting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrNamespaceUri 
     * @param {Pointer<IUnknown>} ppXmlValueNode 
     * @returns {HRESULT} 
     */
    GetPropertyValue(bstrName, bstrNamespaceUri, ppXmlValueNode) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrNamespaceUri := bstrNamespaceUri is String ? BSTR.Alloc(bstrNamespaceUri).Value : bstrNamespaceUri

        result := ComCall(13, this, "ptr", bstrName, "ptr", bstrNamespaceUri, "ptr*", ppXmlValueNode, "HRESULT")
        return result
    }
}
