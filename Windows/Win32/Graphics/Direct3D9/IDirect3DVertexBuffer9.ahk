#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DResource9.ahk

/**
 * Applications use the methods of the IDirect3DVertexBuffer9 interface to manipulate vertex buffer resources.
 * @remarks
 * 
 * The <b>IDirect3DVertexBuffer9</b> interface is obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createvertexbuffer">IDirect3DDevice9::CreateVertexBuffer</a> method.
 * 
 * This interface inherits additional functionality from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dresource9">IDirect3DResource9</a> interface.
 * 
 * This interface, like all COM interfaces, inherits from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
 * 
 * The LPDIRECT3DVERTEXBUFFER9 and PDIRECT3DVERTEXBUFFER9 types are defined as pointers to the <b>IDirect3DVertexBuffer9</b> interface.
 *     
 * 
 *     
 * 
 * 
 * ```
 * 
 * typedef struct IDirect3DVertexBuffer9 *LPDIRECT3DVERTEXBUFFER9, *PDIRECT3DVERTEXBUFFER9;
 * 
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nn-d3d9helper-idirect3dvertexbuffer9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3DVertexBuffer9 extends IDirect3DResource9{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3DVertexBuffer9
     * @type {Guid}
     */
    static IID => Guid("{b64bb1b5-fd70-4df6-bf91-19d0a12455e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Lock", "Unlock", "GetDesc"]

    /**
     * 
     * @param {Integer} OffsetToLock 
     * @param {Integer} SizeToLock 
     * @param {Pointer<Pointer<Void>>} ppbData 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvertexbuffer9-lock
     */
    Lock(OffsetToLock, SizeToLock, ppbData, Flags) {
        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "uint", OffsetToLock, "uint", SizeToLock, ppbDataMarshal, ppbData, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvertexbuffer9-unlock
     */
    Unlock() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DVERTEXBUFFER_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvertexbuffer9-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(13, this, "ptr", pDesc, "HRESULT")
        return result
    }
}
