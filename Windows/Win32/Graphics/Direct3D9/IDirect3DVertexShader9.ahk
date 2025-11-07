#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DDevice9.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications use the methods of the IDirect3DVertexShader9 interface to encapsulate the functionality of a vertex shader.
 * @remarks
 * 
 * The LPDIRECT3DVERTEXSHADER9 and PDIRECT3DVERTEXSHADER9 types are defined as pointers to the <b>IDirect3DVertexShader9</b> interface.
 *     
 *             
 * 
 * 
 * ```
 * typedef struct IDirect3DVertexShader9 *LPDIRECT3DVERTEXSHADER9, *PDIRECT3DVERTEXSHADER9;
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nn-d3d9helper-idirect3dvertexshader9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3DVertexShader9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3DVertexShader9
     * @type {Guid}
     */
    static IID => Guid("{efc5557e-6265-4613-8a94-43857889eb36}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDevice", "GetFunction"]

    /**
     * 
     * @returns {IDirect3DDevice9} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvertexshader9-getdevice
     */
    GetDevice() {
        result := ComCall(3, this, "ptr*", &ppDevice := 0, "HRESULT")
        return IDirect3DDevice9(ppDevice)
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Pointer<Integer>} pSizeOfData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvertexshader9-getfunction
     */
    GetFunction(param0, pSizeOfData) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        pSizeOfDataMarshal := pSizeOfData is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, param0Marshal, param0, pSizeOfDataMarshal, pSizeOfData, "HRESULT")
        return result
    }
}
