#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the possible execution states of a [CoreAutomationRemoteOperation](coreautomationremoteoperation.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.automationremoteoperationstatus
 * @namespace Windows.UI.UIAutomation.Core
 * @version WindowsRuntime 1.4
 */
class AutomationRemoteOperationStatus extends Win32Enum{

    /**
     * The operation completed successfully.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The bytecode specified in the [Execute](coreautomationremoteoperation_execute_484361623.md) method was malformed.
     * 
     * For example, the bytecode stream might contain fewer bytes than expected depending on the instruction opcodes parsed.
     * @type {Integer (Int32)}
     */
    static MalformedBytecode => 1

    /**
     * The operation exceeded the instruction limit imposed by the remote operation virtual machine.
     * 
     * A remote operation must not execute for so long that it takes over the UI thread of an application (UI Automation provider).
     * @type {Integer (Int32)}
     */
    static InstructionLimitExceeded => 2

    /**
     * A single instruction in the remote operation failed and was not handled in a try-block.
     * 
     * For example, if a UI Automation provider returns an error such as UIA_E_ELEMENTNOTAVAILABLE, the instruction fails and, if left unhandled, an instruction evaluation failure occurs. Use the [AutomationRemoteOperationResult.ExtendedError](automationremoteoperationresult_extendederror.md) property to get additional information and diagnostics for the error that caused the failure.
     * @type {Integer (Int32)}
     */
    static UnhandledException => 3

    /**
     * A generic execution failure.
     * 
     * Use the [AutomationRemoteOperationResult.ExtendedError](automationremoteoperationresult_extendederror.md) property to get additional information and diagnostics. For example, ExtendedError is set to UIA_E_TIMEOUT if the the target application is unresponsive and the operation times out.
     * @type {Integer (Int32)}
     */
    static ExecutionFailure => 4
}
