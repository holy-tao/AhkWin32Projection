#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTCEventBehavior extends IDispatch{
    /**
     * The interface identifier for IHTCEventBehavior
     * @type {Guid}
     */
    static IID => Guid("{3050f4ff-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTCEventBehavior
     * @type {Guid}
     */
    static CLSID => Guid("{3050f4fe-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IHTMLEventObj>} pvar 
     * @returns {HRESULT} 
     */
    fire(pvar) {
        result := ComCall(7, this, "ptr", pvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
