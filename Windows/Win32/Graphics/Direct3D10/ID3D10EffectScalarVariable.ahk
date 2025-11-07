#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10EffectVariable.ahk

/**
 * An effect-scalar-variable interface accesses scalar values.
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nn-d3d10effect-id3d10effectscalarvariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10EffectScalarVariable extends ID3D10EffectVariable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10EffectScalarVariable
     * @type {Guid}
     */
    static IID => Guid("{00e48f7b-d2c8-49e8-a86c-022dee53431f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFloat", "GetFloat", "SetFloatArray", "GetFloatArray", "SetInt", "GetInt", "SetIntArray", "GetIntArray", "SetBool", "GetBool", "SetBoolArray", "GetBoolArray"]

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-setfloat
     */
    SetFloat(Value) {
        result := ComCall(25, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-getfloat
     */
    GetFloat() {
        result := ComCall(26, this, "float*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Pointer<Float>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-setfloatarray
     */
    SetFloatArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(27, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-getfloatarray
     */
    GetFloatArray(Offset, Count) {
        result := ComCall(28, this, "float*", &pData := 0, "uint", Offset, "uint", Count, "HRESULT")
        return pData
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-setint
     */
    SetInt(Value) {
        result := ComCall(29, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-getint
     */
    GetInt() {
        result := ComCall(30, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Pointer<Integer>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-setintarray
     */
    SetIntArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "int*" : "ptr"

        result := ComCall(31, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-getintarray
     */
    GetIntArray(Offset, Count) {
        result := ComCall(32, this, "int*", &pData := 0, "uint", Offset, "uint", Count, "HRESULT")
        return pData
    }

    /**
     * 
     * @param {BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-setbool
     */
    SetBool(Value) {
        result := ComCall(33, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-getbool
     */
    GetBool() {
        result := ComCall(34, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Pointer<BOOL>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-setboolarray
     */
    SetBoolArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "int*" : "ptr"

        result := ComCall(35, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-getboolarray
     */
    GetBoolArray(Offset, Count) {
        result := ComCall(36, this, "int*", &pData := 0, "uint", Offset, "uint", Count, "HRESULT")
        return pData
    }
}
