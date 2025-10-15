#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

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
     * @type {BOOL}
     */
    CopyQueueTimestampQueriesSupported{
        get {
            if(!this.HasProp("__CopyQueueTimestampQueriesSupported"))
                this.__CopyQueueTimestampQueriesSupported := BOOL(this.ptr + 0)
            return this.__CopyQueueTimestampQueriesSupported
        }
    }

    /**
     * Indicates whether casting from one fully typed format to another, compatible, format is supported.
     * @type {BOOL}
     */
    CastingFullyTypedFormatSupported{
        get {
            if(!this.HasProp("__CastingFullyTypedFormatSupported"))
                this.__CastingFullyTypedFormatSupported := BOOL(this.ptr + 4)
            return this.__CastingFullyTypedFormatSupported
        }
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
     * @type {BOOL}
     */
    BarycentricsSupported{
        get {
            if(!this.HasProp("__BarycentricsSupported"))
                this.__BarycentricsSupported := BOOL(this.ptr + 16)
            return this.__BarycentricsSupported
        }
    }
}
