#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DDevice9.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications use the methods of the IDirect3DVolume9 interface to manipulate volume resources.
 * @remarks
 * 
 * The <b>IDirect3DVolume9</b> interface is obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dvolumetexture9-getvolumelevel">IDirect3DVolumeTexture9::GetVolumeLevel</a> method.
 * 
 * This interface, like all COM interfaces, inherits from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
 * 
 * The LPDIRECT3DVOLUME9 and PDIRECT3DVOLUME9 types are defined as pointers to the <b>IDirect3DVolume9</b> interface.
 *     
 * 
 *     
 * 
 * 
 * ```
 * 
 * typedef struct IDirect3DVolume9 *LPDIRECT3DVOLUME9, *PDIRECT3DVOLUME9;
 * 
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nn-d3d9helper-idirect3dvolume9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3DVolume9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3DVolume9
     * @type {Guid}
     */
    static IID => Guid("{24f416e6-1f67-4aa7-b88e-d33f6f3128a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDevice", "SetPrivateData", "GetPrivateData", "FreePrivateData", "GetContainer", "GetDesc", "LockBox", "UnlockBox"]

    /**
     * Retrieves the device associated with a volume.
     * @returns {IDirect3DDevice9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a> interface to fill with the device pointer, if the query succeeds.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dvolume9-getdevice
     */
    GetDevice() {
        result := ComCall(3, this, "ptr*", &ppDevice := 0, "HRESULT")
        return IDirect3DDevice9(ppDevice)
    }

    /**
     * Associates data with the volume that is intended for use by the application, not by Direct3D.
     * @param {Pointer<Guid>} refguid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * Reference to the globally unique identifier that identifies the private data to set.
     * @param {Pointer<Void>} pData Type: <b>const void*</b>
     * 
     * Pointer to a buffer that contains the data to associate with the volume.
     * @param {Integer} SizeOfData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Size of the buffer at pData in bytes.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Value that describes the type of data being passed, or indicates to the application that the data should be invalidated when the resource changes. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Item</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="_none_"></a><a id="_NONE_"></a>(none)
     * 
     * </td>
     * <td width="60%">
     * If no flags are specified, Direct3D allocates memory to hold the data within the buffer and copies the data into the new buffer. The buffer allocated by Direct3D is automatically freed, as appropriate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="D3DSPD_IUNKNOWN"></a><a id="d3dspd_iunknown"></a>D3DSPD_IUNKNOWN
     * 
     * </td>
     * <td width="60%">
     * The data at pData is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. SizeOfData must be set to the size of a pointer to an <b>IUnknown</b> interface, sizeof(IUnknown*). Direct3D automatically calls <b>IUnknown</b> through pData and IUnknown when the private data is destroyed. Private data will be destroyed by a subsequent call to <b>IDirect3DVolume9::SetPrivateData</b> with the same GUID, a subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dvolume9-freeprivatedata">IDirect3DVolume9::FreePrivateData</a>, or when the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3d9">IDirect3D9</a> object is released. For more information, see Remarks.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be one of the following: D3DERR_INVALIDCALL, E_OUTOFMEMORY.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dvolume9-setprivatedata
     */
    SetPrivateData(refguid, pData, SizeOfData, Flags) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", refguid, pDataMarshal, pData, "uint", SizeOfData, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * Copies the private data associated with the volume to a provided buffer.
     * @param {Pointer<Guid>} refguid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * Reference to (C++) or address of (C) the globally unique identifier that identifies the private data to retrieve.
     * @param {Pointer<Void>} pData Type: <b>void*</b>
     * 
     * Pointer to a previously allocated buffer to fill with the requested private data if the call succeeds. The application calling this method is responsible for allocating and releasing this buffer. If this parameter is <b>NULL</b>, this method will return the buffer size in pSizeOfData.
     * @param {Pointer<Integer>} pSizeOfData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Pointer to the size of the buffer at 
     *     pData, in bytes. If this value is less than the actual size of the private data, such as 0, the method sets this parameter to the required buffer size, and the method returns D3DERR_MOREDATA.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be one of the following: D3DERR_INVALIDCALL, D3DERR_MOREDATA, D3DERR_NOTFOUND.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dvolume9-getprivatedata
     */
    GetPrivateData(refguid, pData, pSizeOfData) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"
        pSizeOfDataMarshal := pSizeOfData is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", refguid, pDataMarshal, pData, pSizeOfDataMarshal, pSizeOfData, "HRESULT")
        return result
    }

    /**
     * Frees the specified private data associated with this volume.
     * @param {Pointer<Guid>} refguid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * Reference to the globally unique identifier that identifies the private data to free.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be one of the following: D3DERR_INVALIDCALL, D3DERR_NOTFOUND.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dvolume9-freeprivatedata
     */
    FreePrivateData(refguid) {
        result := ComCall(6, this, "ptr", refguid, "HRESULT")
        return result
    }

    /**
     * Provides access to the parent volume texture object, if this surface is a child level of a volume texture.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference identifier of the volume being requested.
     * @param {Pointer<Pointer<Void>>} ppContainer Type: <b>void**</b>
     * 
     * Address of a pointer to fill with the container pointer, if the query succeeds.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dvolume9-getcontainer
     */
    GetContainer(riid, ppContainer) {
        ppContainerMarshal := ppContainer is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", riid, ppContainerMarshal, ppContainer, "HRESULT")
        return result
    }

    /**
     * Retrieves a description of the volume.
     * @param {Pointer<D3DVOLUME_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dvolume-desc">D3DVOLUME_DESC</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dvolume-desc">D3DVOLUME_DESC</a> structure, describing the volume.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL is returned if the argument is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dvolume9-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(8, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * Locks a box on a volume resource.
     * @param {Pointer<D3DLOCKED_BOX>} pLockedVolume Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlocked-box">D3DLOCKED_BOX</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlocked-box">D3DLOCKED_BOX</a> structure, describing the locked region.
     * @param {Pointer<D3DBOX>} pBox Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dbox">D3DBOX</a>*</b>
     * 
     * Pointer to a box to lock. Specified by a pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dbox">D3DBOX</a> structure. Specifying <b>NULL</b> for this parameter locks the entire volume.
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
     * </ul>
     * For a description of the flags, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlock">D3DLOCK</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dvolume9-lockbox
     */
    LockBox(pLockedVolume, pBox, Flags) {
        result := ComCall(9, this, "ptr", pLockedVolume, "ptr", pBox, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * Unlocks a box on a volume resource.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dvolume9-unlockbox
     */
    UnlockBox() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
