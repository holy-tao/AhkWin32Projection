#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLNamespaceCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLNamespaceCollection
     * @type {Guid}
     */
    static IID => Guid("{3050f6b8-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLNamespaceCollection
     * @type {Guid}
     */
    static CLSID => Guid("{3050f6b9-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_length", "item", "add"]

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} index 
     * @param {Pointer<IDispatch>} ppNamespace 
     * @returns {HRESULT} 
     */
    item(index, ppNamespace) {
        result := ComCall(8, this, "ptr", index, "ptr*", ppNamespace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrNamespace 
     * @param {BSTR} bstrUrn 
     * @param {VARIANT} implementationUrl 
     * @param {Pointer<IDispatch>} ppNamespace 
     * @returns {HRESULT} 
     */
    add(bstrNamespace, bstrUrn, implementationUrl, ppNamespace) {
        bstrNamespace := bstrNamespace is String ? BSTR.Alloc(bstrNamespace).Value : bstrNamespace
        bstrUrn := bstrUrn is String ? BSTR.Alloc(bstrUrn).Value : bstrUrn

        result := ComCall(9, this, "ptr", bstrNamespace, "ptr", bstrUrn, "ptr", implementationUrl, "ptr*", ppNamespace, "HRESULT")
        return result
    }
}
