#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMSiteModeEvent extends IDispatch{
    /**
     * The interface identifier for IDOMSiteModeEvent
     * @type {Guid}
     */
    static IID => Guid("{30510765-98b6-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMSiteModeEvent
     * @type {Guid}
     */
    static CLSID => Guid("{30510766-98b6-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_buttonID(p) {
        result := ComCall(7, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_actionURL(p) {
        result := ComCall(8, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
