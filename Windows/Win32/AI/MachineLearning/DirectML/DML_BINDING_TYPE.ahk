#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the nature of the resource(s) referred to by a binding description (a DML_BINDING_DESC structure).
 * @see https://docs.microsoft.com/windows/win32/api//directml/ne-directml-dml_binding_type
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_BINDING_TYPE extends Win32Enum{

    /**
     * Indicates that no resources are to be bound.
     * @type {Integer (Int32)}
     */
    static DML_BINDING_TYPE_NONE => 0

    /**
     * Specifies a binding that binds a single buffer to the binding table. The corresponding binding desc type is <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_buffer_binding">DML_BUFFER_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static DML_BINDING_TYPE_BUFFER => 1

    /**
     * Specifies a binding that binds an array of buffers to the binding table. The corresponding binding desc type is <a href="https://docs.microsoft.com/windows/win32/api/directml/ns-directml-dml_buffer_array_binding">DML_BUFFER_ARRAY_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static DML_BINDING_TYPE_BUFFER_ARRAY => 2
}
