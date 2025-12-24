#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The ID3D10EffectType interface accesses effect variables by type.
 * @remarks
 * 
 * To get information about an effect type from an effect variable, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-gettype">ID3D10EffectVariable::GetType</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nn-d3d10effect-id3d10effecttype
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10EffectType extends Win32ComInterface{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10EffectType
     * @type {Guid}
     */
    static IID => Guid("{4e9e1ddc-cd9d-4772-a837-00180b9b88fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsValid", "GetDesc", "GetMemberTypeByIndex", "GetMemberTypeByName", "GetMemberTypeBySemantic", "GetMemberName", "GetMemberSemantic"]

    /**
     * Tests that the effect type is valid.
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if it is valid; otherwise <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effecttype-isvalid
     */
    IsValid() {
        result := ComCall(0, this, "int")
        return result
    }

    /**
     * Get an effect-type description.
     * @param {Pointer<D3D10_EFFECT_TYPE_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_effect_type_desc">D3D10_EFFECT_TYPE_DESC</a>*</b>
     * 
     * A pointer to an effect-type description. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_effect_type_desc">D3D10_EFFECT_TYPE_DESC</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effecttype-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(1, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * Get a member type by index.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index.
     * @returns {ID3D10EffectType} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effecttype">ID3D10EffectType</a>*</b>
     * 
     * A pointer to an <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effecttype">ID3D10EffectType Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effecttype-getmembertypebyindex
     */
    GetMemberTypeByIndex(Index) {
        result := ComCall(2, this, "uint", Index, "ptr")
        return result
    }

    /**
     * Get an member type by name.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * A member's name.
     * @returns {ID3D10EffectType} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effecttype">ID3D10EffectType</a>*</b>
     * 
     * A pointer to an <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effecttype">ID3D10EffectType Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effecttype-getmembertypebyname
     */
    GetMemberTypeByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(3, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * Get a member type by semantic.
     * @param {PSTR} Semantic Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * A semantic.
     * @returns {ID3D10EffectType} Type: <b><a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effecttype">ID3D10EffectType</a>*</b>
     * 
     * A pointer to an <a href="/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effecttype">ID3D10EffectType Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effecttype-getmembertypebysemantic
     */
    GetMemberTypeBySemantic(Semantic) {
        Semantic := Semantic is String ? StrPtr(Semantic) : Semantic

        result := ComCall(4, this, "ptr", Semantic, "ptr")
        return result
    }

    /**
     * Get the name of a member.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index.
     * @returns {PSTR} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the member.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effecttype-getmembername
     */
    GetMemberName(Index) {
        result := ComCall(5, this, "uint", Index, "char*")
        return result
    }

    /**
     * Get the semantic attached to a member.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index.
     * @returns {PSTR} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * A string that contains the semantic.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effecttype-getmembersemantic
     */
    GetMemberSemantic(Index) {
        result := ComCall(6, this, "uint", Index, "char*")
        return result
    }
}
