#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9on12
 */
export default struct D3D9ON12_ARGS {
    #StructPack 8

    Enable9On12 : BOOL

    pD3D12Device : IUnknown

    ppD3D12Queues : IUnknown[2]

    NumQueues : UInt32

    NodeMask : UInt32

}
