#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains values that can represent the size (as supplied to a DirectML operator) of a 2-D plane of elements within a tensor, or a 2-D scale, or any 2-D width/height value.
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_size_2d
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_SIZE_2D extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The width.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The height.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
