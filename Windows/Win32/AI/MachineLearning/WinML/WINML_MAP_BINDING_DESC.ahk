#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WINML_TENSOR_DATA_TYPE.ahk" { WINML_TENSOR_DATA_TYPE }

/**
 * Contains properties for the binding of type map.
 * @see https://learn.microsoft.com/windows/win32/api/winml/ns-winml-winml_map_binding_desc
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct WINML_MAP_BINDING_DESC {
    #StructPack 8

    /**
     * Element count in the map binding.
     */
    ElementCount : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winml/ne-winml-winml_tensor_data_type">WINML_TENSOR_DATA_TYPE</a> containing the key element tensor data type.
     */
    KeyType : WINML_TENSOR_DATA_TYPE

    pStringKeys : PWSTR.Ptr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winml/ne-winml-winml_tensor_data_type">WINML_TENSOR_DATA_TYPE</a> containing the field element tensor data type.
     */
    Fields : WINML_TENSOR_DATA_TYPE

    pStringFields : PWSTR.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pIntKeys', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pIntFields', { type: IntPtr, offset: 24 })
        DefineProp(this.Prototype, 'pFloatFields', { type: IntPtr, offset: 24 })
        DefineProp(this.Prototype, 'pDoubleFields', { type: IntPtr, offset: 24 })
        this.DeleteProp("__New")
    }
}
