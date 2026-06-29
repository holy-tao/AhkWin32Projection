#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_COMMAND_LIST_TYPE.ahk" { D3D12_COMMAND_LIST_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Details the adapter's support for prioritization of different command queue types.
 * @remarks
 * Use this structure with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-checkfeaturesupport">CheckFeatureSupport</a> to determine the priority levels supported by various command queue types.
 * 
 * See the enumeration constant <b>D3D12_FEATURE_COMMAND_QUEUE_PRIORITY</b> in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_feature">D3D12_FEATURE</a> enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_command_queue_priority
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_COMMAND_QUEUE_PRIORITY {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-structs-and-classes">SAL</a>: <c>_In_</c>
     * 
     * The type of the command list you're interested in.
     */
    CommandListType : D3D12_COMMAND_LIST_TYPE

    /**
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-structs-and-classes">SAL</a>: <c>_In_</c>
     * 
     * The priority level you're interested in.
     */
    Priority : UInt32

    /**
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-structs-and-classes">SAL</a>: <c>_Out_</c>
     * 
     * On return, contains true if the specfied command list type supports the specified priority level; otherwise, false.
     */
    PriorityForTypeIsSupported : BOOL

}
