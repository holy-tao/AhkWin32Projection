#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3DVERTEXELEMENT9.ahk" { D3DVERTEXELEMENT9 }
#Import ".\IDirect3DDevice9.ahk" { IDirect3DDevice9 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDirect3DVertexDeclaration9 (d3d9.h) interface is used by applications to encapsulate the vertex shader declaration.
 * @remarks
 * A vertex shader declaration is made up of an array of vertex elements.
 * 
 * The LPDIRECT3DVERTEXDECLARATION9 and PDIRECT3DVERTEXDECLARATION9 types are defined as pointers to the <b>IDirect3DVertexDeclaration9</b> interface.
 *     
 *             
 * 
 * 
 * ```
 * typedef struct IDirect3DVertexDeclaration9 *LPDIRECT3DVERTEXDECLARATION9, *PDIRECT3DVERTEXDECLARATION9;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/d3d9/nn-d3d9-idirect3dvertexdeclaration9
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct IDirect3DVertexDeclaration9 extends IUnknown {
    /**
     * The interface identifier for IDirect3DVertexDeclaration9
     * @type {Guid}
     */
    static IID := Guid("{dd13c59c-36fa-4098-a8fb-c7ed39dc8546}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirect3DVertexDeclaration9 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDevice      : IntPtr
        GetDeclaration : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirect3DVertexDeclaration9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IDirect3DVertexDeclaration9::GetDevice (d3d9.h) method gets the current device.
     * @returns {IDirect3DDevice9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a>**</b>
     * 
     * Pointer to the IDirect3DDevice9 interface that is returned.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvertexdeclaration9-getdevice
     */
    GetDevice() {
        result := ComCall(3, this, "ptr*", &ppDevice := 0, "HRESULT")
        return IDirect3DDevice9(ppDevice)
    }

    /**
     * The IDirect3DVertexDeclaration9::GetDeclaration (d3d9.h) method gets the vertex shader declaration.
     * @remarks
     * The number of elements, pNumElements, includes the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddecl-end">D3DDECL_END</a> macro, which ends the declaration. So the element count is actually one higher than the number of valid vertex elements.
     * 
     * Here's an example that will return the vertex declaration array of up to 256 elements:
     * 
     * 
     * ```
     *  
     * D3DVERTEXELEMENT9 decl[MAXD3DDECLLENGTH];
     * UINT numElements;
     * HRESULT hr = m_pVertexDeclaration->GetDeclaration( decl, &numElements);
     * 
     * ```
     * 
     * 
     * Specify <b>NULL</b> for pDeclto get the number of elements in the declaration.
     * @param {Pointer<D3DVERTEXELEMENT9>} pElement Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dvertexelement9">D3DVERTEXELEMENT9</a>*</b>
     * 
     * Array of vertex elements (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dvertexelement9">D3DVERTEXELEMENT9</a>) that make up a vertex shader declaration. The application needs to allocate enough room for this. The vertex element array ends with the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddecl-end">D3DDECL_END</a> macro.
     * @param {Pointer<Integer>} pNumElements Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Number of elements in the array. The application needs to allocate enough room for this.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be:
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvertexdeclaration9-getdeclaration
     */
    GetDeclaration(pElement, pNumElements) {
        pNumElementsMarshal := pNumElements is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, D3DVERTEXELEMENT9.Ptr, pElement, pNumElementsMarshal, pNumElements, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirect3DVertexDeclaration9.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDevice := CallbackCreate(GetMethod(implObj, "GetDevice"), flags, 2)
        this.vtbl.GetDeclaration := CallbackCreate(GetMethod(implObj, "GetDeclaration"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDevice)
        CallbackFree(this.vtbl.GetDeclaration)
    }
}
