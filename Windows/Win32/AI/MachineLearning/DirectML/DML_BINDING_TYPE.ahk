#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify the nature of the resource(s) referred to by a binding description (a DML_BINDING_DESC structure).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_binding_type
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_BINDING_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
