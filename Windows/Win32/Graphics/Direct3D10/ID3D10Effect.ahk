#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10Device.ahk
#Include .\D3D10_EFFECT_DESC.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An ID3D10Effect interface manages a set of state objects, resources, and shaders for implementing a rendering effect.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nn-d3d10effect-id3d10effect
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
     * Test an effect to see if it contains valid syntax.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the code syntax is valid; otherwise <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-isvalid
     */
    IsValid() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * Test an effect to see if it is part of a memory pool.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the effect is pooled; otherwise <b>FALSE</b>. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectpool">ID3D10EffectPool Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-ispool
     */
    IsPool() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * Get the device that created the effect.
     * @remarks
     * An effect is created for a specific device, by calling a function such as <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3dx10createeffectfromfile">D3DX10CreateEffectFromFile</a>.
     * @returns {ID3D10Device} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>**</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-getdevice
     */
    GetDevice() {
        result := ComCall(5, this, "ptr*", &ppDevice := 0, "HRESULT")
        return ID3D10Device(ppDevice)
    }

    /**
     * Get an effect description.
     * @remarks
     * An effect description contains basic information about an effect such as the techniques it contains and the constant buffer resources it requires.
     * @returns {D3D10_EFFECT_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_effect_desc">D3D10_EFFECT_DESC</a>*</b>
     * 
     * A pointer to an effect description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_effect_desc">D3D10_EFFECT_DESC</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-getdesc
     */
    GetDesc() {
        pDesc := D3D10_EFFECT_DESC()
        result := ComCall(6, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * The ID3D10Effect::GetConstantBufferByIndex (d3d10effect.h) method gets a constant buffer by index.
     * @remarks
     * An effect that contains a variable that will be read/written by an application requires at least one constant buffer. For best performance, an effect should organize variables into one or more constant buffers based on their frequency of update.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index.
     * @returns {ID3D10EffectConstantBuffer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectconstantbuffer">ID3D10EffectConstantBuffer</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectconstantbuffer">ID3D10EffectConstantBuffer Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-getconstantbufferbyindex
     */
    GetConstantBufferByIndex(Index) {
        result := ComCall(7, this, "uint", Index, "ptr")
        return result
    }

    /**
     * Get a constant buffer by name. (ID3D10Effect.GetConstantBufferByName)
     * @remarks
     * An effect that contains a variable that will be read/written by an application requires at least one constant buffer. For best performance, an effect should organize variables into one or more constant buffers based on their frequency of update.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The constant-buffer name.
     * @returns {ID3D10EffectConstantBuffer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectconstantbuffer">ID3D10EffectConstantBuffer</a>*</b>
     * 
     * A pointer to the constant buffer indicated by the Name. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectconstantbuffer">ID3D10EffectConstantBuffer</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-getconstantbufferbyname
     */
    GetConstantBufferByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(8, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * Get a variable by index.
     * @remarks
     * An effect may contain one or more variables. Variables outside of a technique are considered global to all effects, those located inside of a technique are local to that technique. You can access any local non-static effect variable using its name or with an index.
     * 
     * The method returns a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">effect-variable interface</a> if a variable is not found; you can call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effect-isvalid">ID3D10Effect::IsValid</a> to verify whether or not the index exists.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index.
     * @returns {ID3D10EffectVariable} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-getvariablebyindex
     */
    GetVariableByIndex(Index) {
        result := ComCall(9, this, "uint", Index, "ptr")
        return result
    }

    /**
     * Get a variable by name.
     * @remarks
     * An effect may contain one or more variables. Variables outside of a technique are considered global to all effects, those located inside of a technique are local to that technique. You can access an effect variable using its name or with an index.
     * 
     * The method returns a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">effect-variable interface</a> if a variable is not found; you can call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effect-isvalid">ID3D10Effect::IsValid</a> to verify whether or not the name exists.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The variable name.
     * @returns {ID3D10EffectVariable} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-getvariablebyname
     */
    GetVariableByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(10, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * Get a variable by semantic.
     * @remarks
     * Each effect variable can have a semantic attached, which is a user defined metadata string. Some <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-semantics">system-value semantics</a> are reserved words that trigger built in functionality by pipeline stages.
     * 
     * The method returns a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">effect-variable interface</a> if a variable is not found; you can call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effect-isvalid">ID3D10Effect::IsValid</a> to verify whether or not the semantic exists.
     * @param {PSTR} Semantic Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The semantic name.
     * @returns {ID3D10EffectVariable} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable</a>*</b>
     * 
     * A pointer to the effect variable indicated by the Semantic. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-getvariablebysemantic
     */
    GetVariableBySemantic(Semantic) {
        Semantic := Semantic is String ? StrPtr(Semantic) : Semantic

        result := ComCall(11, this, "ptr", Semantic, "ptr")
        return result
    }

    /**
     * Get a technique by index.
     * @remarks
     * An effect contains one or more techniques; each technique contains one or more passes. You can access a technique using its name or with an index. 
     *       For more about techniques, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-effects-organize">techniques and passes</a>.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index.
     * @returns {ID3D10EffectTechnique} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effecttechnique">ID3D10EffectTechnique</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effecttechnique">ID3D10EffectTechnique Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-gettechniquebyindex
     */
    GetTechniqueByIndex(Index) {
        result := ComCall(12, this, "uint", Index, "ptr")
        return result
    }

    /**
     * Get a technique by name.
     * @remarks
     * An effect contains one or more techniques; each technique contains one or more passes. You can access a technique using its name or with an index. For more about techniques, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-effects-organize">techniques and passes</a>.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the technique.
     * @returns {ID3D10EffectTechnique} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effecttechnique">ID3D10EffectTechnique</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effecttechnique">ID3D10EffectTechnique Interface</a>, or <b>NULL</b> if the technique is not found.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-gettechniquebyname
     */
    GetTechniqueByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(13, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * Minimize the amount of memory required for an effect.
     * @remarks
     * An effect uses memory space two different ways: to store the information required by the runtime to execute an effect, and to store the metadata 
     *       required to reflect information back to an application using the API. You can minimize the amount of memory required by an effect by 
     *       calling <b>ID3D10Effect::Optimize</b> which removes the reflection metadata from memory. API methods to read variables will no 
     *       longer work once reflection data has been removed.
     * 
     * The following methods will fail after Optimize has been called on an effect.
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effect-getconstantbufferbyindex">ID3D10Effect::GetConstantBufferByIndex</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effect-getconstantbufferbyname">ID3D10Effect::GetConstantBufferByName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effect-getdesc">ID3D10Effect::GetDesc</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effect-getdevice">ID3D10Effect::GetDevice</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effect-gettechniquebyindex">ID3D10Effect::GetTechniqueByIndex</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effect-gettechniquebyname">ID3D10Effect::GetTechniqueByName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effect-getvariablebyindex">ID3D10Effect::GetVariableByIndex</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effect-getvariablebyname">ID3D10Effect::GetVariableByName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effect-getvariablebysemantic">ID3D10Effect::GetVariableBySemantic</a>
     * </li>
     * </ul>
     * Note that references retrieved with these methods before calling <b>ID3D10Effect::Optimize</b> are still valid 
     *       after <b>ID3D10Effect::Optimize</b> is called.  This allows the application to get all the variables, techniques, and passes it will use, 
     *       call Optimize, and then use the effect.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-optimize
     */
    Optimize() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Test an effect to see if the reflection metadata has been removed from memory.
     * @remarks
     * An effect uses memory space two different ways: to store the information required by the runtime to execute an effect, and to store the metadata required to reflect information back to an application using the API. You can minimize the amount of memory required by an effect by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effect-optimize">ID3D10Effect::Optimize</a> which removes the reflection metadata from memory. Of course, API methods to read variables will no longer work once reflection data has been removed.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the effect is optimized; otherwise <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effect-isoptimized
     */
    IsOptimized() {
        result := ComCall(15, this, "int")
        return result
    }
}
