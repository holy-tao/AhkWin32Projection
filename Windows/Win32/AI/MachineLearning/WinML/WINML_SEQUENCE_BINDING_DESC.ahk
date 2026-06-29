#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WINML_TENSOR_DATA_TYPE.ahk" { WINML_TENSOR_DATA_TYPE }

/**
 * Contains description properties of the sequence binding.
 * @see https://learn.microsoft.com/windows/win32/api/winml/ns-winml-winml_sequence_binding_desc
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct WINML_SEQUENCE_BINDING_DESC {
    #StructPack 8

    /**
     * The element count in the sequence binding.
     */
    ElementCount : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winml/ne-winml-winml_tensor_data_type">WINML_TENSOR_DATA_TYPE</a> containing the element tensor data type.
     */
    ElementType : WINML_TENSOR_DATA_TYPE

    pStrings : PWSTR.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pInts', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pFloats', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pDoubles', { type: IntPtr, offset: 8 })
        this.DeleteProp("__New")
    }
}
