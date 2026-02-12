#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUICommandHandler.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IUIApplication interface is implemented by the application and defines the callback entry-point methods for the Windows Ribbon framework.
 * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nn-uiribbon-iuiapplication
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
     * @remarks
     * This callback notification is sent by the framework to the host application on each View state change.
     * 			
     * 
     * <div class="alert"><b>Important</b>  This callback only occurs for the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-ribbon">Ribbon View</a> with a <i>viewId</i> of 0.</div>
     * <div> </div>
     * <b>IUIApplication::OnViewChanged</b> is useful for initializing Ribbon properties when the host application starts, modifying Ribbon properties based on user actions, such as resizing the application window, and querying Ribbon properties when the application closes.
     * @param {Integer} viewId Type: <b>UINT32</b>
     * 
     * The ID for the View. 
     * 				Only a value of 0 is valid.
     * @param {Integer} typeID Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_viewtype">UI_VIEWTYPE</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_viewtype">UI_VIEWTYPE</a> hosted by the application.
     * @param {IUnknown} view_ Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nf-uiribbon-iuiapplication-onviewchanged
     */
    OnViewChanged(viewId, typeID, view_, verb, uReasonCode) {
        result := ComCall(3, this, "uint", viewId, "int", typeID, "ptr", view_, "int", verb, "int", uReasonCode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called for each Command specified in the Windows Ribbon framework markup to bind the Command to an IUICommandHandler.
     * @remarks
     * This callback notification is sent by the Ribbon framework to the host application for each Command declaration encountered 
     * 				while processing the markup resource file.
     * 
     * For each Command specified in the Ribbon markup, the Ribbon framework requires a  Command handler in the host application. 
     * 				A new or existing handler must be assigned to each Command.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nf-uiribbon-iuiapplication-oncreateuicommand
     */
    OnCreateUICommand(commandId, typeID) {
        result := ComCall(4, this, "uint", commandId, "int", typeID, "ptr*", &commandHandler := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUICommandHandler(commandHandler)
    }

    /**
     * Called for each Command specified in the Windows Ribbon framework markup when the application window is destroyed.
     * @remarks
     * This callback notification is sent by the Ribbon framework to the host application for each Command declaration in the markup resource file.
     * 			
     * 
     * All resources in the host application associated with each Command are released.
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nf-uiribbon-iuiapplication-ondestroyuicommand
     */
    OnDestroyUICommand(commandId, typeID, commandHandler) {
        result := ComCall(5, this, "uint", commandId, "int", typeID, "ptr", commandHandler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
