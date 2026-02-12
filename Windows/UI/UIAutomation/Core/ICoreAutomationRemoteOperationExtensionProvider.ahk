#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides support for implementing one or more pattern extensions for a UI Automation provider.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.icoreautomationremoteoperationextensionprovider
 * @namespace Windows.UI.UIAutomation.Core
 * @version WindowsRuntime 1.4
 */
class ICoreAutomationRemoteOperationExtensionProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreAutomationRemoteOperationExtensionProvider
     * @type {Guid}
     */
    static IID => Guid("{88f53e67-dc69-553b-a0aa-70477e724da8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CallExtension", "IsExtensionSupported"]

    /**
     * Implemented by a UI Automation (UIA) provider to inform the remote operation user which extension IDs this method supports.
     * @remarks
     * Before calling this method, confirm that the extension is supported with [IsExtensionSupported(System.Guid)](icoreautomationremoteoperationextensionprovider_isextensionsupported_942618684.md).
     * @param {Guid} extensionId The unique identifier of the extension.
     * @param {CoreAutomationRemoteOperationContext} context_ The execution context of the UIA provider extension.
     * @param {Integer} operandIds_length 
     * @param {Pointer<AutomationRemoteOperationOperandId>} operandIds The operands required by the extension.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.icoreautomationremoteoperationextensionprovider.callextension
     */
    CallExtension(extensionId, context_, operandIds_length, operandIds) {
        result := ComCall(6, this, "ptr", extensionId, "ptr", context_, "uint", operandIds_length, "ptr", operandIds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Implemented by a UIA provider to retrieve a value that indicates whether a pattern extension is supported by a UI Automation provider.
     * @remarks
     * This property should return true for GUIDs that are supported by the UIA provider's implementation of [CallExtension(System.Guid,Windows.UI.UIAutomation.Core.CoreAutomationRemoteOperationContext,Windows.UI.UIAutomation.Core.AutomationRemoteOperationOperandId[])].
     * @param {Guid} extensionId The unique identifier of the extension.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.icoreautomationremoteoperationextensionprovider.isextensionsupported
     */
    IsExtensionSupported(extensionId) {
        result := ComCall(7, this, "ptr", extensionId, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
