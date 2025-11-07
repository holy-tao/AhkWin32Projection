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
     * 
     * @param {Integer} commandId 
     * @param {Integer} verb 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} currentValue 
     * @param {IUISimplePropertySet} commandExecutionProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuicommandhandler-execute
     */
    Execute(commandId, verb, key, currentValue, commandExecutionProperties) {
        result := ComCall(3, this, "uint", commandId, "int", verb, "ptr", key, "ptr", currentValue, "ptr", commandExecutionProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} commandId 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} currentValue 
     * @returns {PROPVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuicommandhandler-updateproperty
     */
    UpdateProperty(commandId, key, currentValue) {
        newValue := PROPVARIANT()
        result := ComCall(4, this, "uint", commandId, "ptr", key, "ptr", currentValue, "ptr", newValue, "HRESULT")
        return newValue
    }
}
