#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementNamespaceTable extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IElementNamespaceTable
     * @type {Guid}
     */
    static IID => Guid("{3050f670-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddNamespace"]

    /**
     * 
     * @param {BSTR} bstrNamespace 
     * @param {BSTR} bstrUrn 
     * @param {Integer} lFlags 
     * @param {Pointer<VARIANT>} pvarFactory 
     * @returns {HRESULT} 
     */
    AddNamespace(bstrNamespace, bstrUrn, lFlags, pvarFactory) {
        bstrNamespace := bstrNamespace is String ? BSTR.Alloc(bstrNamespace).Value : bstrNamespace
        bstrUrn := bstrUrn is String ? BSTR.Alloc(bstrUrn).Value : bstrUrn

        result := ComCall(3, this, "ptr", bstrNamespace, "ptr", bstrUrn, "int", lFlags, "ptr", pvarFactory, "HRESULT")
        return result
    }
}
