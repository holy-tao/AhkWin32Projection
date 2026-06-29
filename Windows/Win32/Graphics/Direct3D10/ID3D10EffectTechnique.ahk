#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D10_TECHNIQUE_DESC.ahk" { D3D10_TECHNIQUE_DESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D10EffectVariable.ahk" { ID3D10EffectVariable }
#Import ".\D3D10_STATE_BLOCK_MASK.ahk" { D3D10_STATE_BLOCK_MASK }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\ID3D10EffectPass.ahk" { ID3D10EffectPass }

/**
 * An ID3D10EffectTechnique interface is a collection of passes.
 * @remarks
 * An effect contains one or more techniques; each technique contains one or more passes; each pass contains state assignments (see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-effects-organize">Organizing State in an Effect (Direct3D 10)</a>). The syntax for creating a technique is shown in <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-effect-technique-syntax">Effect Technique Syntax (Direct3D 10)</a>.
 * 
 * To get an effect-technique interface, call a method like <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effect-gettechniquebyname">ID3D10Effect::GetTechniqueByName</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nn-d3d10effect-id3d10effecttechnique
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10EffectTechnique extends Win32ComInterface {
    /**
     * The interface identifier for ID3D10EffectTechnique
     * @type {Guid}
     */
    static IID := Guid("{db122ce8-d1c9-4292-b237-24ed3de8b175}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10EffectTechnique interfaces
    */
    struct Vtbl {
        IsValid               : IntPtr
        GetDesc               : IntPtr
        GetAnnotationByIndex  : IntPtr
        GetAnnotationByName   : IntPtr
        GetPassByIndex        : IntPtr
        GetPassByName         : IntPtr
        ComputeStateBlockMask : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10EffectTechnique.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Test a technique to see if it contains valid syntax.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the code syntax is valid; otherwise <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttechnique-isvalid
     */
    IsValid() {
        result := ComCall(0, this, BOOL)
        return result
    }

    /**
     * Get a technique description.
     * @param {Pointer<D3D10_TECHNIQUE_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_technique_desc">D3D10_TECHNIQUE_DESC</a>*</b>
     * 
     * A pointer to a technique description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_technique_desc">D3D10_TECHNIQUE_DESC</a>).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttechnique-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(1, this, D3D10_TECHNIQUE_DESC.Ptr, pDesc, "HRESULT")
        return result
    }

    /**
     * The ID3D10EffectTechnique::GetAnnotationByIndex (d3d10effect.h) method gets an annotation by index.
     * @remarks
     * Use an annotation to attach a piece of metadata to a technique.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The zero-based index of the interface pointer.
     * @returns {ID3D10EffectVariable} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttechnique-getannotationbyindex
     */
    GetAnnotationByIndex(Index) {
        result := ComCall(2, this, "uint", Index, ID3D10EffectVariable)
        return result
    }

    /**
     * Get an annotation by name. (ID3D10EffectTechnique.GetAnnotationByName)
     * @remarks
     * Use an annotation to attach a piece of metadata to a technique.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * Name of the annotation.
     * @returns {ID3D10EffectVariable} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttechnique-getannotationbyname
     */
    GetAnnotationByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(3, this, "ptr", Name, ID3D10EffectVariable)
        return result
    }

    /**
     * Get a pass by index.
     * @remarks
     * A technique contains one or more passes; get a pass using a name or an index.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index.
     * @returns {ID3D10EffectPass} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectpass">ID3D10EffectPass</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectpass">ID3D10EffectPass Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttechnique-getpassbyindex
     */
    GetPassByIndex(Index) {
        result := ComCall(4, this, "uint", Index, ID3D10EffectPass)
        return result
    }

    /**
     * Get a pass by name.
     * @remarks
     * A technique contains one or more passes; get a pass using a name or an index.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the pass.
     * @returns {ID3D10EffectPass} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectpass">ID3D10EffectPass</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectpass">ID3D10EffectPass Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttechnique-getpassbyname
     */
    GetPassByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(5, this, "ptr", Name, ID3D10EffectPass)
        return result
    }

    /**
     * Compute a state-block mask to allow/prevent state changes.
     * @returns {D3D10_STATE_BLOCK_MASK} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
     * 
     * A pointer to a state-block mask (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttechnique-computestateblockmask
     */
    ComputeStateBlockMask() {
        pStateBlockMask := D3D10_STATE_BLOCK_MASK()
        result := ComCall(6, this, D3D10_STATE_BLOCK_MASK.Ptr, pStateBlockMask, "HRESULT")
        return pStateBlockMask
    }

    Query(iid) {
        if (ID3D10EffectTechnique.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }
}
