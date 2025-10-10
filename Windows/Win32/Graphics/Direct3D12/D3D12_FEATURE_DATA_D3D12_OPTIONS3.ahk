#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates the level of support that the adapter provides for timestamp queries, format-casting, immediate write, view instancing, and barycentrics.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_feature_data_d3d12_options3
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS3 extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Indicates whether timestamp queries are supported on copy queues.
     * @type {Integer}
     */
    CopyQueueTimestampQueriesSupported {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Indicates whether casting from one fully typed format to another, compatible, format is supported.
     * @type {Integer}
     */
    CastingFullyTypedFormatSupported {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Indicates the kinds of command lists that support the ability to write an immediate value directly from the command stream into a specified buffer.
     * @type {Integer}
     */
    WriteBufferImmediateSupportFlags {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Indicates the level of support the adapter has for view instancing.
     * @type {Integer}
     */
    ViewInstancingTier {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Indicates whether barycentrics are supported.
     * @type {Integer}
     */
    BarycentricsSupported {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
