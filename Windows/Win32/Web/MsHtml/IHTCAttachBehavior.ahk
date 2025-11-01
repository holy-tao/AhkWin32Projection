#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTCAttachBehavior extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTCAttachBehavior
     * @type {Guid}
     */
    static IID => Guid("{3050f5f4-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTCAttachBehavior
     * @type {Guid}
     */
    static CLSID => Guid("{3050f5f5-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["fireEvent", "detachEvent"]

    /**
     * 
     * @param {IDispatch} evt 
     * @returns {HRESULT} 
     */
    fireEvent(evt) {
        result := ComCall(7, this, "ptr", evt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    detachEvent() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
