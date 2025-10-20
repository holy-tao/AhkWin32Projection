#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementBehaviorFocus extends IUnknown{
    /**
     * The interface identifier for IElementBehaviorFocus
     * @type {Guid}
     */
    static IID => Guid("{3050f6b6-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} 
     */
    GetFocusRect(pRect) {
        result := ComCall(3, this, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
