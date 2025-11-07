#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates the level of support that the adapter provides for metacommands.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_feature_data_query_meta_command
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_QUERY_META_COMMAND extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b>[GUID](../guiddef/ns-guiddef-guid.md)</b>
     * 
     * The fixed GUID that identfies the metacommand to query about.
     * @type {Pointer<Guid>}
     */
    CommandId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>[UINT](/windows/win32/winprog/windows-data-types)</b>
     * 
     * For single GPU operation, this is zero. If there are multiple GPU nodes, a bit is set to identify a node (the device's physical adapter). Each bit in the mask corresponds to a single node. Only 1 bit must be set. Refer to [Multi-adapter systems](/windows/win32/direct3d12/multi-engine).
     * @type {Integer}
     */
    NodeMask {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b> const [void](/windows/win32/winprog/windows-data-types)\*</b>
     * 
     * A pointer to a buffer containing the query input data. Allocate *QueryInputDataSizeInBytes* bytes.
     * @type {Pointer<Void>}
     */
    pQueryInputData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>[SIZE_T](/windows/win32/winprog/windows-data-types)</b>
     * 
     * The size of the buffer pointed to by *pQueryInputData*, in bytes.
     * @type {Pointer}
     */
    QueryInputDataSizeInBytes {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>[void](/windows/win32/winprog/windows-data-types)\*</b>
     * 
     * A pointer to a buffer containing the query output data.
     * @type {Pointer<Void>}
     */
    pQueryOutputData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>[SIZE_T](/windows/win32/winprog/windows-data-types)</b>
     * 
     * The size of the buffer pointed to by *pQueryOutputData*, in bytes.
     * @type {Pointer}
     */
    QueryOutputDataSizeInBytes {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
