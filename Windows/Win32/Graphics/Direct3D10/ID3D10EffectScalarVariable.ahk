#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D10EffectVariable.ahk" { ID3D10EffectVariable }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * An effect-scalar-variable interface accesses scalar values.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nn-d3d10effect-id3d10effectscalarvariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10EffectScalarVariable extends ID3D10EffectVariable {
    /**
     * The interface identifier for ID3D10EffectScalarVariable
     * @type {Guid}
     */
    static IID := Guid("{00e48f7b-d2c8-49e8-a86c-022dee53431f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10EffectScalarVariable interfaces
    */
    struct Vtbl extends ID3D10EffectVariable.Vtbl {
        SetFloat      : IntPtr
        GetFloat      : IntPtr
        SetFloatArray : IntPtr
        GetFloatArray : IntPtr
        SetInt        : IntPtr
        GetInt        : IntPtr
        SetIntArray   : IntPtr
        GetIntArray   : IntPtr
        SetBool       : IntPtr
        GetBool       : IntPtr
        SetBoolArray  : IntPtr
        GetBoolArray  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10EffectScalarVariable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Set a floating-point variable.
     * @param {Float} Value Type: <b>float</b>
     * 
     * A pointer to the variable.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-setfloat
     */
    SetFloat(Value) {
        result := ComCall(25, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * Get a floating-point variable.
     * @returns {Float} Type: <b>float*</b>
     * 
     * A pointer to the variable.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-getfloat
     */
    GetFloat() {
        result := ComCall(26, this, "float*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Set an array of floating-point variables.
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-setfloatarray
     */
    SetFloatArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "float*" : "ptr"

        result := ComCall(27, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * Get an array of floating-point variables.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Must be set to 0; this is reserved for future use.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of array elements to set.
     * @returns {Float} Type: <b>float*</b>
     * 
     * A pointer to the start of the data to set.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-getfloatarray
     */
    GetFloatArray(Offset, Count) {
        result := ComCall(28, this, "float*", &pData := 0, "uint", Offset, "uint", Count, "HRESULT")
        return pData
    }

    /**
     * Set an integer variable.
     * @param {Integer} Value Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">int</a></b>
     * 
     * A pointer to the variable.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-setint
     */
    SetInt(Value) {
        result := ComCall(29, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Get an integer variable.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">int</a>*</b>
     * 
     * A pointer to the variable.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-getint
     */
    GetInt() {
        result := ComCall(30, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Set an array of integer variables.
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-setintarray
     */
    SetIntArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "int*" : "ptr"

        result := ComCall(31, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * Get an array of integer variables.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Must be set to 0; this is reserved for future use.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of array elements to set.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">int</a>*</b>
     * 
     * A pointer to the start of the data to set.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-getintarray
     */
    GetIntArray(Offset, Count) {
        result := ComCall(32, this, "int*", &pData := 0, "uint", Offset, "uint", Count, "HRESULT")
        return pData
    }

    /**
     * Set a boolean variable.
     * @param {BOOL} Value Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * A pointer to the variable.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-setbool
     */
    SetBool(Value) {
        result := ComCall(33, this, BOOL, Value, "HRESULT")
        return result
    }

    /**
     * Get a boolean variable.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * A pointer to the variable.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-getbool
     */
    GetBool() {
        result := ComCall(34, this, BOOL.Ptr, &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Set an array of boolean variables.
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-setboolarray
     */
    SetBoolArray(pData, Offset, Count) {
        pDataMarshal := pData is VarRef ? "int*" : "ptr"

        result := ComCall(35, this, pDataMarshal, pData, "uint", Offset, "uint", Count, "HRESULT")
        return result
    }

    /**
     * Get an array of boolean variables.
     * @param {Integer} Offset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Must be set to 0; this is reserved for future use.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of array elements to set.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * A pointer to the start of the data to set.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectscalarvariable-getboolarray
     */
    GetBoolArray(Offset, Count) {
        result := ComCall(36, this, BOOL.Ptr, &pData := 0, "uint", Offset, "uint", Count, "HRESULT")
        return pData
    }

    Query(iid) {
        if (ID3D10EffectScalarVariable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetFloat := CallbackCreate(GetMethod(implObj, "SetFloat"), flags, 2)
        this.vtbl.GetFloat := CallbackCreate(GetMethod(implObj, "GetFloat"), flags, 2)
        this.vtbl.SetFloatArray := CallbackCreate(GetMethod(implObj, "SetFloatArray"), flags, 4)
        this.vtbl.GetFloatArray := CallbackCreate(GetMethod(implObj, "GetFloatArray"), flags, 4)
        this.vtbl.SetInt := CallbackCreate(GetMethod(implObj, "SetInt"), flags, 2)
        this.vtbl.GetInt := CallbackCreate(GetMethod(implObj, "GetInt"), flags, 2)
        this.vtbl.SetIntArray := CallbackCreate(GetMethod(implObj, "SetIntArray"), flags, 4)
        this.vtbl.GetIntArray := CallbackCreate(GetMethod(implObj, "GetIntArray"), flags, 4)
        this.vtbl.SetBool := CallbackCreate(GetMethod(implObj, "SetBool"), flags, 2)
        this.vtbl.GetBool := CallbackCreate(GetMethod(implObj, "GetBool"), flags, 2)
        this.vtbl.SetBoolArray := CallbackCreate(GetMethod(implObj, "SetBoolArray"), flags, 4)
        this.vtbl.GetBoolArray := CallbackCreate(GetMethod(implObj, "GetBoolArray"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetFloat)
        CallbackFree(this.vtbl.GetFloat)
        CallbackFree(this.vtbl.SetFloatArray)
        CallbackFree(this.vtbl.GetFloatArray)
        CallbackFree(this.vtbl.SetInt)
        CallbackFree(this.vtbl.GetInt)
        CallbackFree(this.vtbl.SetIntArray)
        CallbackFree(this.vtbl.GetIntArray)
        CallbackFree(this.vtbl.SetBool)
        CallbackFree(this.vtbl.GetBool)
        CallbackFree(this.vtbl.SetBoolArray)
        CallbackFree(this.vtbl.GetBoolArray)
    }
}
