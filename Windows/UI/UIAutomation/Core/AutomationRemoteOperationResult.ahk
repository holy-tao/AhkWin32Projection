#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAutomationRemoteOperationResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides access to the execution results (status and remote objects) of a [CoreAutomationRemoteOperation](coreautomationremoteoperation.md).
 * @remarks
 * An instance of this runtime class is returned by the [CoreAutomationRemoteOperation.Execute(System.Byte\[\])](/uwp/api/windows.ui.uiautomation.core.coreautomationremoteoperation.execute) method.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.automationremoteoperationresult
 * @namespace Windows.UI.UIAutomation.Core
 * @version WindowsRuntime 1.4
 */
class AutomationRemoteOperationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAutomationRemoteOperationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAutomationRemoteOperationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the execution state of a [CoreAutomationRemoteOperation](coreautomationremoteoperation.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.automationremoteoperationresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets additional error information when the remote operation [Status](automationremoteoperationresult_status.md) returns `InstructionEvaluationFailure` or `ExecutionFailure`.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.automationremoteoperationresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * Gets an reference to the instruction in the bytecode stream where the remote operation [Status](automationremoteoperationresult_status.md) does not return [Success](automationremoteoperationstatus.md).
     * @remarks
     * ErrorLocation specifies the number of the malformed instruction if the remote operation [Status](automationremoteoperationresult_status.md) returns [MalformedBytecode](automationremoteoperationstatus.md). For example, if the very first instruction contains an invalid opcode, this property returns a value of 0. If the first 5 instructions have valid opcodes and parameters, but the 6th one doesn’t, this property returns a value of 5.
     * 
     * For [UnhandledException](automationremoteoperationstatus.md), this property returns the index of the instruction that raised the exception.
     * 
     * For [InstructionLimitExceeded](automationremoteoperationstatus.md), this property returns the very next instruction to be executed after the limit.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.automationremoteoperationresult.errorlocation
     * @type {Integer} 
     */
    ErrorLocation {
        get => this.get_ErrorLocation()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IAutomationRemoteOperationResult")) {
            if ((queryResult := this.QueryInterface(IAutomationRemoteOperationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationRemoteOperationResult := IAutomationRemoteOperationResult(outPtr)
        }

        return this.__IAutomationRemoteOperationResult.get_Status()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IAutomationRemoteOperationResult")) {
            if ((queryResult := this.QueryInterface(IAutomationRemoteOperationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationRemoteOperationResult := IAutomationRemoteOperationResult(outPtr)
        }

        return this.__IAutomationRemoteOperationResult.get_ExtendedError()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ErrorLocation() {
        if (!this.HasProp("__IAutomationRemoteOperationResult")) {
            if ((queryResult := this.QueryInterface(IAutomationRemoteOperationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationRemoteOperationResult := IAutomationRemoteOperationResult(outPtr)
        }

        return this.__IAutomationRemoteOperationResult.get_ErrorLocation()
    }

    /**
     * Retrieves a value indicating whether the specified operand has a value returned from the remote operation on the UIA provider.
     * @param {AutomationRemoteOperationOperandId} operandId The ID of the operand returned from the remote operation on the UIA provider.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.automationremoteoperationresult.hasoperand
     */
    HasOperand(operandId) {
        if (!this.HasProp("__IAutomationRemoteOperationResult")) {
            if ((queryResult := this.QueryInterface(IAutomationRemoteOperationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationRemoteOperationResult := IAutomationRemoteOperationResult(outPtr)
        }

        return this.__IAutomationRemoteOperationResult.HasOperand(operandId)
    }

    /**
     * Retrieves the value returned from the remote operation on the UIA provider.
     * @param {AutomationRemoteOperationOperandId} operandId The ID of the operand that contains the value returned from the remote operation on the UIA provider.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.automationremoteoperationresult.getoperand
     */
    GetOperand(operandId) {
        if (!this.HasProp("__IAutomationRemoteOperationResult")) {
            if ((queryResult := this.QueryInterface(IAutomationRemoteOperationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationRemoteOperationResult := IAutomationRemoteOperationResult(outPtr)
        }

        return this.__IAutomationRemoteOperationResult.GetOperand(operandId)
    }

;@endregion Instance Methods
}
