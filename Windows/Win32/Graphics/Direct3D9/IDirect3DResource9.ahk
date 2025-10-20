#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications use the methods of the IDirect3DResource9 interface to query and prepare resources.
 * @remarks
 * 
  * To create a texture resource, you can call one of the following methods.
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createcubetexture">IDirect3DDevice9::CreateCubeTexture</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createtexture">IDirect3DDevice9::CreateTexture</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createvolumetexture">IDirect3DDevice9::CreateVolumeTexture</a>
  * </li>
  * </ul>
  * To create a geometry-oriented resource, you can call one of the following methods.
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createindexbuffer">IDirect3DDevice9::CreateIndexBuffer</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createvertexbuffer">IDirect3DDevice9::CreateVertexBuffer</a>
  * </li>
  * </ul>
  * This interface, like all COM interfaces, inherits from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
  * 
  * The LPDIRECT3DRESOURCE9 and PDIRECT3DRESOURCE9 types are defined as pointers to the <b>IDirect3DResource9</b> interface. 
  * 
  * 
  *     
  * 
  * 
  * ```
  * 
  *     typedef struct IDirect3DResource9 *LPDIRECT3DRESOURCE9, *PDIRECT3DRESOURCE9;
  * 
  * ```
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nn-d3d9helper-idirect3dresource9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3DResource9 extends IUnknown{
    /**
     * The interface identifier for IDirect3DResource9
     * @type {Guid}
     */
    static IID => Guid("{05eec05d-8f7d-4362-b999-d1baf357c704}")

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
     * @param {Integer} PriorityNew 
     * @returns {Integer} 
     */
    SetPriority(PriorityNew) {
        result := ComCall(7, this, "uint", PriorityNew, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPriority() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    PreLoad() {
        ComCall(9, this)
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetType() {
        result := ComCall(10, this, "int")
        return result
    }
}
