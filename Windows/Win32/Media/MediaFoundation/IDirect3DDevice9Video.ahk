#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DAuthenticatedChannel9.ahk
#Include .\IDirect3DCryptoSession9.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables an application to use content protection and encryption services implemented by a graphics driver.To get a pointer to this interface, call QueryInterface on a D3D9Ex device.
 * @see https://docs.microsoft.com/windows/win32/api//d3d9/nn-d3d9-idirect3ddevice9video
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IDirect3DDevice9Video extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetContentProtectionCaps", "CreateAuthenticatedChannel", "CreateCryptoSession"]

    /**
     * 
     * @param {Pointer<Guid>} pCryptoType 
     * @param {Pointer<Guid>} pDecodeProfile 
     * @param {Pointer<D3DCONTENTPROTECTIONCAPS>} pCaps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9video-getcontentprotectioncaps
     */
    GetContentProtectionCaps(pCryptoType, pDecodeProfile, pCaps) {
        result := ComCall(3, this, "ptr", pCryptoType, "ptr", pDecodeProfile, "ptr", pCaps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ChannelType 
     * @param {Pointer<HANDLE>} pChannelHandle 
     * @returns {IDirect3DAuthenticatedChannel9} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9video-createauthenticatedchannel
     */
    CreateAuthenticatedChannel(ChannelType, pChannelHandle) {
        result := ComCall(4, this, "int", ChannelType, "ptr*", &ppAuthenticatedChannel := 0, "ptr", pChannelHandle, "HRESULT")
        return IDirect3DAuthenticatedChannel9(ppAuthenticatedChannel)
    }

    /**
     * 
     * @param {Pointer<Guid>} pCryptoType 
     * @param {Pointer<Guid>} pDecodeProfile 
     * @param {Pointer<HANDLE>} pCryptoHandle 
     * @returns {IDirect3DCryptoSession9} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9video-createcryptosession
     */
    CreateCryptoSession(pCryptoType, pDecodeProfile, pCryptoHandle) {
        result := ComCall(5, this, "ptr", pCryptoType, "ptr", pDecodeProfile, "ptr*", &ppCryptoSession := 0, "ptr", pCryptoHandle, "HRESULT")
        return IDirect3DCryptoSession9(ppCryptoSession)
    }
}
