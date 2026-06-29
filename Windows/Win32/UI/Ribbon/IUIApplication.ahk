#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\UI_VIEWTYPE.ahk" { UI_VIEWTYPE }
#Import ".\IUICommandHandler.ahk" { IUICommandHandler }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\UI_COMMANDTYPE.ahk" { UI_COMMANDTYPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\UI_VIEWVERB.ahk" { UI_VIEWVERB }

/**
 * The IUIApplication interface is implemented by the application and defines the callback entry-point methods for the Windows Ribbon framework.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nn-uiribbon-iuiapplication
 * @namespace Windows.Win32.UI.Ribbon
 */
export default struct IUIApplication extends IUnknown {
    /**
     * The interface identifier for IUIApplication
     * @type {Guid}
     */
    static IID := Guid("{d428903c-729a-491d-910d-682a08ff2522}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIApplication interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnViewChanged      : IntPtr
        OnCreateUICommand  : IntPtr
        OnDestroyUICommand : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIApplication.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {UI_VIEWTYPE} typeID Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_viewtype">UI_VIEWTYPE</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_viewtype">UI_VIEWTYPE</a> hosted by the application.
     * @param {IUnknown} _view Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the View interface.
     * @param {UI_VIEWVERB} verb Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_viewverb">UI_VIEWVERB</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_viewverb">UI_VIEWVERB</a> (or action) performed by the View.
     * @param {Integer} uReasonCode Type: <b>INT32</b>
     * 
     * Not defined.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiapplication-onviewchanged
     */
    OnViewChanged(viewId, typeID, _view, verb, uReasonCode) {
        result := ComCall(3, this, "uint", viewId, UI_VIEWTYPE, typeID, "ptr", _view, UI_VIEWVERB, verb, "int", uReasonCode, "HRESULT")
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
     * @param {UI_COMMANDTYPE} typeID Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_commandtype">UI_COMMANDTYPE</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_commandtype">Command type</a> that is associated with a specific control.
     * @returns {IUICommandHandler} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuicommandhandler">IUICommandHandler</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to an 
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuicommandhandler">IUICommandHandler</a> object. This object is a host application 
     * 					Command handler that is bound to one or more Commands.
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiapplication-oncreateuicommand
     */
    OnCreateUICommand(commandId, typeID) {
        result := ComCall(4, this, "uint", commandId, UI_COMMANDTYPE, typeID, "ptr*", &commandHandler := 0, "HRESULT")
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
     * @param {UI_COMMANDTYPE} typeID Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_commandtype">UI_COMMANDTYPE</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_commandtype">Command type</a> that is associated with a specific control.
     * @param {IUICommandHandler} commandHandler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuicommandhandler">IUICommandHandler</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuicommandhandler">IUICommandHandler</a> object. This value can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiapplication-ondestroyuicommand
     */
    OnDestroyUICommand(commandId, typeID, commandHandler) {
        result := ComCall(5, this, "uint", commandId, UI_COMMANDTYPE, typeID, "ptr", commandHandler, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIApplication.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnViewChanged := CallbackCreate(GetMethod(implObj, "OnViewChanged"), flags, 6)
        this.vtbl.OnCreateUICommand := CallbackCreate(GetMethod(implObj, "OnCreateUICommand"), flags, 4)
        this.vtbl.OnDestroyUICommand := CallbackCreate(GetMethod(implObj, "OnDestroyUICommand"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnViewChanged)
        CallbackFree(this.vtbl.OnCreateUICommand)
        CallbackFree(this.vtbl.OnDestroyUICommand)
    }
}
