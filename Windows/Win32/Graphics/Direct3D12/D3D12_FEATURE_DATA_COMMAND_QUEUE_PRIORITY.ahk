#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Details the adapter's support for prioritization of different command queue types.
 * @remarks
 * 
 * Use this structure with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-checkfeaturesupport">CheckFeatureSupport</a> to determine the priority levels supported by various command queue types.
 * 
 * See the enumeration constant <b>D3D12_FEATURE_COMMAND_QUEUE_PRIORITY</b> in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_feature">D3D12_FEATURE</a> enumeration.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_feature_data_command_queue_priority
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_COMMAND_QUEUE_PRIORITY extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-structs-and-classes?view=vs-2015">SAL</a>: <c>_In_</c>
     * 
     * The type of the command list you're interested in.
     * @type {Integer}
     */
    CommandListType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-structs-and-classes?view=vs-2015">SAL</a>: <c>_In_</c>
     * 
     * The priority level you're interested in.
     * @type {Integer}
     */
    Priority {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-structs-and-classes?view=vs-2015">SAL</a>: <c>_Out_</c>
     * 
     * On return, contains true if the specfied command list type supports the specified priority level; otherwise, false.
     * @type {BOOL}
     */
    PriorityForTypeIsSupported {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
