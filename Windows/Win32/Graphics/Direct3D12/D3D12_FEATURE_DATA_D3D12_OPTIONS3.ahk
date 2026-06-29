#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIEW_INSTANCING_TIER.ahk" { D3D12_VIEW_INSTANCING_TIER }
#Import ".\D3D12_COMMAND_LIST_SUPPORT_FLAGS.ahk" { D3D12_COMMAND_LIST_SUPPORT_FLAGS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Indicates the level of support that the adapter provides for timestamp queries, format-casting, immediate write, view instancing, and barycentrics.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options3
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_D3D12_OPTIONS3 {
    #StructPack 4

    /**
     * Indicates whether timestamp queries are supported on copy queues.
     */
    CopyQueueTimestampQueriesSupported : BOOL

    /**
     * Indicates whether casting from one fully typed format to another, compatible, format is supported.
     */
    CastingFullyTypedFormatSupported : BOOL

    /**
     * Indicates the kinds of command lists that support the ability to write an immediate value directly from the command stream into a specified buffer.
     */
    WriteBufferImmediateSupportFlags : D3D12_COMMAND_LIST_SUPPORT_FLAGS

    /**
     * Indicates the level of support the adapter has for view instancing.
     */
    ViewInstancingTier : D3D12_VIEW_INSTANCING_TIER

    /**
     * Indicates whether barycentrics are supported.
     */
    BarycentricsSupported : BOOL

}
