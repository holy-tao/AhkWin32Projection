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
     * Queries the display driver for its content protection capabilities.
     * @param {Pointer<Guid>} pCryptoType A pointer to a GUID that specifies the type of encryption to use. The following GUIDs are defined.
     * 
     * 
     * **D3DCRYPTOTYPE_AES128_CTR**
     * 
     * 128-bit Advanced Encryption Standard CTR mode (AES-CTR) block cipher.
     * 
     * **D3DCRYPTOTYPE_PROPRIETARY**
     * 
     * Proprietary encryption algorithm.
     * @param {Pointer<Guid>} pDecodeProfile A pointer to a GUID that specifies the DirectX Video Acceleration 2 (DXVA-2) decoding profile. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideodecoderservice-getdecoderdeviceguids">IDirectXVideoDecoderService::GetDecoderDeviceGuids</a>. If DXVA-2 decoding will not be used, set this parameter to <b>NULL</b>.
     * @param {Pointer<D3DCONTENTPROTECTIONCAPS>} pCaps A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcontentprotectioncaps">D3DCONTENTPROTECTIONCAPS</a> structure. The method fills in this structure with the driver's content protection capabilities.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9/nf-d3d9-idirect3ddevice9video-getcontentprotectioncaps
     */
    GetContentProtectionCaps(pCryptoType, pDecodeProfile, pCaps) {
        result := ComCall(3, this, "ptr", pCryptoType, "ptr", pDecodeProfile, "ptr", pCaps, "HRESULT")
        return result
    }

    /**
     * Creates a channel to communicate with the Direct3D device or the graphics driver.
     * @param {Integer} ChannelType Specifies the type of channel, as a member of the <a href="https://docs.microsoft.com/windows/desktop/medfound/d3dauthenticatedchanneltype">D3DAUTHENTICATEDCHANNELTYPE</a> enumeration.
     * @param {Pointer<HANDLE>} pChannelHandle Receives a pointer to a handle for the channel.
     * @returns {IDirect3DAuthenticatedChannel9} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nn-d3d9-idirect3dauthenticatedchannel9">IDirect3DAuthenticatedChannel9</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9/nf-d3d9-idirect3ddevice9video-createauthenticatedchannel
     */
    CreateAuthenticatedChannel(ChannelType, pChannelHandle) {
        result := ComCall(4, this, "int", ChannelType, "ptr*", &ppAuthenticatedChannel := 0, "ptr", pChannelHandle, "HRESULT")
        return IDirect3DAuthenticatedChannel9(ppAuthenticatedChannel)
    }

    /**
     * Creates a cryptographic session to encrypt video content that is sent to the display driver.
     * @param {Pointer<Guid>} pCryptoType Pointer to a GUID that specifies the type of encryption to use. The following GUIDs are defined.
     * 
     * **pDecodeProfile**
     * 
     * Type: **GUID** 
     * 
     * A pointer to a GUID that specifies the DirectX Video Acceleration 2 (DXVA-2) decoding profile. For a list of possible values, see IDirectXVideoDecoderService::GetDecoderDeviceGuids. If DXVA-2 decoding will not be used, set this parameter to NULL. 
     * 
     * **pCaps** 
     * 
     * Type: **D3DCONTENTPROTECTIONCAPS**
     * 
     *  A pointer to a D3DCONTENTPROTECTIONCAPS structure. The method fills in this structure with the driver's content protection capabilities.
     * @param {Pointer<Guid>} pDecodeProfile Pointer to a GUID that specifies the DirectX Video Acceleration 2 (DXVA-2) decoding profile. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirectxvideodecoderservice-getdecoderdeviceguids">IDirectXVideoDecoderService::GetDecoderDeviceGuids</a>. If DXVA-2 decoding will not be used, set this parameter to <b>NULL</b>.
     * @param {Pointer<HANDLE>} pCryptoHandle Receives a handle for the session.
     * @returns {IDirect3DCryptoSession9} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nn-d3d9-idirect3dcryptosession9">IDirect3DCryptoSession9</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9/nf-d3d9-idirect3ddevice9video-createcryptosession
     */
    CreateCryptoSession(pCryptoType, pDecodeProfile, pCryptoHandle) {
        result := ComCall(5, this, "ptr", pCryptoType, "ptr", pDecodeProfile, "ptr*", &ppCryptoSession := 0, "ptr", pCryptoHandle, "HRESULT")
        return IDirect3DCryptoSession9(ppCryptoSession)
    }
}
