#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_STATE_SUBOBJECT.ahk" { D3D12_STATE_SUBOBJECT }
#Import ".\D3D12_STATE_OBJECT_TYPE.ahk" { D3D12_STATE_OBJECT_TYPE }

/**
 * Description of a state object. Pass this structure into ID3D12Device::CreateStateObject.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_state_object_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_STATE_OBJECT_DESC {
    #StructPack 8

    /**
     * The type of the state object.
     */
    Type : D3D12_STATE_OBJECT_TYPE

    /**
     * Size of the <i>pSubobjects</i> array.
     */
    NumSubobjects : UInt32

    /**
     * An array of subobject definitions.
     */
    pSubobjects : D3D12_STATE_SUBOBJECT.Ptr

}
