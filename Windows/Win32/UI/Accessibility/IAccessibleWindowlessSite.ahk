#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAccessible.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AcquireObjectIdRange", "ReleaseObjectIdRange", "QueryObjectIdRanges", "GetParentAccessible"]

    /**
     * 
     * @param {Integer} rangeSize 
     * @param {IAccessibleHandler} pRangeOwner 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessiblewindowlesssite-acquireobjectidrange
     */
    AcquireObjectIdRange(rangeSize, pRangeOwner) {
        result := ComCall(3, this, "int", rangeSize, "ptr", pRangeOwner, "int*", &pRangeBase := 0, "HRESULT")
        return pRangeBase
    }

    /**
     * 
     * @param {Integer} rangeBase 
     * @param {IAccessibleHandler} pRangeOwner 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessiblewindowlesssite-releaseobjectidrange
     */
    ReleaseObjectIdRange(rangeBase, pRangeOwner) {
        result := ComCall(4, this, "int", rangeBase, "ptr", pRangeOwner, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAccessibleHandler} pRangesOwner 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessiblewindowlesssite-queryobjectidranges
     */
    QueryObjectIdRanges(pRangesOwner) {
        result := ComCall(5, this, "ptr", pRangesOwner, "ptr*", &psaRanges := 0, "HRESULT")
        return psaRanges
    }

    /**
     * 
     * @returns {IAccessible} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessiblewindowlesssite-getparentaccessible
     */
    GetParentAccessible() {
        result := ComCall(6, this, "ptr*", &ppParent := 0, "HRESULT")
        return IAccessible(ppParent)
    }
}
