#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DVolume9.ahk
#Include .\IDirect3DBaseTexture9.ahk

/**
 * Applications use the methods of the IDirect3DVolumeTexture9 interface to manipulate a volume texture resource.
 * @remarks
 * 
 * The <b>IDirect3DVolumeTexture9</b> interface can be obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createvolumetexture">CreateVolumeTexture</a> method or one of the D3DXCreateVolumeTexture<i>xxx</i> functions.
 * 
 * This interface inherits additional functionality from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dbasetexture9">IDirect3DBaseTexture9</a> interface.
 * 
 * This interface, like all COM interfaces, inherits from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
 * 
 * The LPDIRECT3DVOLUMETEXTURE9 and PDIRECT3DVOLUMETEXTURE9 types are defined as pointers to the <b>IDirect3DVolumeTexture9</b> interface.
 *     
 * 
 *     
 * 
 * 
 * ```
 * 
 * typedef struct IDirect3DVolumeTexture9 *LPDIRECT3DVOLUMETEXTURE9, *PDIRECT3DVOLUMETEXTURE9;
 * 
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nn-d3d9helper-idirect3dvolumetexture9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3DVolumeTexture9 extends IDirect3DBaseTexture9{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3DVolumeTexture9
     * @type {Guid}
     */
    static IID => Guid("{2518526c-e789-4111-a7b9-47ef328d13e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLevelDesc", "GetVolumeLevel", "LockBox", "UnlockBox", "AddDirtyBox"]

    /**
     * Retrieves a level description of a volume texture resource.
     * @param {Integer} Level Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Identifies a level of the volume texture resource. This method returns a volume description for the level specified by this parameter.
     * @param {Pointer<D3DVOLUME_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dvolume-desc">D3DVOLUME_DESC</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dvolume-desc">D3DVOLUME_DESC</a> structure, describing the returned volume texture level.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL is returned if one or more of the arguments are invalid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dvolumetexture9-getleveldesc
     */
    GetLevelDesc(Level, pDesc) {
        result := ComCall(17, this, "uint", Level, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * Retrieves the specified volume texture level.
     * @param {Integer} Level Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Identifies a level of the volume texture resource. This method returns a volume for the level specified by this parameter.
     * @returns {IDirect3DVolume9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvolume9">IDirect3DVolume9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvolume9">IDirect3DVolume9</a> interface, representing the returned volume level.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dvolumetexture9-getvolumelevel
     */
    GetVolumeLevel(Level) {
        result := ComCall(18, this, "uint", Level, "ptr*", &ppVolumeLevel := 0, "HRESULT")
        return IDirect3DVolume9(ppVolumeLevel)
    }

    /**
     * Locks a box on a volume texture resource.
     * @param {Integer} Level Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the level of the volume texture resource to lock.
     * @param {Pointer<D3DLOCKED_BOX>} pLockedVolume Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlocked-box">D3DLOCKED_BOX</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlocked-box">D3DLOCKED_BOX</a> structure, describing the locked region.
     * @param {Pointer<D3DBOX>} pBox Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dbox">D3DBOX</a>*</b>
     * 
     * Pointer to the volume to lock. This parameter is specified by a pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dbox">D3DBOX</a> structure. Specifying <b>NULL</b> for this parameter locks the entire volume level.
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dvolumetexture9-lockbox
     */
    LockBox(Level, pLockedVolume, pBox, Flags) {
        result := ComCall(19, this, "uint", Level, "ptr", pLockedVolume, "ptr", pBox, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * Unlocks a box on a volume texture resource.
     * @param {Integer} Level Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the level of the volume texture resource to unlock.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dvolumetexture9-unlockbox
     */
    UnlockBox(Level) {
        result := ComCall(20, this, "uint", Level, "HRESULT")
        return result
    }

    /**
     * Adds a dirty region to a volume texture resource.
     * @param {Pointer<D3DBOX>} pDirtyBox Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dbox">D3DBOX</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dbox">D3DBOX</a> structure, specifying the dirty region to add. Specifying <b>NULL</b> expands the dirty region to cover the entire volume texture.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dvolumetexture9-adddirtybox
     */
    AddDirtyBox(pDirtyBox) {
        result := ComCall(21, this, "ptr", pDirtyBox, "HRESULT")
        return result
    }
}
