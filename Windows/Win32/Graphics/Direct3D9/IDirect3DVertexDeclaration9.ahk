#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DDevice9.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications use the methods of the IDirect3DVertexDeclaration9 interface to encapsulate the vertex shader declaration.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nn-d3d9helper-idirect3dvertexdeclaration9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3DVertexDeclaration9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3DVertexDeclaration9
     * @type {Guid}
     */
    static IID => Guid("{dd13c59c-36fa-4098-a8fb-c7ed39dc8546}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDevice", "GetDeclaration"]

    /**
     * Gets the current device.
     * @returns {IDirect3DDevice9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a>**</b>
     * 
     * Pointer to the IDirect3DDevice9 interface that is returned.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dvertexdeclaration9-getdevice
     */
    GetDevice() {
        result := ComCall(3, this, "ptr*", &ppDevice := 0, "HRESULT")
        return IDirect3DDevice9(ppDevice)
    }

    /**
     * Gets the vertex shader declaration.
     * @param {Pointer<D3DVERTEXELEMENT9>} pElement Type: [in, out] <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dvertexelement9">D3DVERTEXELEMENT9</a>*</b>
     * 
     * Array of vertex elements (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dvertexelement9">D3DVERTEXELEMENT9</a>) that make up a vertex shader declaration. The application needs to allocate enough room for this. The vertex element array ends with the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddecl-end">D3DDECL_END</a> macro.
     * @param {Pointer<Integer>} pNumElements Type: [out] <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Number of elements in the array. The application needs to allocate enough room for this.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dvertexdeclaration9-getdeclaration
     */
    GetDeclaration(pElement, pNumElements) {
        pNumElementsMarshal := pNumElements is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pElement, pNumElementsMarshal, pNumElements, "HRESULT")
        return result
    }
}
