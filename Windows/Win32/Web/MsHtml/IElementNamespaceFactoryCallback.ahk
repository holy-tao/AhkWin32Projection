#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementNamespaceFactoryCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IElementNamespaceFactoryCallback
     * @type {Guid}
     */
    static IID => Guid("{3050f7fd-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Resolve"]

    /**
     * 
     * @param {BSTR} bstrNamespace 
     * @param {BSTR} bstrTagName 
     * @param {BSTR} bstrAttrs 
     * @param {IElementNamespace} pNamespace 
     * @returns {HRESULT} 
     */
    Resolve(bstrNamespace, bstrTagName, bstrAttrs, pNamespace) {
        bstrNamespace := bstrNamespace is String ? BSTR.Alloc(bstrNamespace).Value : bstrNamespace
        bstrTagName := bstrTagName is String ? BSTR.Alloc(bstrTagName).Value : bstrTagName
        bstrAttrs := bstrAttrs is String ? BSTR.Alloc(bstrAttrs).Value : bstrAttrs

        result := ComCall(3, this, "ptr", bstrNamespace, "ptr", bstrTagName, "ptr", bstrAttrs, "ptr", pNamespace, "HRESULT")
        return result
    }
}
