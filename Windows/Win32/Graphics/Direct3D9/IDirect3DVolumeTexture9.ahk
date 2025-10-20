#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} Level 
     * @param {Pointer<D3DVOLUME_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvolumetexture9-getleveldesc
     */
    GetLevelDesc(Level, pDesc) {
        result := ComCall(17, this, "uint", Level, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Level 
     * @param {Pointer<IDirect3DVolume9>} ppVolumeLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvolumetexture9-getvolumelevel
     */
    GetVolumeLevel(Level, ppVolumeLevel) {
        result := ComCall(18, this, "uint", Level, "ptr*", ppVolumeLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Level 
     * @param {Pointer<D3DLOCKED_BOX>} pLockedVolume 
     * @param {Pointer<D3DBOX>} pBox 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvolumetexture9-lockbox
     */
    LockBox(Level, pLockedVolume, pBox, Flags) {
        result := ComCall(19, this, "uint", Level, "ptr", pLockedVolume, "ptr", pBox, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Level 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvolumetexture9-unlockbox
     */
    UnlockBox(Level) {
        result := ComCall(20, this, "uint", Level, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DBOX>} pDirtyBox 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvolumetexture9-adddirtybox
     */
    AddDirtyBox(pDirtyBox) {
        result := ComCall(21, this, "ptr", pDirtyBox, "HRESULT")
        return result
    }
}
