#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a method for handling updates to an animation manager.
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationmanagereventhandler2
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationManagerEventHandler2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationManagerEventHandler2
     * @type {Guid}
     */
    static IID => Guid("{f6e022ba-bff3-42ec-9033-e073f33e83c3}")

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
     * 
     * @param {Integer} newStatus 
     * @param {Integer} previousStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationmanagereventhandler2-onmanagerstatuschanged
     */
    OnManagerStatusChanged(newStatus, previousStatus) {
        result := ComCall(3, this, "int", newStatus, "int", previousStatus, "HRESULT")
        return result
    }
}
