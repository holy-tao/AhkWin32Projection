#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D10_STATE_BLOCK_MASK.ahk

/**
 * A pass interface encapsulates state assignments within a technique.
 * @remarks
 * 
  * A pass is a block of code that sets render-state objects and shaders. A pass is declared within a technique; the syntax for a technique is shown in <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-effect-technique-syntax">Effect Technique Syntax (Direct3D 10)</a>.
  * 
  * To get an effect-pass interface, call a method like <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effecttechnique-getpassbyname">ID3D10EffectTechnique::GetPassByName</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nn-d3d10effect-id3d10effectpass
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10EffectPass extends Win32ComInterface{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10EffectPass
     * @type {Guid}
     */
    static IID => Guid("{5cfbeb89-1a06-46e0-b282-e3f9bfa36a54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsValid", "GetDesc", "GetVertexShaderDesc", "GetGeometryShaderDesc", "GetPixelShaderDesc", "GetAnnotationByIndex", "GetAnnotationByName", "Apply", "ComputeStateBlockMask"]

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectpass-isvalid
     */
    IsValid() {
        result := ComCall(0, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_PASS_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectpass-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(1, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_PASS_SHADER_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectpass-getvertexshaderdesc
     */
    GetVertexShaderDesc(pDesc) {
        result := ComCall(2, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_PASS_SHADER_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectpass-getgeometryshaderdesc
     */
    GetGeometryShaderDesc(pDesc) {
        result := ComCall(3, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_PASS_SHADER_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectpass-getpixelshaderdesc
     */
    GetPixelShaderDesc(pDesc) {
        result := ComCall(4, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ID3D10EffectVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectpass-getannotationbyindex
     */
    GetAnnotationByIndex(Index) {
        result := ComCall(5, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {ID3D10EffectVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectpass-getannotationbyname
     */
    GetAnnotationByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(6, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectpass-apply
     */
    Apply(Flags) {
        result := ComCall(7, this, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {D3D10_STATE_BLOCK_MASK} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectpass-computestateblockmask
     */
    ComputeStateBlockMask() {
        pStateBlockMask := D3D10_STATE_BLOCK_MASK()
        result := ComCall(8, this, "ptr", pStateBlockMask, "HRESULT")
        return pStateBlockMask
    }
}
