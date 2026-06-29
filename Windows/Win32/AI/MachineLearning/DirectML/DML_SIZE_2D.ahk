#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that can represent the size (as supplied to a DirectML operator) of a 2-D plane of elements within a tensor, or a 2-D scale, or any 2-D width/height value.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_size_2d
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_SIZE_2D {
    #StructPack 4

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The width.
     */
    Width : UInt32

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The height.
     */
    Height : UInt32

}
