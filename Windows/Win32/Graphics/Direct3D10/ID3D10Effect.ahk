#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An ID3D10Effect interface manages a set of state objects, resources, and shaders for implementing a rendering effect.
 * @remarks
 * 
  * An effect is created by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-d3d10createeffectfrommemory">D3D10CreateEffectFromMemory</a>.
  * 
  * The effect system groups the information required for rendering into an effect which contains: state objects for assigning state changes in groups, resources for supplying input data and storing output data, and programs that control how the rendering is done called shaders. For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-effects">Effects (Direct3D 10)</a>.
  * 
  * <div class="alert"><b>Note</b>  <p class="note">If you call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on an <b>ID3D10Effect</b> object to retrieve the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface, <b>QueryInterface</b> returns E_NOINTERFACE. To work around this issue, use the following code:
  * 
  * 
  * ```
  * IUnknown* pIUnknown = (IUnknown*)pEffect;
  *     pIUnknown->AddRef();
  * 
  * ```
  * 
  * 
  * </div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nn-d3d10effect-id3d10effect
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10Effect extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10Effect
     * @type {Guid}
     */
    static IID => Guid("{51b0ca8b-ec0b-4519-870d-8ee1cb5017c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsValid", "IsPool", "GetDevice", "GetDesc", "GetConstantBufferByIndex", "GetConstantBufferByName", "GetVariableByIndex", "GetVariableByName", "GetVariableBySemantic", "GetTechniqueByIndex", "GetTechniqueByName", "Optimize", "IsOptimized"]

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-isvalid
     */
    IsValid() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-ispool
     */
    IsPool() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D10Device>} ppDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-getdevice
     */
    GetDevice(ppDevice) {
        result := ComCall(5, this, "ptr*", ppDevice, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_EFFECT_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(6, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ID3D10EffectConstantBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-getconstantbufferbyindex
     */
    GetConstantBufferByIndex(Index) {
        result := ComCall(7, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {ID3D10EffectConstantBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-getconstantbufferbyname
     */
    GetConstantBufferByName(Name) {
        result := ComCall(8, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ID3D10EffectVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-getvariablebyindex
     */
    GetVariableByIndex(Index) {
        result := ComCall(9, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {ID3D10EffectVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-getvariablebyname
     */
    GetVariableByName(Name) {
        result := ComCall(10, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Semantic 
     * @returns {ID3D10EffectVariable} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-getvariablebysemantic
     */
    GetVariableBySemantic(Semantic) {
        result := ComCall(11, this, "ptr", Semantic, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ID3D10EffectTechnique} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-gettechniquebyindex
     */
    GetTechniqueByIndex(Index) {
        result := ComCall(12, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {ID3D10EffectTechnique} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-gettechniquebyname
     */
    GetTechniqueByName(Name) {
        result := ComCall(13, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-optimize
     */
    Optimize() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-isoptimized
     */
    IsOptimized() {
        result := ComCall(15, this, "int")
        return result
    }
}
