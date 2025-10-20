#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables an application to use content protection and encryption services implemented by a graphics driver.To get a pointer to this interface, call QueryInterface on a D3D9Ex device.
 * @see https://docs.microsoft.com/windows/win32/api//d3d9/nn-d3d9-idirect3ddevice9video
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IDirect3DDevice9Video extends IUnknown{
    /**
     * The interface identifier for IDirect3DDevice9Video
     * @type {Guid}
     */
    static IID => Guid("{26dc4561-a1ee-4ae7-96da-118a36c0ec95}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pCryptoType 
     * @param {Pointer<Guid>} pDecodeProfile 
     * @param {Pointer<D3DCONTENTPROTECTIONCAPS>} pCaps 
     * @returns {HRESULT} 
     */
    GetContentProtectionCaps(pCryptoType, pDecodeProfile, pCaps) {
        result := ComCall(3, this, "ptr", pCryptoType, "ptr", pDecodeProfile, "ptr", pCaps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ChannelType 
     * @param {Pointer<IDirect3DAuthenticatedChannel9>} ppAuthenticatedChannel 
     * @param {Pointer<HANDLE>} pChannelHandle 
     * @returns {HRESULT} 
     */
    CreateAuthenticatedChannel(ChannelType, ppAuthenticatedChannel, pChannelHandle) {
        result := ComCall(4, this, "int", ChannelType, "ptr", ppAuthenticatedChannel, "ptr", pChannelHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCryptoType 
     * @param {Pointer<Guid>} pDecodeProfile 
     * @param {Pointer<IDirect3DCryptoSession9>} ppCryptoSession 
     * @param {Pointer<HANDLE>} pCryptoHandle 
     * @returns {HRESULT} 
     */
    CreateCryptoSession(pCryptoType, pDecodeProfile, ppCryptoSession, pCryptoHandle) {
        result := ComCall(5, this, "ptr", pCryptoType, "ptr", pDecodeProfile, "ptr", ppCryptoSession, "ptr", pCryptoHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
