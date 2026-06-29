#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDirect3DDevice9.ahk" { IDirect3DDevice9 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDirect3DPixelShader9 (d3d9.h) interface applications use the methods of the IDirect3DPixelShader9 interface to encapsulate the functionality of a pixel shader.
 * @remarks
 * The LPDIRECT3DPIXELSHADER9 and PDIRECT3DPIXELSHADER9 types are defined as pointers to the <b>IDirect3DPixelShader9</b> interface.
 *     
 *             
 * 
 * 
 * ```
 * typedef struct IDirect3DPixelShader9 *LPDIRECT3DPIXELSHADER9, *PDIRECT3DPIXELSHADER9;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/d3d9/nn-d3d9-idirect3dpixelshader9
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct IDirect3DPixelShader9 extends IUnknown {
    /**
     * The interface identifier for IDirect3DPixelShader9
     * @type {Guid}
     */
    static IID := Guid("{6d3bdbdc-5b02-4415-b852-ce5e8bccb289}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirect3DPixelShader9 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDevice   : IntPtr
        GetFunction : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirect3DPixelShader9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IDirect3DPixelShader9::GetDevice method (d3d9helper.h) gets the device.
     * @returns {IDirect3DDevice9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a>**</b>
     * 
     * Pointer to the IDirect3DDevice9 interface that is returned.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dpixelshader9-getdevice
     */
    GetDevice() {
        result := ComCall(3, this, "ptr*", &ppDevice := 0, "HRESULT")
        return IDirect3DDevice9(ppDevice)
    }

    /**
     * The IDirect3DPixelShader9::GetFunction method (d3d9helper.h) gets a pointer to the shader data.
     * @param {Pointer<Void>} param0 
     * @param {Pointer<Integer>} pSizeOfData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Size of the data, in bytes. To get the buffer size that is needed to retrieve the data, set pData = <b>NULL</b> when calling GetFunction. Then call GetFunction with the returned size, to get the buffer data.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be:
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dpixelshader9-getfunction
     */
    GetFunction(param0, pSizeOfData) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        pSizeOfDataMarshal := pSizeOfData is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, param0Marshal, param0, pSizeOfDataMarshal, pSizeOfData, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirect3DPixelShader9.IID.Equals(iid)) {
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
