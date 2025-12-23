#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the binding requirements of a particular compiled operator, or operator initializer. This struct is retrieved from IDMLDispatchable::GetBindingProperties.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_binding_properties
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_BINDING_PROPERTIES extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The minimum size, in descriptors, of the binding table required for a particular dispatchable object (an operator initializer, or a compiled operator).
     * @type {Integer}
     */
    RequiredDescriptorCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The minimum size in bytes of the temporary resource that must be bound to the binding table for a particular dispatchable
     *       object. A value of zero means that a temporary resource is not required.
     * @type {Integer}
     */
    TemporaryResourceSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The minimum size in bytes of the persistent resource that must be bound to the binding table for a particular
     *       dispatchable object. Persistent resources must be supplied during initialization of a compiled operator (where it
     *       is bound as an output of the operator initializer) as well as during execution. A value of zero means that a
     *       persistent resource is not required. Only compiled operators have persistent resources—operator initializers
     *       always return a value of 0 for this member.
     * @type {Integer}
     */
    PersistentResourceSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
