#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_NODE_ID.ahk" { D3D12_NODE_ID }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_NODE_OUTPUT_OVERRIDES {
    #StructPack 8

    OutputIndex : UInt32

    pNewName : D3D12_NODE_ID.Ptr

    pAllowSparseNodes : BOOL.Ptr

    pMaxRecords : IntPtr

    pMaxRecordsSharedWithOutputIndex : IntPtr

}
