#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMBeforeUnloadEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMBeforeUnloadEvent
     * @type {Guid}
     */
    static IID => Guid("{30510763-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMBeforeUnloadEvent
     * @type {Guid}
     */
    static CLSID => Guid("{30510764-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_returnValue", "get_returnValue"]

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_returnValue(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_returnValue(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }
}
