#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IUICommandHandler interface is implemented by the application and defines the methods for gathering Command information and handling Command events from the Windows Ribbon framework.
 * @remarks
 * 
 * For each Command in a View, the Ribbon framework requires a corresponding Command handler in 
 * 				the host application. A new handler or an existing handler must be bound to the Command through 
 * 				the <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nf-uiribbon-iuiapplication-oncreateuicommand">IUIApplication::OnCreateUICommand</a> notification method.
 * 			
 * 
 * Any number of Commands can be bound to a Command handler.
 * 			
 * 
 * The Command handler serves two purposes: respond to property update requests and respond to execute events on any Command to which it is bound.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nn-uiribbon-iuicommandhandler
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class IUICommandHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUICommandHandler
     * @type {Guid}
     */
    static IID => Guid("{75ae0a2d-dc03-4c9f-8883-069660d0beb6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Execute", "UpdateProperty"]

    /**
     * Responds to execute events on Commands bound to the Command handler.
     * @param {Integer} commandId Type: <b>UINT32</b>
     * 
     * The ID for the Command, which is specified in the Markup resource file.
     * @param {Integer} verb Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_executionverb">UI_EXECUTIONVERB</a></b>
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nf-uiribbon-iuicommandhandler-execute
     */
    Execute(commandId, verb, key, currentValue, commandExecutionProperties) {
        result := ComCall(3, this, "uint", commandId, "int", verb, "ptr", key, "ptr", currentValue, "ptr", commandExecutionProperties, "HRESULT")
        return result
    }

    /**
     * Responds to property update requests from the Windows Ribbon framework.
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
     * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nf-uiribbon-iuicommandhandler-updateproperty
     */
    UpdateProperty(commandId, key, currentValue) {
        newValue := PROPVARIANT()
        result := ComCall(4, this, "uint", commandId, "ptr", key, "ptr", currentValue, "ptr", newValue, "HRESULT")
        return newValue
    }
}
