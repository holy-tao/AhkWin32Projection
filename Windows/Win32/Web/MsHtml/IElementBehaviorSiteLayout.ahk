#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementBehaviorSiteLayout extends IUnknown{
    /**
     * The interface identifier for IElementBehaviorSiteLayout
     * @type {Guid}
     */
    static IID => Guid("{3050f6b7-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    InvalidateLayoutInfo() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InvalidateSize() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} psizeResolution 
     * @returns {HRESULT} 
     */
    GetMediaResolution(psizeResolution) {
        result := ComCall(5, this, "ptr", psizeResolution, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
