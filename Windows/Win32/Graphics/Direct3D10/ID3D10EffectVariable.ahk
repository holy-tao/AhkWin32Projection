#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D10_EFFECT_VARIABLE_DESC.ahk

/**
 * The ID3D10EffectVariable interface is the base class for all effect variables.
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nn-d3d10effect-id3d10effectvariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10EffectVariable extends Win32ComInterface{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10EffectVariable
     * @type {Guid}
     */
    static IID => Guid("{ae897105-00e6-45bf-bb8e-281dd6db8e1b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsValid", "GetType", "GetDesc", "GetAnnotationByIndex", "GetAnnotationByName", "GetMemberByIndex", "GetMemberByName", "GetMemberBySemantic", "GetElement", "GetParentConstantBuffer", "AsScalar", "AsVector", "AsMatrix", "AsString", "AsShaderResource", "AsRenderTargetView", "AsDepthStencilView", "AsConstantBuffer", "AsShader", "AsBlend", "AsDepthStencil", "AsRasterizer", "AsSampler", "SetRawValue", "GetRawValue"]

    /**
     * Compare the data type with the data stored.
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the syntax is valid; otherwise <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-isvalid
     */
    IsValid() {
        result := ComCall(0, this, "int")
        return result
    }

    /**
     * Get type information.
     * @returns {ID3D10EffectType} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effecttype">ID3D10EffectType</a>*</b>
     * 
     * A pointer to an <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effecttype">ID3D10EffectType Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-gettype
     */
    GetType() {
        result := ComCall(1, this, "ptr")
        return result
    }

    /**
     * Get a description.
     * @returns {D3D10_EFFECT_VARIABLE_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_effect_variable_desc">D3D10_EFFECT_VARIABLE_DESC</a>*</b>
     * 
     * A pointer to an effect-variable description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_effect_variable_desc">D3D10_EFFECT_VARIABLE_DESC</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-getdesc
     */
    GetDesc() {
        pDesc := D3D10_EFFECT_VARIABLE_DESC()
        result := ComCall(2, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Get an annotation by index.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index.
     * @returns {ID3D10EffectVariable} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable</a>*</b>
     * 
     * A pointer to an <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-getannotationbyindex
     */
    GetAnnotationByIndex(Index) {
        result := ComCall(3, this, "uint", Index, "ptr")
        return result
    }

    /**
     * Get an annotation by name.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The annotation name.
     * @returns {ID3D10EffectVariable} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable</a>*</b>
     * 
     * A pointer to an <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable Interface</a>.  Note that if the annotation is not found the <b>ID3D10EffectVariable Interface</b> returned will be empty. The <a href="/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-isvalid">ID3D10EffectVariable::IsValid</a> method should be called to determine whether the annotation was found.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-getannotationbyname
     */
    GetAnnotationByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(4, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * Get a structure member by index.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index.
     * @returns {ID3D10EffectVariable} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable</a>*</b>
     * 
     * A pointer to an <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-getmemberbyindex
     */
    GetMemberByIndex(Index) {
        result := ComCall(5, this, "uint", Index, "ptr")
        return result
    }

    /**
     * Get a structure member by name.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * Member name.
     * @returns {ID3D10EffectVariable} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable</a>*</b>
     * 
     * A pointer to an <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-getmemberbyname
     */
    GetMemberByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(6, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * Get a structure member by semantic.
     * @param {PSTR} Semantic Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The semantic.
     * @returns {ID3D10EffectVariable} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable</a>*</b>
     * 
     * A pointer to an <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-getmemberbysemantic
     */
    GetMemberBySemantic(Semantic) {
        Semantic := Semantic is String ? StrPtr(Semantic) : Semantic

        result := ComCall(7, this, "ptr", Semantic, "ptr")
        return result
    }

    /**
     * Get an array element.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index; otherwise 0.
     * @returns {ID3D10EffectVariable} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable</a>*</b>
     * 
     * A pointer to an <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvariable">ID3D10EffectVariable Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-getelement
     */
    GetElement(Index) {
        result := ComCall(8, this, "uint", Index, "ptr")
        return result
    }

    /**
     * Get a constant buffer.
     * @returns {ID3D10EffectConstantBuffer} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectconstantbuffer">ID3D10EffectConstantBuffer</a>*</b>
     * 
     * A pointer to a <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectconstantbuffer">ID3D10EffectConstantBuffer Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-getparentconstantbuffer
     */
    GetParentConstantBuffer() {
        result := ComCall(9, this, "ptr")
        return result
    }

    /**
     * Get a scalar variable.
     * @returns {ID3D10EffectScalarVariable} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectscalarvariable">ID3D10EffectScalarVariable</a>*</b>
     * 
     * A pointer to a scalar variable. See <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectscalarvariable">ID3D10EffectScalarVariable</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-asscalar
     */
    AsScalar() {
        result := ComCall(10, this, "ptr")
        return result
    }

    /**
     * Get a vector variable.
     * @returns {ID3D10EffectVectorVariable} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvectorvariable">ID3D10EffectVectorVariable</a>*</b>
     * 
     * A pointer to a vector variable. See <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectvectorvariable">ID3D10EffectVectorVariable</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-asvector
     */
    AsVector() {
        result := ComCall(11, this, "ptr")
        return result
    }

    /**
     * Get a matrix variable.
     * @returns {ID3D10EffectMatrixVariable} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectmatrixvariable">ID3D10EffectMatrixVariable</a>*</b>
     * 
     * A pointer to a matrix variable. See <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectmatrixvariable">ID3D10EffectMatrixVariable</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-asmatrix
     */
    AsMatrix() {
        result := ComCall(12, this, "ptr")
        return result
    }

    /**
     * Get a string variable.
     * @returns {ID3D10EffectStringVariable} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectstringvariable">ID3D10EffectStringVariable</a>*</b>
     * 
     * A pointer to a string variable. See <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectstringvariable">ID3D10EffectStringVariable</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-asstring
     */
    AsString() {
        result := ComCall(13, this, "ptr")
        return result
    }

    /**
     * Get a shader-resource variable.
     * @returns {ID3D10EffectShaderResourceVariable} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectshaderresourcevariable">ID3D10EffectShaderResourceVariable</a>*</b>
     * 
     * A pointer to a shader-resource variable. See <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectshaderresourcevariable">ID3D10EffectShaderResourceVariable</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-asshaderresource
     */
    AsShaderResource() {
        result := ComCall(14, this, "ptr")
        return result
    }

    /**
     * Get a render-target-view variable.
     * @returns {ID3D10EffectRenderTargetViewVariable} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectrendertargetviewvariable">ID3D10EffectRenderTargetViewVariable</a>*</b>
     * 
     * A pointer to a render-target-view variable. See <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectrendertargetviewvariable">ID3D10EffectRenderTargetViewVariable Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-asrendertargetview
     */
    AsRenderTargetView() {
        result := ComCall(15, this, "ptr")
        return result
    }

    /**
     * Get a depth-stencil-view variable.
     * @returns {ID3D10EffectDepthStencilViewVariable} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectdepthstencilviewvariable">ID3D10EffectDepthStencilViewVariable</a>*</b>
     * 
     * A pointer to a depth-stencil-view variable. See <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectdepthstencilviewvariable">ID3D10EffectDepthStencilViewVariable Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-asdepthstencilview
     */
    AsDepthStencilView() {
        result := ComCall(16, this, "ptr")
        return result
    }

    /**
     * Get a constant buffer.
     * @returns {ID3D10EffectConstantBuffer} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectconstantbuffer">ID3D10EffectConstantBuffer</a>*</b>
     * 
     * A pointer to a constant buffer. See <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectconstantbuffer">ID3D10EffectConstantBuffer</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-asconstantbuffer
     */
    AsConstantBuffer() {
        result := ComCall(17, this, "ptr")
        return result
    }

    /**
     * Get a shader variable.
     * @returns {ID3D10EffectShaderVariable} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectshadervariable">ID3D10EffectShaderVariable</a>*</b>
     * 
     * A pointer to a shader variable. See <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectshadervariable">ID3D10EffectShaderVariable</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-asshader
     */
    AsShader() {
        result := ComCall(18, this, "ptr")
        return result
    }

    /**
     * Get a effect-blend variable.
     * @returns {ID3D10EffectBlendVariable} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectblendvariable">ID3D10EffectBlendVariable</a>*</b>
     * 
     * A pointer to an effect blend variable. See <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectblendvariable">ID3D10EffectBlendVariable</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-asblend
     */
    AsBlend() {
        result := ComCall(19, this, "ptr")
        return result
    }

    /**
     * Get a depth-stencil variable.
     * @returns {ID3D10EffectDepthStencilVariable} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectdepthstencilvariable">ID3D10EffectDepthStencilVariable</a>*</b>
     * 
     * A pointer to a depth-stencil variable. See <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectdepthstencilvariable">ID3D10EffectDepthStencilVariable</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-asdepthstencil
     */
    AsDepthStencil() {
        result := ComCall(20, this, "ptr")
        return result
    }

    /**
     * Get a rasterizer variable.
     * @returns {ID3D10EffectRasterizerVariable} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectrasterizervariable">ID3D10EffectRasterizerVariable</a>*</b>
     * 
     * A pointer to a rasterizer variable. See <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectrasterizervariable">ID3D10EffectRasterizerVariable</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-asrasterizer
     */
    AsRasterizer() {
        result := ComCall(21, this, "ptr")
        return result
    }

    /**
     * Get a sampler variable.
     * @returns {ID3D10EffectSamplerVariable} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectsamplervariable">ID3D10EffectSamplerVariable</a>*</b>
     * 
     * A pointer to a sampler variable. See <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectsamplervariable">ID3D10EffectSamplerVariable</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-assampler
     */
    AsSampler() {
        result := ComCall(22, this, "ptr")
        return result
    }

    /**
     * Set data.
     * @param {Pointer} pData Type: <b>void*</b>
     * 
     * A pointer to the variable.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The offset (in bytes) from the beginning of the pointer to the data.
     * @param {Integer} ByteCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of bytes to set.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-setrawvalue
     */
    SetRawValue(pData, Offset, ByteCount) {
        result := ComCall(23, this, "ptr", pData, "uint", Offset, "uint", ByteCount, "HRESULT")
        return result
    }

    /**
     * Get data.
     * @param {Pointer} pData Type: <b>void*</b>
     * 
     * A pointer to the variable.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The offset (in bytes) from the beginning of the pointer to the data.
     * @param {Integer} ByteCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of bytes to get.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvariable-getrawvalue
     */
    GetRawValue(pData, Offset, ByteCount) {
        result := ComCall(24, this, "ptr", pData, "uint", Offset, "uint", ByteCount, "HRESULT")
        return result
    }
}
