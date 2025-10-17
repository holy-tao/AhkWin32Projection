#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS9 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    MeshShaderPipelineStatsSupported {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    MeshShaderSupportsFullRangeRenderTargetArrayIndex {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {BOOL}
     */
    AtomicInt64OnTypedResourceSupported {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {BOOL}
     */
    AtomicInt64OnGroupSharedSupported {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {BOOL}
     */
    DerivativesInMeshAndAmplificationShadersSupported {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    WaveMMATier {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
