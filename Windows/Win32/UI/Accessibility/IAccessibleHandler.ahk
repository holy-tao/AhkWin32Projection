#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAccessible.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that retrieves an accessible element from an object ID.
 * @see https://docs.microsoft.com/windows/win32/api//oleacc/nn-oleacc-iaccessiblehandler
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IAccessibleHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccessibleHandler
     * @type {Guid}
     */
    static IID => Guid("{03022430-abc4-11d0-bde2-00aa001a1953}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AccessibleObjectFromID"]

    /**
     * 
     * @param {Integer} hwnd 
     * @param {Integer} lObjectID 
     * @returns {IAccessible} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessiblehandler-accessibleobjectfromid
     */
    AccessibleObjectFromID(hwnd, lObjectID) {
        result := ComCall(3, this, "int", hwnd, "int", lObjectID, "ptr*", &pIAccessible := 0, "HRESULT")
        return IAccessible(pIAccessible)
    }
}
