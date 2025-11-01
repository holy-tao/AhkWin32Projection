#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLWindow4 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLWindow4
     * @type {Guid}
     */
    static IID => Guid("{3050f6cf-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["createPopup", "get_frameElement"]

    /**
     * 
     * @param {Pointer<VARIANT>} varArgIn 
     * @param {Pointer<IDispatch>} ppPopup 
     * @returns {HRESULT} 
     */
    createPopup(varArgIn, ppPopup) {
        result := ComCall(7, this, "ptr", varArgIn, "ptr*", ppPopup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLFrameBase>} p 
     * @returns {HRESULT} 
     */
    get_frameElement(p) {
        result := ComCall(8, this, "ptr*", p, "HRESULT")
        return result
    }
}
