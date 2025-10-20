#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DResource9.ahk

/**
 * Applications use the methods of the IDirect3DIndexBuffer9 interface to manipulate an index buffer resource.
 * @remarks
 * 
  * The <b>IDirect3DIndexBuffer9</b> interface is obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createindexbuffer">IDirect3DDevice9::CreateIndexBuffer</a> method.
  * 
  * This interface inherits additional functionality from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dresource9">IDirect3DResource9</a> interface.
  * 
  * This interface, like all COM interfaces, inherits from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
  * 
  * The LPDIRECT3DINDEXBUFFER9 and PDIRECT3DINDEXBUFFER9 types are defined as pointers to the <b>IDirect3DIndexBuffer9</b> interface. 
  * 
  * 
  * ```
  * 
  * typedef struct IDirect3DIndexBuffer9 *LPDIRECT3DINDEXBUFFER9, *PDIRECT3DINDEXBUFFER9;
  * 
  * ```
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nn-d3d9helper-idirect3dindexbuffer9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3DIndexBuffer9 extends IDirect3DResource9{
    /**
     * The interface identifier for IDirect3DIndexBuffer9
     * @type {Guid}
     */
    static IID => Guid("{7c9dd65e-d3f7-4529-acee-785830acde35}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * 
     * @param {Integer} OffsetToLock 
     * @param {Integer} SizeToLock 
     * @param {Pointer<Void>} ppbData 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    Lock(OffsetToLock, SizeToLock, ppbData, Flags) {
        result := ComCall(11, this, "uint", OffsetToLock, "uint", SizeToLock, "ptr", ppbData, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unlock() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3DINDEXBUFFER_DESC>} pDesc 
     * @returns {HRESULT} 
     */
    GetDesc(pDesc) {
        result := ComCall(13, this, "ptr", pDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
