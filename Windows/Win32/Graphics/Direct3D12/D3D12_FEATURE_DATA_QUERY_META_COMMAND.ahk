#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Indicates the level of support that the adapter provides for metacommands.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_query_meta_command
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_QUERY_META_COMMAND {
    #StructPack 8

    /**
     * Type: <b>[GUID](../guiddef/ns-guiddef-guid.md)</b>
     * 
     * The fixed GUID that identifies the metacommand to query about.
     */
    CommandId : Guid

    /**
     * Type: <b>[UINT](/windows/win32/winprog/windows-data-types)</b>
     * 
     * For single GPU operation, this is zero. If there are multiple GPU nodes, a bit is set to identify a node (the device's physical adapter). Each bit in the mask corresponds to a single node. Only 1 bit must be set. Refer to [Multi-adapter systems](/windows/win32/direct3d12/multi-engine).
     */
    NodeMask : UInt32

    /**
     * Type: <b> const [void](/windows/win32/winprog/windows-data-types)\*</b>
     * 
     * A pointer to a buffer containing the query input data. Allocate *QueryInputDataSizeInBytes* bytes.
     */
    pQueryInputData : IntPtr

    /**
     * Type: <b>[SIZE_T](/windows/win32/winprog/windows-data-types)</b>
     * 
     * The size of the buffer pointed to by *pQueryInputData*, in bytes.
     */
    QueryInputDataSizeInBytes : IntPtr

    /**
     * Type: <b>[void](/windows/win32/winprog/windows-data-types)\*</b>
     * 
     * A pointer to a buffer containing the query output data.
     */
    pQueryOutputData : IntPtr

    /**
     * Type: <b>[SIZE_T](/windows/win32/winprog/windows-data-types)</b>
     * 
     * The size of the buffer pointed to by *pQueryOutputData*, in bytes.
     */
    QueryOutputDataSizeInBytes : IntPtr

}
