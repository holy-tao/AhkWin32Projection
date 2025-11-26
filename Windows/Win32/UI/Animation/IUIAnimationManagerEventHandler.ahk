#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a method for handling status updates to an animation manager.
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationmanagereventhandler
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationManagerEventHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationManagerEventHandler
     * @type {Guid}
     */
    static IID => Guid("{783321ed-78a3-4366-b574-6af607a64788}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnManagerStatusChanged"]

    /**
     * Handles status changes to an animation manager.
     * @param {Integer} newStatus The new status.
     * @param {Integer} previousStatus The previous status.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationmanagereventhandler-onmanagerstatuschanged
     */
    OnManagerStatusChanged(newStatus, previousStatus) {
        result := ComCall(3, this, "int", newStatus, "int", previousStatus, "HRESULT")
        return result
    }
}
