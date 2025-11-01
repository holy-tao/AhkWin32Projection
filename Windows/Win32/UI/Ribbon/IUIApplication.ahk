#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IUIApplication interface is implemented by the application and defines the callback entry-point methods for the Windows Ribbon framework.
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nn-uiribbon-iuiapplication
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class IUIApplication extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIApplication
     * @type {Guid}
     */
    static IID => Guid("{d428903c-729a-491d-910d-682a08ff2522}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnViewChanged", "OnCreateUICommand", "OnDestroyUICommand"]

    /**
     * 
     * @param {Integer} viewId 
     * @param {Integer} typeID 
     * @param {IUnknown} view 
     * @param {Integer} verb 
     * @param {Integer} uReasonCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiapplication-onviewchanged
     */
    OnViewChanged(viewId, typeID, view, verb, uReasonCode) {
        result := ComCall(3, this, "uint", viewId, "int", typeID, "ptr", view, "int", verb, "int", uReasonCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} commandId 
     * @param {Integer} typeID 
     * @param {Pointer<IUICommandHandler>} commandHandler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiapplication-oncreateuicommand
     */
    OnCreateUICommand(commandId, typeID, commandHandler) {
        result := ComCall(4, this, "uint", commandId, "int", typeID, "ptr*", commandHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} commandId 
     * @param {Integer} typeID 
     * @param {IUICommandHandler} commandHandler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiapplication-ondestroyuicommand
     */
    OnDestroyUICommand(commandId, typeID, commandHandler) {
        result := ComCall(5, this, "uint", commandId, "int", typeID, "ptr", commandHandler, "HRESULT")
        return result
    }
}
