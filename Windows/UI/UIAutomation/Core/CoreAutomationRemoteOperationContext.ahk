#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreAutomationRemoteOperationContext.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides the ability for a [ICoreAutomationRemoteOperationExtensionProvider](icoreautomationremoteoperationextensionprovider.md) object to read and write operands.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.coreautomationremoteoperationcontext
 * @namespace Windows.UI.UIAutomation.Core
 * @version WindowsRuntime 1.4
 */
class CoreAutomationRemoteOperationContext extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreAutomationRemoteOperationContext

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreAutomationRemoteOperationContext.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Retrieves an operand value for a [ICoreAutomationRemoteOperationExtensionProvider](icoreautomationremoteoperationextensionprovider.md) extension call.
     * @param {AutomationRemoteOperationOperandId} id The ID of the operand that contains the value returned from the remote operation on the UIA provider.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.coreautomationremoteoperationcontext.getoperand
     */
    GetOperand(id) {
        if (!this.HasProp("__ICoreAutomationRemoteOperationContext")) {
            if ((queryResult := this.QueryInterface(ICoreAutomationRemoteOperationContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreAutomationRemoteOperationContext := ICoreAutomationRemoteOperationContext(outPtr)
        }

        return this.__ICoreAutomationRemoteOperationContext.GetOperand(id)
    }

    /**
     * Sets an operand value for a [ICoreAutomationRemoteOperationExtensionProvider](icoreautomationremoteoperationextensionprovider.md) extension call.
     * @param {AutomationRemoteOperationOperandId} id The ID of the operand.
     * @param {IInspectable} operand The operand value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.coreautomationremoteoperationcontext.setoperand
     */
    SetOperand(id, operand) {
        if (!this.HasProp("__ICoreAutomationRemoteOperationContext")) {
            if ((queryResult := this.QueryInterface(ICoreAutomationRemoteOperationContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreAutomationRemoteOperationContext := ICoreAutomationRemoteOperationContext(outPtr)
        }

        return this.__ICoreAutomationRemoteOperationContext.SetOperand(id, operand)
    }

    /**
     * Sets an operand value for a [ICoreAutomationRemoteOperationExtensionProvider](icoreautomationremoteoperationextensionprovider.md) extension call.
     * @param {AutomationRemoteOperationOperandId} id The ID of the operand.
     * @param {IInspectable} operand The operand value.
     * @param {Guid} operandInterfaceId The interface identifier of the operand.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.coreautomationremoteoperationcontext.setoperand
     */
    SetOperand2(id, operand, operandInterfaceId) {
        if (!this.HasProp("__ICoreAutomationRemoteOperationContext")) {
            if ((queryResult := this.QueryInterface(ICoreAutomationRemoteOperationContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreAutomationRemoteOperationContext := ICoreAutomationRemoteOperationContext(outPtr)
        }

        return this.__ICoreAutomationRemoteOperationContext.SetOperand2(id, operand, operandInterfaceId)
    }

;@endregion Instance Methods
}
