#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDirect3DDevice9.ahk" { IDirect3DDevice9 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDirect3DVertexShader9 (d3d9.h) interface is used by applications to encapsulate the functionality of a vertex shader.
 * @remarks
 * The LPDIRECT3DVERTEXSHADER9 and PDIRECT3DVERTEXSHADER9 types are defined as pointers to the <b>IDirect3DVertexShader9</b> interface.
 *     
 *             
 * 
 * 
 * ```
 * typedef struct IDirect3DVertexShader9 *LPDIRECT3DVERTEXSHADER9, *PDIRECT3DVERTEXSHADER9;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/d3d9/nn-d3d9-idirect3dvertexshader9
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct IDirect3DVertexShader9 extends IUnknown {
    /**
     * The interface identifier for IDirect3DVertexShader9
     * @type {Guid}
     */
    static IID := Guid("{efc5557e-6265-4613-8a94-43857889eb36}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirect3DVertexShader9 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDevice   : IntPtr
        GetFunction : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirect3DVertexShader9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IDirect3DVertexShader9::GetDevice (d3d9.h) method gets the device.
     * @returns {IDirect3DDevice9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a>**</b>
     * 
     * Pointer to the IDirect3DDevice9 interface that is returned.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvertexshader9-getdevice
     */
    GetDevice() {
        result := ComCall(3, this, "ptr*", &ppDevice := 0, "HRESULT")
        return IDirect3DDevice9(ppDevice)
    }

    /**
     * The IDirect3DVertexShader9::GetFunction (d3d9.h) method gets a pointer to the shader data.
     * @param {Pointer<Void>} param0 
     * @param {Pointer<Integer>} pSizeOfData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Size of the data, in bytes. To get the buffer size that is needed to retrieve the data, set pData = <b>NULL</b> when calling GetFunction. Then call GetFunction with the returned size, to get the buffer data.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvertexshader9-getfunction
     */
    GetFunction(param0, pSizeOfData) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        pSizeOfDataMarshal := pSizeOfData is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, param0Marshal, param0, pSizeOfDataMarshal, pSizeOfData, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirect3DVertexShader9.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDevice := CallbackCreate(GetMethod(implObj, "GetDevice"), flags, 2)
        this.vtbl.GetFunction := CallbackCreate(GetMethod(implObj, "GetFunction"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDevice)
        CallbackFree(this.vtbl.GetFunction)
    }
}
