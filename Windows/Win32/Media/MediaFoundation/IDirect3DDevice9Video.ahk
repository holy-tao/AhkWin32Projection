#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDirect3DAuthenticatedChannel9.ahk" { IDirect3DAuthenticatedChannel9 }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Graphics\Direct3D9\D3DAUTHENTICATEDCHANNELTYPE.ahk" { D3DAUTHENTICATEDCHANNELTYPE }
#Import ".\D3DCONTENTPROTECTIONCAPS.ahk" { D3DCONTENTPROTECTIONCAPS }
#Import ".\IDirect3DCryptoSession9.ahk" { IDirect3DCryptoSession9 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables an application to use content protection and encryption services implemented by a graphics driver.To get a pointer to this interface, call QueryInterface on a D3D9Ex device.
 * @see https://learn.microsoft.com/windows/win32/api/d3d9/nn-d3d9-idirect3ddevice9video
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IDirect3DDevice9Video extends IUnknown {
    /**
     * The interface identifier for IDirect3DDevice9Video
     * @type {Guid}
     */
    static IID := Guid("{26dc4561-a1ee-4ae7-96da-118a36c0ec95}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirect3DDevice9Video interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetContentProtectionCaps   : IntPtr
        CreateAuthenticatedChannel : IntPtr
        CreateCryptoSession        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirect3DDevice9Video.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9video-getcontentprotectioncaps
     */
    GetContentProtectionCaps(pCryptoType, pDecodeProfile, pCaps) {
        result := ComCall(3, this, Guid.Ptr, pCryptoType, Guid.Ptr, pDecodeProfile, D3DCONTENTPROTECTIONCAPS.Ptr, pCaps, "HRESULT")
        return result
    }

    /**
     * Creates a channel to communicate with the Direct3D device or the graphics driver.
     * @remarks
     * If the <i>ChannelType</i> parameter is <b>D3DAUTHENTICATEDCHANNEL_D3D9</b>, the method creates a channel with the Direct3D device. This type of channel does not support authentication.
     * 
     * If <i>ChannelType</i> is <b>D3DAUTHENTICATEDCHANNEL_DRIVER_SOFTWARE</b> or <b>D3DAUTHENTICATEDCHANNEL_DRIVER_HARDWARE</b>, the method creates an authenticated channel with the graphics driver.
     * @param {D3DAUTHENTICATEDCHANNELTYPE} _ChannelType Specifies the type of channel, as a member of the <a href="https://docs.microsoft.com/windows/desktop/medfound/d3dauthenticatedchanneltype">D3DAUTHENTICATEDCHANNELTYPE</a> enumeration.
     * @param {Pointer<HANDLE>} pChannelHandle Receives a pointer to a handle for the channel.
     * @returns {IDirect3DAuthenticatedChannel9} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nn-d3d9-idirect3dauthenticatedchannel9">IDirect3DAuthenticatedChannel9</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9video-createauthenticatedchannel
     */
    CreateAuthenticatedChannel(_ChannelType, pChannelHandle) {
        result := ComCall(4, this, D3DAUTHENTICATEDCHANNELTYPE, _ChannelType, "ptr*", &ppAuthenticatedChannel := 0, HANDLE.Ptr, pChannelHandle, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9video-createcryptosession
     */
    CreateCryptoSession(pCryptoType, pDecodeProfile, pCryptoHandle) {
        result := ComCall(5, this, Guid.Ptr, pCryptoType, Guid.Ptr, pDecodeProfile, "ptr*", &ppCryptoSession := 0, HANDLE.Ptr, pCryptoHandle, "HRESULT")
        return IDirect3DCryptoSession9(ppCryptoSession)
    }

    Query(iid) {
        if (IDirect3DDevice9Video.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetContentProtectionCaps := CallbackCreate(GetMethod(implObj, "GetContentProtectionCaps"), flags, 4)
        this.vtbl.CreateAuthenticatedChannel := CallbackCreate(GetMethod(implObj, "CreateAuthenticatedChannel"), flags, 4)
        this.vtbl.CreateCryptoSession := CallbackCreate(GetMethod(implObj, "CreateCryptoSession"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetContentProtectionCaps)
        CallbackFree(this.vtbl.CreateAuthenticatedChannel)
        CallbackFree(this.vtbl.CreateCryptoSession)
    }
}
