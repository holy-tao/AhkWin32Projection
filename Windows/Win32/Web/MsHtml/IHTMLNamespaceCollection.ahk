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
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        result := ComCall(7, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} index 
     * @param {Pointer<IDispatch>} ppNamespace 
     * @returns {HRESULT} 
     */
    item(index, ppNamespace) {
        result := ComCall(8, this, "ptr", index, "ptr", ppNamespace, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(9, this, "ptr", bstrNamespace, "ptr", bstrUrn, "ptr", implementationUrl, "ptr", ppNamespace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
