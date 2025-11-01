#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IOmHistory extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOmHistory
     * @type {Guid}
     */
    static IID => Guid("{feceaaa2-8405-11cf-8ba1-00aa00476da6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_length", "back", "forward", "go"]

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        pMarshal := p is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvargdistance 
     * @returns {HRESULT} 
     */
    back(pvargdistance) {
        result := ComCall(8, this, "ptr", pvargdistance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvargdistance 
     * @returns {HRESULT} 
     */
    forward(pvargdistance) {
        result := ComCall(9, this, "ptr", pvargdistance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvargdistance 
     * @returns {HRESULT} 
     */
    go(pvargdistance) {
        result := ComCall(10, this, "ptr", pvargdistance, "HRESULT")
        return result
    }
}
