#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_BUFFER_BINDING.ahk" { DML_BUFFER_BINDING }

/**
 * Specifies a resource binding that is an array of individual buffer bindings.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_buffer_array_binding
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_BUFFER_ARRAY_BINDING {
    #StructPack 8

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of individual buffer ranges to bind to this slot. This field determines the size of the <i>Bindings</i> array.
     */
    BindingCount : UInt32

    /**
     * Type: <b>const [DML_BUFFER_BINDING](/windows/win32/api/directml/ns-directml-dml_buffer_binding)*</b>
     * 
     * The individual buffer ranges to bind.
     */
    Bindings : DML_BUFFER_BINDING.Ptr

}
