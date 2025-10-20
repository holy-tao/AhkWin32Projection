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
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttype-isvalid
     */
    IsValid() {
        result := ComCall(0, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D10_EFFECT_TYPE_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttype-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(1, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ID3D10EffectType} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttype-getmembertypebyindex
     */
    GetMemberTypeByIndex(Index) {
        result := ComCall(2, this, "uint", Index, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {ID3D10EffectType} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttype-getmembertypebyname
     */
    GetMemberTypeByName(Name) {
        result := ComCall(3, this, "ptr", Name, "ptr")
        return result
    }

    /**
     * 
     * @param {PSTR} Semantic 
     * @returns {ID3D10EffectType} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttype-getmembertypebysemantic
     */
    GetMemberTypeBySemantic(Semantic) {
        result := ComCall(4, this, "ptr", Semantic, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {PSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttype-getmembername
     */
    GetMemberName(Index) {
        result := ComCall(5, this, "uint", Index, "char*")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {PSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effecttype-getmembersemantic
     */
    GetMemberSemantic(Index) {
        result := ComCall(6, this, "uint", Index, "char*")
        return result
    }
}
