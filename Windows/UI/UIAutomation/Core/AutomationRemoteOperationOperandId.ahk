#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an identifier that refers to an operand register of a [CoreAutomationRemoteOperation](coreautomationremoteoperation.md).
 * @remarks
 * The [CoreAutomationRemoteOperation](coreautomationremoteoperation.md) virtual machine uses a register-based instruction set architecture.
 * 
 * The virtual machine has 2<sup>32</sup> registers, each addressed by a 32-bit integer, referred to as *operand registers*. An **AutomationRemoteOperationOperandId** is the integer value that refers to an operand register.
 * 
 * Registers can be reassigned as needed.
 * 
 * Unless initialized through a call to [ImportElement](coreautomationremoteoperation_importelement_715571657.md) or [ImportTextRange](coreautomationremoteoperation_importtextrange_726237623.md), all registers are unbound (do not refer to any operands) when [CoreAutomationRemoteOperation.Execute(System.Byte\[\])](/uwp/api/windows.ui.uiautomation.core.coreautomationremoteoperation.execute) is called and the remote operation starts.
 * 
 * The virtual machine supports the following types:
 * 
 * - Primitives
 *   - Signed 32-bit integer
 *   - Unsigned 32-bit integer
 *   - Boolean
 *   - Double-precision floating point number
 *   - Two-byte character
 *   - Point – a pair of X and Y coordinates, each of which is a double-precision float
 *   - Rect – a four-tuple of Height, Width, X, and Y values (each a double)
 * - Reference types
 *   - Remote UIAutomation Element – a representation of functionality typically exposed by the IUIAutomationElement interface
 *   - Remote UIAutomation Patterns – a different type exists for every UIA pattern
 *   - String – a sequence of two-byte characters used for any UIA (strings are immutable)
 *   - Array – a collection that can contain a heterogeneous sequence of remote objects
 *   - StringMap – a map of remote strings to remote objects (supports heterogeneous types)
 * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.automationremoteoperationoperandid
 * @namespace Windows.UI.UIAutomation.Core
 * @version WindowsRuntime 1.4
 */
class AutomationRemoteOperationOperandId extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The 32-bit integer address of the operand register.
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
