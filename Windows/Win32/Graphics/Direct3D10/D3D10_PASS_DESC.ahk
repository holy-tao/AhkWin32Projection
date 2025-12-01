#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an effect pass, which contains pipeline state.
 * @remarks
 * Get a pass description by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effectpass-getdesc">ID3D10EffectPass::GetDesc</a>; an effect technique contains one or more passes.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/ns-d3d10effect-d3d10_pass_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_PASS_DESC extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * A string that contains the name of the pass; otherwise <b>NULL</b>.
     * @type {PSTR}
     */
    Name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of annotations.
     * @type {Integer}
     */
    Annotations {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a>*</b>
     * 
     * A pointer to the input signature or the vertex shader; otherwise <b>NULL</b>.
     * @type {Pointer<Integer>}
     */
    pIAInputSignature {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The size of the input signature (in bytes).
     * @type {Pointer}
     */
    IAInputSignatureSize {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The stencil-reference value used in the depth-stencil state (see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-depth-stencil">Configuring Depth-Stencil Functionality (Direct3D 10)</a>).
     * @type {Integer}
     */
    StencilRef {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The sample mask for the blend state (see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-blend-state">Configuring Blending Functionality (Direct3D 10)</a>).
     * @type {Integer}
     */
    SampleMask {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The per-component blend factors (RGBA) for the blend state (see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-blend-state">Configuring Blending Functionality (Direct3D 10)</a>).
     * @type {Array<Single>}
     */
    BlendFactor{
        get {
            if(!this.HasProp("__BlendFactorProxyArray"))
                this.__BlendFactorProxyArray := Win32FixedArray(this.ptr + 40, 4, Primitive, "float")
            return this.__BlendFactorProxyArray
        }
    }
}
