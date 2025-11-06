#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10EffectVariable.ahk

/**
 * A vector-variable interface accesses a four-component vector.
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nn-d3d10effect-id3d10effectvectorvariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10EffectVectorVariable extends ID3D10EffectVariable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10EffectVectorVariable
     * @type {Guid}
     */
    static IID => Guid("{62b98c44-1f82-4c67-bcd0-72cf8f217e81}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBoolVector", "SetIntVector", "SetFloatVector", "GetBoolVector", "GetIntVector", "GetFloatVector", "SetBoolVectorArray", "SetIntVectorArray", "SetFloatVectorArray", "GetBoolVectorArray", "GetIntVectorArray", "GetFloatVectorArray"]

    /**
     * 
     * @param {Pointer<BOOL>} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-setboolvector
     */
    SetBoolVector(pData) {
        pDataMarshal := pData is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-setintvector
     */
    SetIntVector(pData) {
        pDataMarshal := pData is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-setfloatvector
     */
    SetFloatVector(pData) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(27, this, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-getboolvector
     */
    GetBoolVector(pData) {
        pDataMarshal := pData is VarRef ? "int*" : "ptr"

        result := ComCall(28, this, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-getintvector
     */
    GetIntVector(pData) {
        pDataMarshal := pData is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-getfloatvector
     */
    GetFloatVector(pData) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(30, this, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-setboolvectorarray
     */
    SetBoolVectorArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "int*" : "ptr"

        result := ComCall(31, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-setintvectorarray
     */
    SetIntVectorArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "int*" : "ptr"

        result := ComCall(32, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-setfloatvectorarray
     */
    SetFloatVectorArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(33, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-getboolvectorarray
     */
    GetBoolVectorArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-getintvectorarray
     */
    GetIntVectorArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "int*" : "ptr"

        result := ComCall(35, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-getfloatvectorarray
     */
    GetFloatVectorArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(36, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }
}
