#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D10EffectVariable.ahk" { ID3D10EffectVariable }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * A vector-variable interface accesses a four-component vector.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nn-d3d10effect-id3d10effectvectorvariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10EffectVectorVariable extends ID3D10EffectVariable {
    /**
     * The interface identifier for ID3D10EffectVectorVariable
     * @type {Guid}
     */
    static IID := Guid("{62b98c44-1f82-4c67-bcd0-72cf8f217e81}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10EffectVectorVariable interfaces
    */
    struct Vtbl extends ID3D10EffectVariable.Vtbl {
        SetBoolVector       : IntPtr
        SetIntVector        : IntPtr
        SetFloatVector      : IntPtr
        GetBoolVector       : IntPtr
        GetIntVector        : IntPtr
        GetFloatVector      : IntPtr
        SetBoolVectorArray  : IntPtr
        SetIntVectorArray   : IntPtr
        SetFloatVectorArray : IntPtr
        GetBoolVectorArray  : IntPtr
        GetIntVectorArray   : IntPtr
        GetFloatVectorArray : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10EffectVectorVariable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Set a four-component vector that contains boolean data.
     * @param {Pointer<BOOL>} pData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * A pointer to the first component.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-setboolvector
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-setintvector
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-setfloatvector
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-getboolvector
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-getintvector
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-getfloatvector
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-setboolvectorarray
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-setintvectorarray
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-setfloatvectorarray
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-getboolvectorarray
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-getintvectorarray
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectvectorvariable-getfloatvectorarray
     */
    GetFloatVectorArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(36, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D10EffectVectorVariable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetBoolVector := CallbackCreate(GetMethod(implObj, "SetBoolVector"), flags, 2)
        this.vtbl.SetIntVector := CallbackCreate(GetMethod(implObj, "SetIntVector"), flags, 2)
        this.vtbl.SetFloatVector := CallbackCreate(GetMethod(implObj, "SetFloatVector"), flags, 2)
        this.vtbl.GetBoolVector := CallbackCreate(GetMethod(implObj, "GetBoolVector"), flags, 2)
        this.vtbl.GetIntVector := CallbackCreate(GetMethod(implObj, "GetIntVector"), flags, 2)
        this.vtbl.GetFloatVector := CallbackCreate(GetMethod(implObj, "GetFloatVector"), flags, 2)
        this.vtbl.SetBoolVectorArray := CallbackCreate(GetMethod(implObj, "SetBoolVectorArray"), flags, 4)
        this.vtbl.SetIntVectorArray := CallbackCreate(GetMethod(implObj, "SetIntVectorArray"), flags, 4)
        this.vtbl.SetFloatVectorArray := CallbackCreate(GetMethod(implObj, "SetFloatVectorArray"), flags, 4)
        this.vtbl.GetBoolVectorArray := CallbackCreate(GetMethod(implObj, "GetBoolVectorArray"), flags, 4)
        this.vtbl.GetIntVectorArray := CallbackCreate(GetMethod(implObj, "GetIntVectorArray"), flags, 4)
        this.vtbl.GetFloatVectorArray := CallbackCreate(GetMethod(implObj, "GetFloatVectorArray"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetBoolVector)
        CallbackFree(this.vtbl.SetIntVector)
        CallbackFree(this.vtbl.SetFloatVector)
        CallbackFree(this.vtbl.GetBoolVector)
        CallbackFree(this.vtbl.GetIntVector)
        CallbackFree(this.vtbl.GetFloatVector)
        CallbackFree(this.vtbl.SetBoolVectorArray)
        CallbackFree(this.vtbl.SetIntVectorArray)
        CallbackFree(this.vtbl.SetFloatVectorArray)
        CallbackFree(this.vtbl.GetBoolVectorArray)
        CallbackFree(this.vtbl.GetIntVectorArray)
        CallbackFree(this.vtbl.GetFloatVectorArray)
    }
}
