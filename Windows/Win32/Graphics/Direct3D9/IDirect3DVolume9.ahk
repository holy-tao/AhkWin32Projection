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
     * 
     * @param {Pointer<IDirect3DDevice9>} ppDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvolume9-getdevice
     */
    GetDevice(ppDevice) {
        result := ComCall(3, this, "ptr*", ppDevice, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} refguid 
     * @param {Pointer<Void>} pData 
     * @param {Integer} SizeOfData 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvolume9-setprivatedata
     */
    SetPrivateData(refguid, pData, SizeOfData, Flags) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", refguid, pDataMarshal, pData, "uint", SizeOfData, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} refguid 
     * @param {Pointer<Void>} pData 
     * @param {Pointer<Integer>} pSizeOfData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvolume9-getprivatedata
     */
    GetPrivateData(refguid, pData, pSizeOfData) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"
        pSizeOfDataMarshal := pSizeOfData is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", refguid, pDataMarshal, pData, pSizeOfDataMarshal, pSizeOfData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} refguid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvolume9-freeprivatedata
     */
    FreePrivateData(refguid) {
        result := ComCall(6, this, "ptr", refguid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppContainer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvolume9-getcontainer
     */
    GetContainer(riid, ppContainer) {
        ppContainerMarshal := ppContainer is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", riid, ppContainerMarshal, ppContainer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DVOLUME_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvolume9-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(8, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DLOCKED_BOX>} pLockedVolume 
     * @param {Pointer<D3DBOX>} pBox 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvolume9-lockbox
     */
    LockBox(pLockedVolume, pBox, Flags) {
        result := ComCall(9, this, "ptr", pLockedVolume, "ptr", pBox, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dvolume9-unlockbox
     */
    UnlockBox() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
