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
     * Set a four-component vector that contains boolean data.
     * @param {Pointer<BOOL>} pData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * A pointer to the first component.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-setboolvector
     */
    SetBoolVector(pData) {
        pDataMarshal := pData is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * Set a four-component vector that contains integer data.
     * @param {Pointer<Integer>} pData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">int</a>*</b>
     * 
     * A pointer to the first component.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-setintvector
     */
    SetIntVector(pData) {
        pDataMarshal := pData is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * Set a four-component vector that contains floating-point data.
     * @param {Pointer<Float>} pData Type: <b>float*</b>
     * 
     * A pointer to the first component.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-setfloatvector
     */
    SetFloatVector(pData) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(27, this, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * Get a four-component vector that contains boolean data.
     * @param {Pointer<BOOL>} pData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * A pointer to the first component.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-getboolvector
     */
    GetBoolVector(pData) {
        pDataMarshal := pData is VarRef ? "int*" : "ptr"

        result := ComCall(28, this, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * Get a four-component vector that contains integer data.
     * @param {Pointer<Integer>} pData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">int</a>*</b>
     * 
     * A pointer to the first component.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-getintvector
     */
    GetIntVector(pData) {
        pDataMarshal := pData is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * Get a four-component vector that contains floating-point data.
     * @param {Pointer<Float>} pData Type: <b>float*</b>
     * 
     * A pointer to the first component.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-getfloatvector
     */
    GetFloatVector(pData) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(30, this, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * Set an array of four-component vectors that contain boolean data.
     * @param {Pointer<BOOL>} pData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * A pointer to the start of the data to set.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Must be set to 0; this is reserved for future use.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of array elements to set.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-setboolvectorarray
     */
    SetBoolVectorArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "int*" : "ptr"

        result := ComCall(31, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * Set an array of four-component vectors that contain integer data.
     * @param {Pointer<Integer>} pData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">int</a>*</b>
     * 
     * A pointer to the start of the data to set.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Must be set to 0; this is reserved for future use.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of array elements to set.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-setintvectorarray
     */
    SetIntVectorArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "int*" : "ptr"

        result := ComCall(32, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * Set an array of four-component vectors that contain floating-point data.
     * @param {Pointer<Float>} pData Type: <b>float*</b>
     * 
     * A pointer to the start of the data to set.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Must be set to 0; this is reserved for future use.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of array elements to set.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-setfloatvectorarray
     */
    SetFloatVectorArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(33, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * Get an array of four-component vectors that contain boolean data.
     * @param {Pointer<BOOL>} pData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * A pointer to the start of the data to set.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Must be set to 0; this is reserved for future use.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of array elements to set.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-getboolvectorarray
     */
    GetBoolVectorArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * Get an array of four-component vectors that contain integer data.
     * @param {Pointer<Integer>} pData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">int</a>*</b>
     * 
     * A pointer to the start of the data to set.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Must be set to 0; this is reserved for future use.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of array elements to set.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-getintvectorarray
     */
    GetIntVectorArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "int*" : "ptr"

        result := ComCall(35, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * Get an array of four-component vectors that contain floating-point data.
     * @param {Pointer<Float>} pData Type: <b>float*</b>
     * 
     * A pointer to the start of the data to set.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Must be set to 0; this is reserved for future use.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of array elements to set.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-getfloatvectorarray
     */
    GetFloatVectorArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(36, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }
}
