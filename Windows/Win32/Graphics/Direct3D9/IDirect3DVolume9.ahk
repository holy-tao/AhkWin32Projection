#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Guid>} refguid 
     * @param {Pointer<Void>} pData 
     * @param {Integer} SizeOfData 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    SetPrivateData(refguid, pData, SizeOfData, Flags) {
        result := ComCall(4, this, "ptr", refguid, "ptr", pData, "uint", SizeOfData, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} refguid 
     * @param {Pointer<Void>} pData 
     * @param {Pointer<UInt32>} pSizeOfData 
     * @returns {HRESULT} 
     */
    GetPrivateData(refguid, pData, pSizeOfData) {
        result := ComCall(5, this, "ptr", refguid, "ptr", pData, "uint*", pSizeOfData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} refguid 
     * @returns {HRESULT} 
     */
    FreePrivateData(refguid) {
        result := ComCall(6, this, "ptr", refguid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppContainer 
     * @returns {HRESULT} 
     */
    GetContainer(riid, ppContainer) {
        result := ComCall(7, this, "ptr", riid, "ptr", ppContainer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3DVOLUME_DESC>} pDesc 
     * @returns {HRESULT} 
     */
    GetDesc(pDesc) {
        result := ComCall(8, this, "ptr", pDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3DLOCKED_BOX>} pLockedVolume 
     * @param {Pointer<D3DBOX>} pBox 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    LockBox(pLockedVolume, pBox, Flags) {
        result := ComCall(9, this, "ptr", pLockedVolume, "ptr", pBox, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnlockBox() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
