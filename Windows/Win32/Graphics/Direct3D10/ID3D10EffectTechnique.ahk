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
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttechnique-isvalid
     */
    IsValid() {
        result := ComCall(0, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_TECHNIQUE_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttechnique-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(1, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ID3D10EffectVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttechnique-getannotationbyindex
     */
    GetAnnotationByIndex(Index) {
        result := ComCall(2, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {ID3D10EffectVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttechnique-getannotationbyname
     */
    GetAnnotationByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(3, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ID3D10EffectPass} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttechnique-getpassbyindex
     */
    GetPassByIndex(Index) {
        result := ComCall(4, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {ID3D10EffectPass} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttechnique-getpassbyname
     */
    GetPassByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(5, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @returns {D3D10_STATE_BLOCK_MASK} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttechnique-computestateblockmask
     */
    ComputeStateBlockMask() {
        pStateBlockMask := D3D10_STATE_BLOCK_MASK()
        result := ComCall(6, this, "ptr", pStateBlockMask, "HRESULT")
        return pStateBlockMask
    }
}
