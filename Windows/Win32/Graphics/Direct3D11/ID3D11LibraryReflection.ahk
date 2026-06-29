#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D11FunctionReflection.ahk" { ID3D11FunctionReflection }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\D3D11_LIBRARY_DESC.ahk" { D3D11_LIBRARY_DESC }

/**
 * A library-reflection interface accesses library info. (ID3D11LibraryReflection)
 * @remarks
 * To get a library-reflection interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3dcompiler/nf-d3dcompiler-d3dreflectlibrary">D3DReflectLibrary</a>.
 *       
 * 
 * <div class="alert"><b>Note</b>  <b>ID3D11LibraryReflection</b> requires the D3dcompiler_47.dll or a later version of the DLL.
 *       </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nn-d3d11shader-id3d11libraryreflection
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11LibraryReflection extends IUnknown {
    /**
     * The interface identifier for ID3D11LibraryReflection
     * @type {Guid}
     */
    static IID := Guid("{54384f1b-5b3e-4bb7-ae01-60ba3097cbb6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11LibraryReflection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDesc            : IntPtr
        GetFunctionByIndex : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11LibraryReflection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Fills the library descriptor structure for the library reflection. (ID3D11LibraryReflection.GetDesc)
     * @returns {D3D11_LIBRARY_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_library_desc">D3D11_LIBRARY_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_library_desc">D3D11_LIBRARY_DESC</a> structure that receives a description of the library reflection.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11libraryreflection-getdesc
     */
    GetDesc() {
        pDesc := D3D11_LIBRARY_DESC()
        result := ComCall(3, this, D3D11_LIBRARY_DESC.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    /**
     * The ID3D11LibraryReflection::GetFunctionByIndex (d3d11shader.h) method gets the function reflector.
     * @param {Integer} FunctionIndex Type: <b>INT</b>
     * 
     * The zero-based index of the function reflector to retrieve.
     * @returns {ID3D11FunctionReflection} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11functionreflection">ID3D11FunctionReflection</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11functionreflection">ID3D11FunctionReflection</a> interface that represents the function reflector.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nf-d3d11shader-id3d11libraryreflection-getfunctionbyindex
     */
    GetFunctionByIndex(FunctionIndex) {
        result := ComCall(4, this, "int", FunctionIndex, ID3D11FunctionReflection)
        return result
    }

    Query(iid) {
        if (ID3D11LibraryReflection.IID.Equals(iid)) {
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
