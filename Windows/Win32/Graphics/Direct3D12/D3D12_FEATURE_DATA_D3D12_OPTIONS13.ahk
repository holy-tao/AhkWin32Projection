#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS13 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    UnrestrictedBufferTextureCopyPitchSupported{
        get {
            if(!this.HasProp("__UnrestrictedBufferTextureCopyPitchSupported"))
                this.__UnrestrictedBufferTextureCopyPitchSupported := BOOL(this.ptr + 0)
            return this.__UnrestrictedBufferTextureCopyPitchSupported
        }
    }

    /**
     * @type {BOOL}
     */
    UnrestrictedVertexElementAlignmentSupported{
        get {
            if(!this.HasProp("__UnrestrictedVertexElementAlignmentSupported"))
                this.__UnrestrictedVertexElementAlignmentSupported := BOOL(this.ptr + 4)
            return this.__UnrestrictedVertexElementAlignmentSupported
        }
    }

    /**
     * @type {BOOL}
     */
    InvertedViewportHeightFlipsYSupported{
        get {
            if(!this.HasProp("__InvertedViewportHeightFlipsYSupported"))
                this.__InvertedViewportHeightFlipsYSupported := BOOL(this.ptr + 8)
            return this.__InvertedViewportHeightFlipsYSupported
        }
    }

    /**
     * @type {BOOL}
     */
    InvertedViewportDepthFlipsZSupported{
        get {
            if(!this.HasProp("__InvertedViewportDepthFlipsZSupported"))
                this.__InvertedViewportDepthFlipsZSupported := BOOL(this.ptr + 12)
            return this.__InvertedViewportDepthFlipsZSupported
        }
    }

    /**
     * @type {BOOL}
     */
    TextureCopyBetweenDimensionsSupported{
        get {
            if(!this.HasProp("__TextureCopyBetweenDimensionsSupported"))
                this.__TextureCopyBetweenDimensionsSupported := BOOL(this.ptr + 16)
            return this.__TextureCopyBetweenDimensionsSupported
        }
    }

    /**
     * @type {BOOL}
     */
    AlphaBlendFactorSupported{
        get {
            if(!this.HasProp("__AlphaBlendFactorSupported"))
                this.__AlphaBlendFactorSupported := BOOL(this.ptr + 20)
            return this.__AlphaBlendFactorSupported
        }
    }
}
