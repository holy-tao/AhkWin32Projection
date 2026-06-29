#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINML_TENSOR_BINDING_DESC.ahk" { WINML_TENSOR_BINDING_DESC }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WINML_MAP_BINDING_DESC.ahk" { WINML_MAP_BINDING_DESC }
#Import ".\WINML_IMAGE_BINDING_DESC.ahk" { WINML_IMAGE_BINDING_DESC }
#Import ".\WINML_SEQUENCE_BINDING_DESC.ahk" { WINML_SEQUENCE_BINDING_DESC }
#Import ".\WINML_BINDING_TYPE.ahk" { WINML_BINDING_TYPE }
#Import ".\WINML_TENSOR_DATA_TYPE.ahk" { WINML_TENSOR_DATA_TYPE }
#Import ".\WINML_RESOURCE_BINDING_DESC.ahk" { WINML_RESOURCE_BINDING_DESC }
#Import "..\..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Contains a description of the WinML binding.
 * @see https://learn.microsoft.com/windows/win32/api/winml/ns-winml-winml_binding_desc
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct WINML_BINDING_DESC {
    #StructPack 8

    /**
     * The name of the WinML binding.
     */
    Name : PWSTR

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winml/ne-winml-winml_binding_type">WINML_BINDING_TYPE</a> containing the type of the WinML binding.
     */
    BindType : WINML_BINDING_TYPE

    Tensor : WINML_TENSOR_BINDING_DESC

    static __New() {
        DefineProp(this.Prototype, 'Sequence', { type: WINML_SEQUENCE_BINDING_DESC, offset: 16 })
        DefineProp(this.Prototype, 'Map', { type: WINML_MAP_BINDING_DESC, offset: 16 })
        DefineProp(this.Prototype, 'Image', { type: WINML_IMAGE_BINDING_DESC, offset: 16 })
        DefineProp(this.Prototype, 'Resource', { type: WINML_RESOURCE_BINDING_DESC, offset: 16 })
        this.DeleteProp("__New")
    }
}
