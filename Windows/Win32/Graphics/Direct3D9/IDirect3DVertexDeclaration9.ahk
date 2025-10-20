#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IDirect3DDevice9>} ppDevice 
     * @returns {HRESULT} 
     */
    GetDevice(ppDevice) {
        result := ComCall(3, this, "ptr", ppDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3DVERTEXELEMENT9>} pElement 
     * @param {Pointer<UInt32>} pNumElements 
     * @returns {HRESULT} 
     */
    GetDeclaration(pElement, pNumElements) {
        result := ComCall(4, this, "ptr", pElement, "uint*", pNumElements, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
