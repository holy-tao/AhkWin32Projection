#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINML_TENSOR_DATA_TYPE.ahk" { WINML_TENSOR_DATA_TYPE }
#Import "..\..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Contains description properties of the resource binding.
 * @see https://learn.microsoft.com/windows/win32/api/winml/ns-winml-winml_resource_binding_desc
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct WINML_RESOURCE_BINDING_DESC {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winml/ne-winml-winml_tensor_data_type">WINML_TENSOR_DATA_TYPE</a> containing the element tensor data type.
     */
    ElementType : WINML_TENSOR_DATA_TYPE

    /**
     * The resource dimension count.
     */
    NumDimensions : UInt32

    /**
     * A pointer to the shape of the resource.
     */
    pShape : IntPtr

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a> describing the D3D12 resource.
     */
    pResource : ID3D12Resource

}
