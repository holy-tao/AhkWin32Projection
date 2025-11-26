#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUICommandHandler.ahk
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
     * Called when the state of a View changes.
     * @param {Integer} viewId Type: <b>UINT32</b>
     * 
     * The ID for the View. 
     * 				Only a value of 0 is valid.
     * @param {Integer} typeID Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_viewtype">UI_VIEWTYPE</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_viewtype">UI_VIEWTYPE</a> hosted by the application.
     * @param {IUnknown} view Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the View interface.
     * @param {Integer} verb Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_viewverb">UI_VIEWVERB</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_viewverb">UI_VIEWVERB</a> (or action) performed by the View.
     * @param {Integer} uReasonCode Type: <b>INT32</b>
     * 
     * Not defined.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nf-uiribbon-iuiapplication-onviewchanged
     */
    OnViewChanged(viewId, typeID, view, verb, uReasonCode) {
        result := ComCall(3, this, "uint", viewId, "int", typeID, "ptr", view, "int", verb, "int", uReasonCode, "HRESULT")
        return result
    }

    /**
     * Called for each Command specified in the Windows Ribbon framework markup to bind the Command to an IUICommandHandler.
     * @param {Integer} commandId Type: <b>UINT32</b>
     * 
     * The ID for the Command, which is specified in the markup resource file.
     * @param {Integer} typeID Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_commandtype">UI_COMMANDTYPE</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_commandtype">Command type</a> that is associated with a specific control.
     * @returns {IUICommandHandler} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuicommandhandler">IUICommandHandler</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to an 
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuicommandhandler">IUICommandHandler</a> object. This object is a host application 
     * 					Command handler that is bound to one or more Commands.
     * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nf-uiribbon-iuiapplication-oncreateuicommand
     */
    OnCreateUICommand(commandId, typeID) {
        result := ComCall(4, this, "uint", commandId, "int", typeID, "ptr*", &commandHandler := 0, "HRESULT")
        return IUICommandHandler(commandHandler)
    }

    /**
     * Called for each Command specified in the Windows Ribbon framework markup when the application window is destroyed.
     * @param {Integer} commandId Type: <b>UINT32</b>
     * 
     * The ID for the Command,  which is specified in the markup resource file.
     * @param {Integer} typeID Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_commandtype">UI_COMMANDTYPE</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_commandtype">Command type</a> that is associated with a specific control.
     * @param {IUICommandHandler} commandHandler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuicommandhandler">IUICommandHandler</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuicommandhandler">IUICommandHandler</a> object. This value can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nf-uiribbon-iuiapplication-ondestroyuicommand
     */
    OnDestroyUICommand(commandId, typeID, commandHandler) {
        result := ComCall(5, this, "uint", commandId, "int", typeID, "ptr", commandHandler, "HRESULT")
        return result
    }
}
