#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreAutomationRemoteOperation.ahk
#Include .\ICoreAutomationRemoteOperation2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an entry point for UI Automation (UIA) clients to use remote operations.
 * @remarks
 * This class provides the ability to avoid excessive cross-process calls and reduce the overhead of cross-process communication latency.
 * 
 * The remote operation virtual machine accepts a 32-bit unsigned integer (little-endian) representing a bytecode version, followed by a stream of bytecode instructions.
 * 
 * Each bytecode instruction starts with a 32-bit opcode, with multi-byte types encoded using little-endian byte ordering.
 * 
 * The instruction can be followed by a set of parameters, depending on the instruction type. Parameters that refer to objects in an operand register are encoded as 32-bit (little-endian) values, with the relevant operand register referenced by ID. For non-register parameters, see the relevant instruction documentation.
 * 
 * The bytecode accepted by the virtual machine doesn’t expect padding between instructions (the opcode and any subsequent parameters). As such, each instruction has an associated 0-based index, depending on its location in the bytecode stream.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.coreautomationremoteoperation
 * @namespace Windows.UI.UIAutomation.Core
 * @version WindowsRuntime 1.4
 */
class CoreAutomationRemoteOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreAutomationRemoteOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreAutomationRemoteOperation.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new [CoreAutomationRemoteOperation](coreautomationremoteoperation.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.UIAutomation.Core.CoreAutomationRemoteOperation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Retrieves a value that indicates whether the specified opcode is supported by the [CoreAutomationRemoteOperation](coreautomationremoteoperation.md) virtual machine.
     * @remarks
     * Passing unsupported opcodes in the bytecode to the [Execute)](coreautomationremoteoperation_execute_484361623.md) method results in a [AutomationRemoteOperationResult.Status](automationremoteoperationresult_status.md) of [MalformedByteCode](automationremoteoperationstatus.md).
     * 
     * > [!NOTE]
     * > As the Remote Operations virtual machine is found in the provider process, support for an instruction depends on the provider process that executes the remote operation. Therefore, call this method after the operation is bound to a process through [ImportElement](coreautomationremoteoperation_importelement_715571657.md) or [ImportTextRange](coreautomationremoteoperation_importtextrange_726237623.md).
     * @param {Integer} opcode The opcode being tested.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.coreautomationremoteoperation.isopcodesupported
     */
    IsOpcodeSupported(opcode) {
        if (!this.HasProp("__ICoreAutomationRemoteOperation")) {
            if ((queryResult := this.QueryInterface(ICoreAutomationRemoteOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreAutomationRemoteOperation := ICoreAutomationRemoteOperation(outPtr)
        }

        return this.__ICoreAutomationRemoteOperation.IsOpcodeSupported(opcode)
    }

    /**
     * Enables the ability to reference an existing UI Automation element in the context of a remote operation virtual machine.
     * @remarks
     * Do not attempt to import objects that belong to different processes into the same remote operation. Remote operations are bound to a single process.
     * @param {AutomationRemoteOperationOperandId} operandId The ID of the operand to use in the remote operation.
     * @param {AutomationElement} element The UI Automation element to use in the remote operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.coreautomationremoteoperation.importelement
     */
    ImportElement(operandId, element) {
        if (!this.HasProp("__ICoreAutomationRemoteOperation")) {
            if ((queryResult := this.QueryInterface(ICoreAutomationRemoteOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreAutomationRemoteOperation := ICoreAutomationRemoteOperation(outPtr)
        }

        return this.__ICoreAutomationRemoteOperation.ImportElement(operandId, element)
    }

    /**
     * Enables the ability to reference an existing text range in the context of a remote operation virtual machine.
     * @remarks
     * Do not attempt to import objects that belong to different processes into the same remote operation. Remote operations are bound to a single process.
     * @param {AutomationRemoteOperationOperandId} operandId The ID of the operand to use in the remote operation.
     * @param {AutomationTextRange} textRange_ The UI Automation text range to use in the remote operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.coreautomationremoteoperation.importtextrange
     */
    ImportTextRange(operandId, textRange_) {
        if (!this.HasProp("__ICoreAutomationRemoteOperation")) {
            if ((queryResult := this.QueryInterface(ICoreAutomationRemoteOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreAutomationRemoteOperation := ICoreAutomationRemoteOperation(outPtr)
        }

        return this.__ICoreAutomationRemoteOperation.ImportTextRange(operandId, textRange_)
    }

    /**
     * Specifies which operand registers to return after executing the remote operation.
     * @remarks
     * Use [AutomationRemoteOperationResult](automationremoteoperationresult.md) to validate and obtain the local representation.
     * 
     * [AutomationRemoteOperationResult.HasOperand](automationremoteoperationresult_hasoperand_151552314.md) should be used to ensure an object is returned before accessing it.
     * @param {AutomationRemoteOperationOperandId} operandId The ID of the operand to return from the remote operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.coreautomationremoteoperation.addtoresults
     */
    AddToResults(operandId) {
        if (!this.HasProp("__ICoreAutomationRemoteOperation")) {
            if ((queryResult := this.QueryInterface(ICoreAutomationRemoteOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreAutomationRemoteOperation := ICoreAutomationRemoteOperation(outPtr)
        }

        return this.__ICoreAutomationRemoteOperation.AddToResults(operandId)
    }

    /**
     * Executes a [CoreAutomationRemoteOperation](coreautomationremoteoperation.md) on a virtual machine.
     * @remarks
     * This method performs a blocking cross-process call. Do not call from UI or STA threads, as no messages will be pumped while waiting for the response.
     * 
     * If the operation evaluation encounters a failure at any time, objects that were computed (and were in operand registers requested by the client) will be available in the [AutomationRemoteOperationResult](automationremoteoperationresult.md) object.
     * 
     * Do not attempt to execute a remote operation that isn't bound to a process through [ImportElement](coreautomationremoteoperation_importelement_715571657.md) or [ImportTextRange](coreautomationremoteoperation_importtextrange_726237623.md).
     * @param {Integer} bytecodeBuffer_length 
     * @param {Pointer<Integer>} bytecodeBuffer A 32-bit unsigned integer (little-endian) representing a bytecode version, followed by a stream of bytecode instructions.
     * @returns {AutomationRemoteOperationResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.coreautomationremoteoperation.execute
     */
    Execute(bytecodeBuffer_length, bytecodeBuffer) {
        if (!this.HasProp("__ICoreAutomationRemoteOperation")) {
            if ((queryResult := this.QueryInterface(ICoreAutomationRemoteOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreAutomationRemoteOperation := ICoreAutomationRemoteOperation(outPtr)
        }

        return this.__ICoreAutomationRemoteOperation.Execute(bytecodeBuffer_length, bytecodeBuffer)
    }

    /**
     * Imports an [AutomationConnectionBoundObject](../windows.ui.uiautomation/automationconnectionboundobject.md) into this remote operation.
     * @remarks
     * If the object being imported belongs to a different connection than the one already associated with the remote operation, an invalid argument error will occur.
     * @param {AutomationRemoteOperationOperandId} operandId Identifier that refers to an operand register of a [CoreAutomationRemoteOperation](coreautomationremoteoperation.md).
     * @param {AutomationConnectionBoundObject} connectionBoundObject The connection details for a connection-bound object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.coreautomationremoteoperation.importconnectionboundobject
     */
    ImportConnectionBoundObject(operandId, connectionBoundObject) {
        if (!this.HasProp("__ICoreAutomationRemoteOperation2")) {
            if ((queryResult := this.QueryInterface(ICoreAutomationRemoteOperation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreAutomationRemoteOperation2 := ICoreAutomationRemoteOperation2(outPtr)
        }

        return this.__ICoreAutomationRemoteOperation2.ImportConnectionBoundObject(operandId, connectionBoundObject)
    }

;@endregion Instance Methods
}
