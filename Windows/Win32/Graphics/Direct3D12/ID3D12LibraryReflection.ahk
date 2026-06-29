#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_LIBRARY_DESC.ahk" { D3D12_LIBRARY_DESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ID3D12FunctionReflection.ahk" { ID3D12FunctionReflection }

/**
 * A library-reflection interface accesses library info. (ID3D12LibraryReflection)
 * @remarks
 * To get a library-reflection interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3dcompiler/nf-d3dcompiler-d3dreflectlibrary">D3DReflectLibrary</a>.
 *       
 * 
 * <div class="alert"><b>Note</b>  <b>ID3D12LibraryReflection</b> requires the D3dcompiler_47.dll or a later version of the DLL.
 *       </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nn-d3d12shader-id3d12libraryreflection
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12LibraryReflection extends IUnknown {
    /**
     * The interface identifier for ID3D12LibraryReflection
     * @type {Guid}
     */
    static IID := Guid("{8e349d19-54db-4a56-9dc9-119d87bdb804}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12LibraryReflection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDesc            : IntPtr
        GetFunctionByIndex : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12LibraryReflection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Fills the library descriptor structure for the library reflection. (ID3D12LibraryReflection.GetDesc)
     * @returns {D3D12_LIBRARY_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/ns-d3d12shader-d3d12_library_desc">D3D12_LIBRARY_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/ns-d3d12shader-d3d12_library_desc">D3D12_LIBRARY_DESC</a> structure that receives a description of the library reflection.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12libraryreflection-getdesc
     */
    GetDesc() {
        pDesc := D3D12_LIBRARY_DESC()
        result := ComCall(3, this, D3D12_LIBRARY_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    /**
     * The ID3D12LibraryReflection::GetFunctionByIndex method (d3d12shader.h) gets the function reflector.
     * @param {Integer} FunctionIndex Type: <b>INT</b>
     * 
     * The zero-based index of the function reflector to retrieve.
     * @returns {ID3D12FunctionReflection} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12functionreflection">ID3D12FunctionReflection</a>*</b>
     * 
     * The function reflector, as a pointer to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12shader/nn-d3d12shader-id3d12functionreflection">ID3D12FunctionReflection</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12shader/nf-d3d12shader-id3d12libraryreflection-getfunctionbyindex
     */
    GetFunctionByIndex(FunctionIndex) {
        result := ComCall(4, this, "int", FunctionIndex, ID3D12FunctionReflection)
        return result
    }

    Query(iid) {
        if (ID3D12LibraryReflection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesc := CallbackCreate(GetMethod(implObj, "GetDesc"), flags, 2)
        this.vtbl.GetFunctionByIndex := CallbackCreate(GetMethod(implObj, "GetFunctionByIndex"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesc)
        CallbackFree(this.vtbl.GetFunctionByIndex)
    }
}
