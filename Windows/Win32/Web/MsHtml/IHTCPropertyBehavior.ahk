#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTCPropertyBehavior extends IDispatch{
    /**
     * The interface identifier for IHTCPropertyBehavior
     * @type {Guid}
     */
    static IID => Guid("{3050f5df-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTCPropertyBehavior
     * @type {Guid}
     */
    static CLSID => Guid("{3050f5de-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @returns {HRESULT} 
     */
    fireChange() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_value(v) {
        result := ComCall(8, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_value(p) {
        result := ComCall(9, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
