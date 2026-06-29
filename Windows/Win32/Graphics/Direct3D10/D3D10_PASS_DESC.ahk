#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Describes an effect pass, which contains pipeline state.
 * @remarks
 * Get a pass description by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effectpass-getdesc">ID3D10EffectPass::GetDesc</a>; an effect technique contains one or more passes.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/ns-d3d10effect-d3d10_pass_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_PASS_DESC {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * A string that contains the name of the pass; otherwise <b>NULL</b>.
     */
    Name : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of annotations.
     */
    Annotations : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a>*</b>
     * 
     * A pointer to the input signature or the vertex shader; otherwise <b>NULL</b>.
     */
    pIAInputSignature : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The size of the input signature (in bytes).
     */
    IAInputSignatureSize : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The stencil-reference value used in the depth-stencil state (see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-depth-stencil">Configuring Depth-Stencil Functionality (Direct3D 10)</a>).
     */
    StencilRef : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The sample mask for the blend state (see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-blend-state">Configuring Blending Functionality (Direct3D 10)</a>).
     */
    SampleMask : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The per-component blend factors (RGBA) for the blend state (see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-blend-state">Configuring Blending Functionality (Direct3D 10)</a>).
     */
    BlendFactor : Float32[4]

}
