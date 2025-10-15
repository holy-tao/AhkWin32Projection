#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

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
    MeshShaderPipelineStatsSupported{
        get {
            if(!this.HasProp("__MeshShaderPipelineStatsSupported"))
                this.__MeshShaderPipelineStatsSupported := BOOL(this.ptr + 0)
            return this.__MeshShaderPipelineStatsSupported
        }
    }

    /**
     * @type {BOOL}
     */
    MeshShaderSupportsFullRangeRenderTargetArrayIndex{
        get {
            if(!this.HasProp("__MeshShaderSupportsFullRangeRenderTargetArrayIndex"))
                this.__MeshShaderSupportsFullRangeRenderTargetArrayIndex := BOOL(this.ptr + 4)
            return this.__MeshShaderSupportsFullRangeRenderTargetArrayIndex
        }
    }

    /**
     * @type {BOOL}
     */
    AtomicInt64OnTypedResourceSupported{
        get {
            if(!this.HasProp("__AtomicInt64OnTypedResourceSupported"))
                this.__AtomicInt64OnTypedResourceSupported := BOOL(this.ptr + 8)
            return this.__AtomicInt64OnTypedResourceSupported
        }
    }

    /**
     * @type {BOOL}
     */
    AtomicInt64OnGroupSharedSupported{
        get {
            if(!this.HasProp("__AtomicInt64OnGroupSharedSupported"))
                this.__AtomicInt64OnGroupSharedSupported := BOOL(this.ptr + 12)
            return this.__AtomicInt64OnGroupSharedSupported
        }
    }

    /**
     * @type {BOOL}
     */
    DerivativesInMeshAndAmplificationShadersSupported{
        get {
            if(!this.HasProp("__DerivativesInMeshAndAmplificationShadersSupported"))
                this.__DerivativesInMeshAndAmplificationShadersSupported := BOOL(this.ptr + 16)
            return this.__DerivativesInMeshAndAmplificationShadersSupported
        }
    }

    /**
     * @type {Integer}
     */
    WaveMMATier {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
