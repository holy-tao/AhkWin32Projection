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
     * Acquires a range of object IDs from the control host and marks them as reserved by a specific windowless control.
     * @param {Integer} rangeSize The size of the object ID range that is being requested.
     * @param {IAccessibleHandler} pRangeOwner The windowless control that is requesting the range.
     * @returns {Integer} The first object ID in the acquired range.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessiblewindowlesssite-acquireobjectidrange
     */
    AcquireObjectIdRange(rangeSize, pRangeOwner) {
        result := ComCall(3, this, "int", rangeSize, "ptr", pRangeOwner, "int*", &pRangeBase := 0, "HRESULT")
        return pRangeBase
    }

    /**
     * Releases an object ID range that was acquired by a previous call to the IAccessibleWindowlessSite::AcquireObjectIdRange method.
     * @param {Integer} rangeBase Type: <b>long</b>
     * 
     * The first object ID in the range of IDs to be released.
     * @param {IAccessibleHandler} pRangeOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessiblehandler">IAccessibleHandler</a>*</b>
     * 
     * The windowless ActiveX control with which the range was associated when it was acquired.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessiblewindowlesssite-releaseobjectidrange
     */
    ReleaseObjectIdRange(rangeBase, pRangeOwner) {
        result := ComCall(4, this, "int", rangeBase, "ptr", pRangeOwner, "HRESULT")
        return result
    }

    /**
     * Retrieves the object ID ranges that a particular windowless Microsoft ActiveX control has reserved.
     * @param {IAccessibleHandler} pRangesOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessiblehandler">IAccessibleHandler</a>*</b>
     * 
     * The control whose ranges are being queried.
     * @returns {Pointer<SAFEARRAY>} Type: <b>SAFEARRAY**</b>
     * 
     * Receives the array of object ID ranges. The array contains a set of paired integers. For each pair, the first integer is the first object ID in the range, and the second integer is a count of object IDs in the range.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessiblewindowlesssite-queryobjectidranges
     */
    QueryObjectIdRanges(pRangesOwner) {
        result := ComCall(5, this, "ptr", pRangesOwner, "ptr*", &psaRanges := 0, "HRESULT")
        return psaRanges
    }

    /**
     * Retrieves an IAccessible pointer for the parent of a windowless Microsoft ActiveX control in the accessibility tree.
     * @returns {IAccessible} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a>**</b>
     * 
     * Receives the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> pointer for the parent of the windowless ActiveX control.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessiblewindowlesssite-getparentaccessible
     */
    GetParentAccessible() {
        result := ComCall(6, this, "ptr*", &ppParent := 0, "HRESULT")
        return IAccessible(ppParent)
    }
}
