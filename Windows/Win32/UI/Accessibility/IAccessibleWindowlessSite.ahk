#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A Microsoft ActiveX control site implements this interface to enable a windowless ActiveX control that has a Microsoft Active Accessibility implementation to express its accessibility.
 * @remarks
 * 
  * The functions that manage object ID ranges expect the site object to maintain a list of ranges that have already been reserved.  When the window that contains the ActiveX control receives a <a href="https://docs.microsoft.com/windows/desktop/WinAuto/wm-getobject">WM_GETOBJECT</a> message with an <b>LPARAM</b> value (object ID) that is in a reserved range, the window should call the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-iaccessiblehandler-accessibleobjectfromid">IAccessibleHandler::AccessibleObjectFromID</a> method to get an <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> object for that object ID.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//oleacc/nn-oleacc-iaccessiblewindowlesssite
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IAccessibleWindowlessSite extends IUnknown{
    /**
     * The interface identifier for IAccessibleWindowlessSite
     * @type {Guid}
     */
    static IID => Guid("{bf3abd9c-76da-4389-9eb6-1427d25abab7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} rangeSize 
     * @param {Pointer<IAccessibleHandler>} pRangeOwner 
     * @param {Pointer<Int32>} pRangeBase 
     * @returns {HRESULT} 
     */
    AcquireObjectIdRange(rangeSize, pRangeOwner, pRangeBase) {
        result := ComCall(3, this, "int", rangeSize, "ptr", pRangeOwner, "int*", pRangeBase, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} rangeBase 
     * @param {Pointer<IAccessibleHandler>} pRangeOwner 
     * @returns {HRESULT} 
     */
    ReleaseObjectIdRange(rangeBase, pRangeOwner) {
        result := ComCall(4, this, "int", rangeBase, "ptr", pRangeOwner, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAccessibleHandler>} pRangesOwner 
     * @param {Pointer<SAFEARRAY>} psaRanges 
     * @returns {HRESULT} 
     */
    QueryObjectIdRanges(pRangesOwner, psaRanges) {
        result := ComCall(5, this, "ptr", pRangesOwner, "ptr", psaRanges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAccessible>} ppParent 
     * @returns {HRESULT} 
     */
    GetParentAccessible(ppParent) {
        result := ComCall(6, this, "ptr", ppParent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
