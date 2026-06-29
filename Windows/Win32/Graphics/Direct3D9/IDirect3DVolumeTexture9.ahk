#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3DLOCKED_BOX.ahk" { D3DLOCKED_BOX }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDirect3DVolume9.ahk" { IDirect3DVolume9 }
#Import ".\D3DBOX.ahk" { D3DBOX }
#Import ".\IDirect3DBaseTexture9.ahk" { IDirect3DBaseTexture9 }
#Import ".\D3DVOLUME_DESC.ahk" { D3DVOLUME_DESC }

/**
 * The IDirect3DVolumeTexture9 (d3d9.h) interface is used by applications to manipulate a volume texture resource.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/d3d9/nn-d3d9-idirect3dvolumetexture9
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct IDirect3DVolumeTexture9 extends IDirect3DBaseTexture9 {
    /**
     * The interface identifier for IDirect3DVolumeTexture9
     * @type {Guid}
     */
    static IID := Guid("{2518526c-e789-4111-a7b9-47ef328d13e6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirect3DVolumeTexture9 interfaces
    */
    struct Vtbl extends IDirect3DBaseTexture9.Vtbl {
        GetLevelDesc   : IntPtr
        GetVolumeLevel : IntPtr
        LockBox        : IntPtr
        UnlockBox      : IntPtr
        AddDirtyBox    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirect3DVolumeTexture9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IDirect3DVolumeTexture9::GetLevelDesc (d3d9.h) method retrieves a level description of a volume texture resource.
     * @param {Integer} Level Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Identifies a level of the volume texture resource. This method returns a volume description for the level specified by this parameter.
     * @param {Pointer<D3DVOLUME_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dvolume-desc">D3DVOLUME_DESC</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dvolume-desc">D3DVOLUME_DESC</a> structure, describing the returned volume texture level.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL is returned if one or more of the arguments are invalid.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvolumetexture9-getleveldesc
     */
    GetLevelDesc(Level, pDesc) {
        result := ComCall(17, this, "uint", Level, D3DVOLUME_DESC.Ptr, pDesc, "HRESULT")
        return result
    }

    /**
     * The IDirect3DVolumeTexture9::GetVolumeLevel (d3d9.h) method retrieves the specified volume texture level.
     * @remarks
     * Calling this method will increase the internal reference count on the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvolume9">IDirect3DVolume9</a> interface. Failure to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> when finished using this <b>IDirect3DVolume9</b> interface results in a memory leak.
     * @param {Integer} Level Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Identifies a level of the volume texture resource. This method returns a volume for the level specified by this parameter.
     * @returns {IDirect3DVolume9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvolume9">IDirect3DVolume9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvolume9">IDirect3DVolume9</a> interface, representing the returned volume level.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvolumetexture9-getvolumelevel
     */
    GetVolumeLevel(Level) {
        result := ComCall(18, this, "uint", Level, "ptr*", &ppVolumeLevel := 0, "HRESULT")
        return IDirect3DVolume9(ppVolumeLevel)
    }

    /**
     * The IDirect3DVolumeTexture9::LockBox (d3d9.h) method locks a box on a volume texture resource.
     * @remarks
     * For performance reasons, dirty regions are only recorded for level zero of a texture. Dirty regions are automatically recorded when <b>LockBox</b> is called without D3DLOCK_NO_DIRTY_UPDATE or D3DLOCK_READONLY. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-updatetexture">UpdateTexture</a>.
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvolumetexture9-lockbox
     */
    LockBox(Level, pLockedVolume, pBox, Flags) {
        result := ComCall(19, this, "uint", Level, D3DLOCKED_BOX.Ptr, pLockedVolume, D3DBOX.Ptr, pBox, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * The IDirect3DVolumeTexture9::UnlockBox (d3d9.h) method unlocks a box on a volume texture resource.
     * @param {Integer} Level Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the level of the volume texture resource to unlock.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvolumetexture9-unlockbox
     */
    UnlockBox(Level) {
        result := ComCall(20, this, "uint", Level, "HRESULT")
        return result
    }

    /**
     * The IDirect3DVolumeTexture9::AddDirtyBox (d3d9.h) method adds a dirty region to a volume texture resource.
     * @remarks
     * For performance reasons, dirty regions are only recorded for level zero of a texture. For sublevels, it is assumed that the corresponding (scaled) box is also dirty. Dirty regions are automatically recorded when <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dvolumetexture9-lockbox">LockBox</a> is called without <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlock">D3DLOCK_NO_DIRTY_UPDATE</a> or <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlock">D3DLOCK_READONLY</a>.
     * 
     * Using <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlock">D3DLOCK_NO_DIRTY_UPDATE</a> and explicitly specifying dirty regions can be used to increase the efficiency of <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-updatetexture">UpdateTexture</a>. Using this method, applications can optimize what subset of a resource is copied by specifying dirty boxes on the resource. However, the dirty regions may be expanded to optimize alignment.
     * @param {Pointer<D3DBOX>} pDirtyBox Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dbox">D3DBOX</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dbox">D3DBOX</a> structure, specifying the dirty region to add. Specifying <b>NULL</b> expands the dirty region to cover the entire volume texture.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvolumetexture9-adddirtybox
     */
    AddDirtyBox(pDirtyBox) {
        result := ComCall(21, this, D3DBOX.Ptr, pDirtyBox, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirect3DVolumeTexture9.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLevelDesc := CallbackCreate(GetMethod(implObj, "GetLevelDesc"), flags, 3)
        this.vtbl.GetVolumeLevel := CallbackCreate(GetMethod(implObj, "GetVolumeLevel"), flags, 3)
        this.vtbl.LockBox := CallbackCreate(GetMethod(implObj, "LockBox"), flags, 5)
        this.vtbl.UnlockBox := CallbackCreate(GetMethod(implObj, "UnlockBox"), flags, 2)
        this.vtbl.AddDirtyBox := CallbackCreate(GetMethod(implObj, "AddDirtyBox"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLevelDesc)
        CallbackFree(this.vtbl.GetVolumeLevel)
        CallbackFree(this.vtbl.LockBox)
        CallbackFree(this.vtbl.UnlockBox)
        CallbackFree(this.vtbl.AddDirtyBox)
    }
}
