#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about the binding requirements of a particular compiled operator, or operator initializer. This struct is retrieved from IDMLDispatchable::GetBindingProperties.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_binding_properties
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_BINDING_PROPERTIES {
    #StructPack 8

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The minimum size, in descriptors, of the binding table required for a particular dispatchable object (an operator initializer, or a compiled operator).
     */
    RequiredDescriptorCount : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The minimum size in bytes of the temporary resource that must be bound to the binding table for a particular dispatchable
     *       object. A value of zero means that a temporary resource is not required.
     */
    TemporaryResourceSize : Int64

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The minimum size in bytes of the persistent resource that must be bound to the binding table for a particular
     *       dispatchable object. Persistent resources must be supplied during initialization of a compiled operator (where it
     *       is bound as an output of the operator initializer) as well as during execution. A value of zero means that a
     *       persistent resource is not required. Only compiled operators have persistent resources—operator initializers
     *       always return a value of 0 for this member.
     */
    PersistentResourceSize : Int64

}
