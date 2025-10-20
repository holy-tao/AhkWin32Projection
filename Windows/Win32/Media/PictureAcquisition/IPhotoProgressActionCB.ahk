#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.PictureAcquisition
 * @version v4.0.30319
 */
class IPhotoProgressActionCB extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoProgressActionCB
     * @type {Guid}
     */
    static IID => Guid("{00f242d0-b206-4e7d-b4c1-4755bcbb9c9f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DoAction"]

    /**
     * 
     * @param {HWND} hWndParent 
     * @returns {HRESULT} 
     */
    DoAction(hWndParent) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := ComCall(3, this, "ptr", hWndParent, "HRESULT")
        return result
    }
}
