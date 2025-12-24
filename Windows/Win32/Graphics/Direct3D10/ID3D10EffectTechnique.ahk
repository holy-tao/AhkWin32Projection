#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D10_STATE_BLOCK_MASK.ahk

/**
 * An ID3D10EffectTechnique interface is a collection of passes.
 * @remarks
 * 
 * An effect contains one or more techniques; each technique contains one or more passes; each pass contains state assignments (see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-effects-organize">Organizing State in an Effect (Direct3D 10)</a>). The syntax for creating a technique is shown in <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-effect-technique-syntax">Effect Technique Syntax (Direct3D 10)</a>.
 * 
 * To get an effect-technique interface, call a method like <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effect-gettechniquebyname">ID3D10Effect::GetTechniqueByName</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nn-d3d10effect-id3d10effecttechnique
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10EffectTechnique extends Win32ComInterface{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10EffectTechnique
     * @type {Guid}
     */
    static IID => Guid("{db122ce8-d1c9-4292-b237-24ed3de8b175}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsValid", "GetDesc", "GetAnnotationByIndex", "GetAnnotationByName", "GetPassByIndex", "GetPassByName", "ComputeStateBlockMask"]

    /**
     * Test a technique to see if it contains valid syntax.
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the code syntax is valid; otherwise <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effecttechnique-isvalid
     */
    IsValid() {
        result := ComCall(0, this, "int")
        return result
    }

    /**
     * Get a technique description.
     * @param {Pointer<D3D10_TECHNIQUE_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_technique_desc">D3D10_TECHNIQUE_DESC</a>*</b>
     * 
     * A pointer to a technique description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_technique_desc">D3D10_TECHNIQUE_DESC</a>).
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effecttechnique-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(1, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * Get an annotation by index.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The zero-based index of the interface pointer.
     * @returns {ID3D10EffectVariable} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable</a>*</b>
     * 
     * A pointer to an <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effecttechnique-getannotationbyindex
     */
    GetAnnotationByIndex(Index) {
        result := ComCall(2, this, "uint", Index, "ptr")
        return result
    }

    /**
     * Get an annotation by name.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * Name of the annotation.
     * @returns {ID3D10EffectVariable} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable</a>*</b>
     * 
     * A pointer to an <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effecttechnique-getannotationbyname
     */
    GetAnnotationByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(3, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * Get a pass by index.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index.
     * @returns {ID3D10EffectPass} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectpass">ID3D10EffectPass</a>*</b>
     * 
     * A pointer to a <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectpass">ID3D10EffectPass Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effecttechnique-getpassbyindex
     */
    GetPassByIndex(Index) {
        result := ComCall(4, this, "uint", Index, "ptr")
        return result
    }

    /**
     * Get a pass by name.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the pass.
     * @returns {ID3D10EffectPass} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectpass">ID3D10EffectPass</a>*</b>
     * 
     * A pointer to an <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectpass">ID3D10EffectPass Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effecttechnique-getpassbyname
     */
    GetPassByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(5, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * Compute a state-block mask to allow/prevent state changes.
     * @returns {D3D10_STATE_BLOCK_MASK} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
     * 
     * A pointer to a state-block mask (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effecttechnique-computestateblockmask
     */
    ComputeStateBlockMask() {
        pStateBlockMask := D3D10_STATE_BLOCK_MASK()
        result := ComCall(6, this, "ptr", pStateBlockMask, "HRESULT")
        return pStateBlockMask
    }
}
