#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLSelectElement5 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLSelectElement5
     * @type {Guid}
     */
    static IID => Guid("{3051049d-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add"]

    /**
     * 
     * @param {IHTMLOptionElement} pElem 
     * @param {Pointer<VARIANT>} pvarBefore 
     * @returns {HRESULT} 
     */
    add(pElem, pvarBefore) {
        result := ComCall(7, this, "ptr", pElem, "ptr", pvarBefore, "HRESULT")
        return result
    }
}
