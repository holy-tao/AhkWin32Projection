#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D10_EFFECT_TYPE_DESC.ahk" { D3D10_EFFECT_TYPE_DESC }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The ID3D10EffectType interface accesses effect variables by type.
 * @remarks
 * To get information about an effect type from an effect variable, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effectvariable-gettype">ID3D10EffectVariable::GetType</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nn-d3d10effect-id3d10effecttype
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10EffectType extends Win32ComInterface {
    /**
     * The interface identifier for ID3D10EffectType
     * @type {Guid}
     */
    static IID := Guid("{4e9e1ddc-cd9d-4772-a837-00180b9b88fd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10EffectType interfaces
    */
    struct Vtbl {
        IsValid                 : IntPtr
        GetDesc                 : IntPtr
        GetMemberTypeByIndex    : IntPtr
        GetMemberTypeByName     : IntPtr
        GetMemberTypeBySemantic : IntPtr
        GetMemberName           : IntPtr
        GetMemberSemantic       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10EffectType.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Tests that the effect type is valid.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if it is valid; otherwise <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttype-isvalid
     */
    IsValid() {
        result := ComCall(0, this, BOOL)
        return result
    }

    /**
     * Get an effect-type description.
     * @remarks
     * The effect-variable description contains data about the name, annotations, semantic, flags and buffer offset of the effect type.
     * @param {Pointer<D3D10_EFFECT_TYPE_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_effect_type_desc">D3D10_EFFECT_TYPE_DESC</a>*</b>
     * 
     * A pointer to an effect-type description. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_effect_type_desc">D3D10_EFFECT_TYPE_DESC</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttype-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(1, this, D3D10_EFFECT_TYPE_DESC.Ptr, pDesc, "HRESULT")
        return result
    }

    /**
     * Get a member type by index.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index.
     * @returns {ID3D10EffectType} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effecttype">ID3D10EffectType</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effecttype">ID3D10EffectType Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttype-getmembertypebyindex
     */
    GetMemberTypeByIndex(Index) {
        result := ComCall(2, this, "uint", Index, ID3D10EffectType)
        return result
    }

    /**
     * Get a member type by name.
     * @param {PSTR} Name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * A member's name.
     * @returns {ID3D10EffectType} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effecttype">ID3D10EffectType</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effecttype">ID3D10EffectType Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttype-getmembertypebyname
     */
    GetMemberTypeByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(3, this, "ptr", Name, ID3D10EffectType)
        return result
    }

    /**
     * Get a member type by semantic.
     * @param {PSTR} Semantic Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * A semantic.
     * @returns {ID3D10EffectType} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effecttype">ID3D10EffectType</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effecttype">ID3D10EffectType Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttype-getmembertypebysemantic
     */
    GetMemberTypeBySemantic(Semantic) {
        Semantic := Semantic is String ? StrPtr(Semantic) : Semantic

        result := ComCall(4, this, "ptr", Semantic, ID3D10EffectType)
        return result
    }

    /**
     * Get the name of a member.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index.
     * @returns {PSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the member.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttype-getmembername
     */
    GetMemberName(Index) {
        result := ComCall(5, this, "uint", Index, PSTR)
        return result
    }

    /**
     * Get the semantic attached to a member.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index.
     * @returns {PSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * A string that contains the semantic.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttype-getmembersemantic
     */
    GetMemberSemantic(Index) {
        result := ComCall(6, this, "uint", Index, PSTR)
        return result
    }

    Query(iid) {
        if (ID3D10EffectType.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }
}
