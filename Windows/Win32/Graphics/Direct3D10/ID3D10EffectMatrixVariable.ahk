#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D10EffectVariable.ahk" { ID3D10EffectVariable }

/**
 * A matrix-variable interface accesses a matrix.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nn-d3d10effect-id3d10effectmatrixvariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10EffectMatrixVariable extends ID3D10EffectVariable {
    /**
     * The interface identifier for ID3D10EffectMatrixVariable
     * @type {Guid}
     */
    static IID := Guid("{50666c24-b82f-4eed-a172-5b6e7e8522e0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10EffectMatrixVariable interfaces
    */
    struct Vtbl extends ID3D10EffectVariable.Vtbl {
        SetMatrix               : IntPtr
        GetMatrix               : IntPtr
        SetMatrixArray          : IntPtr
        GetMatrixArray          : IntPtr
        SetMatrixTranspose      : IntPtr
        GetMatrixTranspose      : IntPtr
        SetMatrixTransposeArray : IntPtr
        GetMatrixTransposeArray : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10EffectMatrixVariable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Set a floating-point matrix.
     * @param {Pointer<Float>} pData Type: <b>float*</b>
     * 
     * A pointer to the first element in the matrix.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectmatrixvariable-setmatrix
     */
    SetMatrix(pData) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(25, this, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * Get a matrix.
     * @param {Pointer<Float>} pData Type: <b>float*</b>
     * 
     * A pointer to the first element in a matrix.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectmatrixvariable-getmatrix
     */
    GetMatrix(pData) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(26, this, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * Set an array of floating-point matrices.
     * @param {Pointer<Float>} pData Type: <b>float*</b>
     * 
     * A pointer to the first matrix.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of matrix elements to skip from the start of the array.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of elements to set.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectmatrixvariable-setmatrixarray
     */
    SetMatrixArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(27, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * Get an array of matrices.
     * @param {Pointer<Float>} pData Type: <b>float*</b>
     * 
     * A pointer to the first element of the first matrix in an array of matrices.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The offset (in number of matrices) between the start of the array and the first matrix returned.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of matrices in the returned array.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectmatrixvariable-getmatrixarray
     */
    GetMatrixArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(28, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * Transpose and set a floating-point matrix.
     * @remarks
     * Transposing a matrix will rearrange the data order from row-column order to column-row order (or vice versa).
     * @param {Pointer<Float>} pData Type: <b>float*</b>
     * 
     * A pointer to the first element of a matrix.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectmatrixvariable-setmatrixtranspose
     */
    SetMatrixTranspose(pData) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(29, this, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * Transpose and get a floating-point matrix.
     * @remarks
     * Transposing a matrix will rearrange the data order from row-column order to column-row order (or vice versa).
     * @param {Pointer<Float>} pData Type: <b>float*</b>
     * 
     * A pointer to the first element of a transposed matrix.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectmatrixvariable-getmatrixtranspose
     */
    GetMatrixTranspose(pData) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(30, this, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * Transpose and set an array of floating-point matrices.
     * @remarks
     * Transposing a matrix will rearrange the data order from row-column order to column-row order (or vice versa).
     * @param {Pointer<Float>} pData Type: <b>float*</b>
     * 
     * A pointer to an array of matrices.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The offset (in number of matrices) between the start of the array and the first matrix to set.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of matrices in the array to set.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectmatrixvariable-setmatrixtransposearray
     */
    SetMatrixTransposeArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(31, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * Transpose and get an array of floating-point matrices.
     * @remarks
     * Transposing a matrix will rearrange the data order from row-column order to column-row order (or vice versa).
     * @param {Pointer<Float>} pData Type: <b>float*</b>
     * 
     * A pointer to the first element of an array of transposed matrices.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The offset (in number of matrices) between the start of the array and the first matrix to get.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of matrices in the array to get.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectmatrixvariable-getmatrixtransposearray
     */
    GetMatrixTransposeArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(32, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D10EffectMatrixVariable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMatrix := CallbackCreate(GetMethod(implObj, "SetMatrix"), flags, 2)
        this.vtbl.GetMatrix := CallbackCreate(GetMethod(implObj, "GetMatrix"), flags, 2)
        this.vtbl.SetMatrixArray := CallbackCreate(GetMethod(implObj, "SetMatrixArray"), flags, 4)
        this.vtbl.GetMatrixArray := CallbackCreate(GetMethod(implObj, "GetMatrixArray"), flags, 4)
        this.vtbl.SetMatrixTranspose := CallbackCreate(GetMethod(implObj, "SetMatrixTranspose"), flags, 2)
        this.vtbl.GetMatrixTranspose := CallbackCreate(GetMethod(implObj, "GetMatrixTranspose"), flags, 2)
        this.vtbl.SetMatrixTransposeArray := CallbackCreate(GetMethod(implObj, "SetMatrixTransposeArray"), flags, 4)
        this.vtbl.GetMatrixTransposeArray := CallbackCreate(GetMethod(implObj, "GetMatrixTransposeArray"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetMatrix)
        CallbackFree(this.vtbl.GetMatrix)
        CallbackFree(this.vtbl.SetMatrixArray)
        CallbackFree(this.vtbl.GetMatrixArray)
        CallbackFree(this.vtbl.SetMatrixTranspose)
        CallbackFree(this.vtbl.GetMatrixTranspose)
        CallbackFree(this.vtbl.SetMatrixTransposeArray)
        CallbackFree(this.vtbl.GetMatrixTransposeArray)
    }
}
