#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include .\IHTMLFrameBase.ahk

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
     * @type {IHTMLFrameBase} 
     */
    frameElement {
        get => this.get_frameElement()
    }

    /**
     * 
     * @param {Pointer<VARIANT>} varArgIn 
     * @returns {IDispatch} 
     */
    createPopup(varArgIn) {
        result := ComCall(7, this, "ptr", varArgIn, "ptr*", &ppPopup := 0, "HRESULT")
        return IDispatch(ppPopup)
    }

    /**
     * 
     * @returns {IHTMLFrameBase} 
     */
    get_frameElement() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLFrameBase(p)
    }
}
