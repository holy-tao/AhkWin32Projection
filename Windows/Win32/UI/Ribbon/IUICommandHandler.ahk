#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\UI_EXECUTIONVERB.ahk" { UI_EXECUTIONVERB }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import ".\IUISimplePropertySet.ahk" { IUISimplePropertySet }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IUICommandHandler interface is implemented by the application and defines the methods for gathering Command information and handling Command events from the Windows Ribbon framework.
 * @remarks
 * For each Command in a View, the Ribbon framework requires a corresponding Command handler in 
 * 				the host application. A new handler or an existing handler must be bound to the Command through 
 * 				the <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nf-uiribbon-iuiapplication-oncreateuicommand">IUIApplication::OnCreateUICommand</a> notification method.
 * 			
 * 
 * Any number of Commands can be bound to a Command handler.
 * 			
 * 
 * The Command handler serves two purposes: respond to property update requests and respond to execute events on any Command to which it is bound.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nn-uiribbon-iuicommandhandler
 * @namespace Windows.Win32.UI.Ribbon
 */
export default struct IUICommandHandler extends IUnknown {
    /**
     * The interface identifier for IUICommandHandler
     * @type {Guid}
     */
    static IID := Guid("{75ae0a2d-dc03-4c9f-8883-069660d0beb6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUICommandHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Execute        : IntPtr
        UpdateProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUICommandHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Responds to execute events on Commands bound to the Command handler.
     * @remarks
     * Each Command in a View must be bound to a new or existing Command handler in the host application.
     * @param {Integer} commandId Type: <b>UINT32</b>
     * 
     * The ID for the Command, which is specified in the Markup resource file.
     * @param {UI_EXECUTIONVERB} verb Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_executionverb">UI_EXECUTIONVERB</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_executionverb">UI_EXECUTIONVERB</a> or action that is initiated by the user.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>const PROPERTYKEY*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-reference-properties">Property Key</a> that has changed value. This parameter can be <b>NULL</b>.
     * @param {Pointer<PROPVARIANT>} currentValue Type: <b>const PROPVARIANT*</b>
     * 
     * A pointer to the current value for <i>key</i>. This parameter can be <b>NULL</b>.
     * @param {IUISimplePropertySet} commandExecutionProperties Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuisimplepropertyset">IUISimplePropertySet</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuisimplepropertyset">IUISimplePropertySet</a> object that contains 
     * 					Command state properties and property values, such as screen coordinates and list item indices. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuicommandhandler-execute
     */
    Execute(commandId, verb, key, currentValue, commandExecutionProperties) {
        result := ComCall(3, this, "uint", commandId, UI_EXECUTIONVERB, verb, PROPERTYKEY.Ptr, key, PROPVARIANT.Ptr, currentValue, "ptr", commandExecutionProperties, "HRESULT")
        return result
    }

    /**
     * Responds to property update requests from the Windows Ribbon framework.
     * @remarks
     * This method should be allowed to return before any subsequent calls to the Ribbon framework are made.
     * 
     * The values of Command properties, such as <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-reference-properties-uipkey-enabled">UI_PKEY_Enabled</a> or <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-reference-properties-uipkey-label">UI_PKEY_Label</a>, are set through calls to <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nf-uiribbon-iuiframework-setuicommandproperty">SetUICommandProperty</a> or <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nf-uiribbon-iuiframework-invalidateuicommand">InvalidateUICommand</a>.
     * @param {Integer} commandId Type: <b>UINT32</b>
     * 
     * The ID for the Command, which is specified in the Markup resource file.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-reference-properties">Property Key</a> to update.
     * @param {Pointer<PROPVARIANT>} currentValue Type: <b>const PROPVARIANT*</b>
     * 
     * A pointer to the current value for <i>key</i>. This parameter can be <b>NULL</b>.
     * @returns {PROPVARIANT} Type: <b>PROPVARIANT*</b>
     * 
     * When this method returns, contains a pointer to the new value for 
     * 					<i>key</i>.
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuicommandhandler-updateproperty
     */
    UpdateProperty(commandId, key, currentValue) {
        newValue := PROPVARIANT()
        result := ComCall(4, this, "uint", commandId, PROPERTYKEY.Ptr, key, PROPVARIANT.Ptr, currentValue, PROPVARIANT.Ptr, newValue, "HRESULT")
        return newValue
    }

    Query(iid) {
        if (IUICommandHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Execute := CallbackCreate(GetMethod(implObj, "Execute"), flags, 6)
        this.vtbl.UpdateProperty := CallbackCreate(GetMethod(implObj, "UpdateProperty"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Execute)
        CallbackFree(this.vtbl.UpdateProperty)
    }
}
