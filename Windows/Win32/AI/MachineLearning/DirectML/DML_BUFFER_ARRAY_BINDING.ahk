#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies a resource binding that is an array of individual buffer bindings.
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_buffer_array_binding
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_BUFFER_ARRAY_BINDING extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of individual buffer ranges to bind to this slot. This field determines the size of the <i>Bindings</i> array.
     * @type {Integer}
     */
    BindingCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>const [DML_BUFFER_BINDING](/windows/win32/api/directml/ns-directml-dml_buffer_binding)*</b>
     * 
     * The individual buffer ranges to bind.
     * @type {Pointer<DML_BUFFER_BINDING>}
     */
    Bindings {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
