#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDocumentSelector extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDocumentSelector
     * @type {Guid}
     */
    static IID => Guid("{30510462-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["querySelector", "querySelectorAll"]

    /**
     * 
     * @param {BSTR} v 
     * @param {Pointer<IHTMLElement>} pel 
     * @returns {HRESULT} 
     */
    querySelector(v, pel) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, "ptr", v, "ptr*", pel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @param {Pointer<IHTMLDOMChildrenCollection>} pel 
     * @returns {HRESULT} 
     */
    querySelectorAll(v, pel) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(8, this, "ptr", v, "ptr*", pel, "HRESULT")
        return result
    }
}
