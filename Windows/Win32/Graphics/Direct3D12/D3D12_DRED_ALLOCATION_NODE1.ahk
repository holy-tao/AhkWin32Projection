#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\D3D12_DRED_ALLOCATION_TYPE.ahk" { D3D12_DRED_ALLOCATION_TYPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DRED_ALLOCATION_NODE1 {
    #StructPack 8

    ObjectNameA : IntPtr

    ObjectNameW : PWSTR

    AllocationType : D3D12_DRED_ALLOCATION_TYPE

    pNext : D3D12_DRED_ALLOCATION_NODE1.Ptr

    pObject : IUnknown

}
