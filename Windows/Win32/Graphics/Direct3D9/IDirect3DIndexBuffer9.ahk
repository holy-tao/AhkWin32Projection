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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Lock", "Unlock", "GetDesc"]

    /**
     * Locks a range of index data and obtains a pointer to the index buffer memory.
     * @param {Integer} OffsetToLock Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset into the index data to lock, in bytes. Lock the entire index buffer by specifying 0 for both parameters, SizeToLock and OffsetToLock.
     * @param {Integer} SizeToLock Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the index data to lock, in bytes. Lock the entire index buffer by specifying 0 for both parameters, SizeToLock and OffsetToLock.
     * @param {Pointer<Pointer<Void>>} ppbData Type: <b>VOID**</b>
     * 
     * VOID* pointer to a memory buffer containing the returned index data.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Combination of zero or more locking flags that describe the type of lock to perform. For this method, the valid flags are: 
     *     
     * 
     * 
     * <ul>
     * <li>D3DLOCK_DISCARD</li>
     * <li>D3DLOCK_NO_DIRTY_UPDATE</li>
     * <li>D3DLOCK_NOSYSLOCK</li>
     * <li>D3DLOCK_READONLY</li>
     * <li>D3DLOCK_NOOVERWRITE</li>
     * </ul>
     * For a description of the flags, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlock">D3DLOCK</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dindexbuffer9-lock
     */
    Lock(OffsetToLock, SizeToLock, ppbData, Flags) {
        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "uint", OffsetToLock, "uint", SizeToLock, ppbDataMarshal, ppbData, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * Unlocks index data.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dindexbuffer9-unlock
     */
    Unlock() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a description of the index buffer resource.
     * @param {Pointer<D3DINDEXBUFFER_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dindexbuffer-desc">D3DINDEXBUFFER_DESC</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dindexbuffer-desc">D3DINDEXBUFFER_DESC</a> structure, describing the returned index buffer.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL is returned if the argument is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dindexbuffer9-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(13, this, "ptr", pDesc, "HRESULT")
        return result
    }
}
