#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementBehavior extends IUnknown{
    /**
     * The interface identifier for IElementBehavior
     * @type {Guid}
     */
    static IID => Guid("{3050f425-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IElementBehaviorSite>} pBehaviorSite 
     * @returns {HRESULT} 
     */
    Init(pBehaviorSite) {
        result := ComCall(3, this, "ptr", pBehaviorSite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lEvent 
     * @param {Pointer<VARIANT>} pVar 
     * @returns {HRESULT} 
     */
    Notify(lEvent, pVar) {
        result := ComCall(4, this, "int", lEvent, "ptr", pVar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Detach() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
