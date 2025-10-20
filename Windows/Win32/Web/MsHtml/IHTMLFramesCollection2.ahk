#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLFramesCollection2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLFramesCollection2
     * @type {Guid}
     */
    static IID => Guid("{332c4426-26cb-11d0-b483-00c04fd90119}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["item", "get_length"]

    /**
     * 
     * @param {Pointer<VARIANT>} pvarIndex 
     * @param {Pointer<VARIANT>} pvarResult 
     * @returns {HRESULT} 
     */
    item(pvarIndex, pvarResult) {
        result := ComCall(7, this, "ptr", pvarIndex, "ptr", pvarResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        result := ComCall(8, this, "int*", p, "HRESULT")
        return result
    }
}
