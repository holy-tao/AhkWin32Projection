#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D10_PASS_SHADER_DESC.ahk" { D3D10_PASS_SHADER_DESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D10EffectVariable.ahk" { ID3D10EffectVariable }
#Import ".\D3D10_STATE_BLOCK_MASK.ahk" { D3D10_STATE_BLOCK_MASK }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D10_PASS_DESC.ahk" { D3D10_PASS_DESC }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * A pass interface encapsulates state assignments within a technique.
 * @remarks
 * A pass is a block of code that sets render-state objects and shaders. A pass is declared within a technique; the syntax for a technique is shown in <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-effect-technique-syntax">Effect Technique Syntax (Direct3D 10)</a>.
 * 
 * To get an effect-pass interface, call a method like <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effecttechnique-getpassbyname">ID3D10EffectTechnique::GetPassByName</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nn-d3d10effect-id3d10effectpass
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10EffectPass extends Win32ComInterface {
    /**
     * The interface identifier for ID3D10EffectPass
     * @type {Guid}
     */
    static IID := Guid("{5cfbeb89-1a06-46e0-b282-e3f9bfa36a54}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10EffectPass interfaces
    */
    struct Vtbl {
        IsValid               : IntPtr
        GetDesc               : IntPtr
        GetVertexShaderDesc   : IntPtr
        GetGeometryShaderDesc : IntPtr
        GetPixelShaderDesc    : IntPtr
        GetAnnotationByIndex  : IntPtr
        GetAnnotationByName   : IntPtr
        Apply                 : IntPtr
        ComputeStateBlockMask : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10EffectPass.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Test a pass to see if it contains valid syntax.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the code syntax is valid; otherwise <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectpass-isvalid
     */
    IsValid() {
        result := ComCall(0, this, BOOL)
        return result
    }

    /**
     * Get a pass description.
     * @remarks
     * A pass is a block of code that sets render state and shaders (which in turn sets constant buffers, samplers and textures). An effect technique contains one or more passes. See <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-effects-organize">techniques and passes</a>.
     * @param {Pointer<D3D10_PASS_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_pass_desc">D3D10_PASS_DESC</a>*</b>
     * 
     * A pointer to a pass description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_pass_desc">D3D10_PASS_DESC</a>).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectpass-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(1, this, D3D10_PASS_DESC.Ptr, pDesc, "HRESULT")
        return result
    }

    /**
     * Get a vertex-shader description.
     * @remarks
     * An effect pass can contain render state assignments and shader object assignments.
     * @param {Pointer<D3D10_PASS_SHADER_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_pass_shader_desc">D3D10_PASS_SHADER_DESC</a>*</b>
     * 
     * A pointer to a vertex-shader description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_pass_shader_desc">D3D10_PASS_SHADER_DESC</a>).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectpass-getvertexshaderdesc
     */
    GetVertexShaderDesc(pDesc) {
        result := ComCall(2, this, D3D10_PASS_SHADER_DESC.Ptr, pDesc, "HRESULT")
        return result
    }

    /**
     * Get a geometry-shader description.
     * @remarks
     * An effect pass can contain render state assignments and shader object assignments.
     * @param {Pointer<D3D10_PASS_SHADER_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_pass_shader_desc">D3D10_PASS_SHADER_DESC</a>*</b>
     * 
     * A pointer to a geometry-shader description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_pass_shader_desc">D3D10_PASS_SHADER_DESC</a>).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectpass-getgeometryshaderdesc
     */
    GetGeometryShaderDesc(pDesc) {
        result := ComCall(3, this, D3D10_PASS_SHADER_DESC.Ptr, pDesc, "HRESULT")
        return result
    }

    /**
     * Get a pixel-shader description.
     * @remarks
     * An effect pass can contain render state assignments and shader object assignments.
     * @param {Pointer<D3D10_PASS_SHADER_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_pass_shader_desc">D3D10_PASS_SHADER_DESC</a>*</b>
     * 
     * A pointer to a pixel-shader description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_pass_shader_desc">D3D10_PASS_SHADER_DESC</a>).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectpass-getpixelshaderdesc
     */
    GetPixelShaderDesc(pDesc) {
        result := ComCall(4, this, D3D10_PASS_SHADER_DESC.Ptr, pDesc, "HRESULT")
        return result
    }

    /**
     * The ID3D10EffectPass::GetAnnotationByIndex (d3d10effect.h) method gets an annotation by index.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index.
     * @returns {ID3D10EffectVariable} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectpass-getannotationbyindex
     */
    GetAnnotationByIndex(Index) {
        result := ComCall(5, this, "uint", Index, ID3D10EffectVariable)
        return result
    }

    /**
     * Get an annotation by name. (ID3D10EffectPass.GetAnnotationByName)
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the annotation.
     * @returns {ID3D10EffectVariable} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectpass-getannotationbyname
     */
    GetAnnotationByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(6, this, "ptr", Name, ID3D10EffectVariable)
        return result
    }

    /**
     * Set the state contained in a pass to the device.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Unused.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectpass-apply
     */
    Apply(Flags) {
        result := ComCall(7, this, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * Generate a mask for allowing/preventing state changes.
     * @returns {D3D10_STATE_BLOCK_MASK} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
     * 
     * A pointer to a state-block mask (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectpass-computestateblockmask
     */
    ComputeStateBlockMask() {
        pStateBlockMask := D3D10_STATE_BLOCK_MASK()
        result := ComCall(8, this, D3D10_STATE_BLOCK_MASK.Ptr, pStateBlockMask, "HRESULT")
        return pStateBlockMask
    }

    Query(iid) {
        if (ID3D10EffectPass.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }
}
