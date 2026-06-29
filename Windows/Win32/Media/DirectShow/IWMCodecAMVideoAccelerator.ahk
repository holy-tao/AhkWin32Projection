#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\MediaFoundation\AM_MEDIA_TYPE.ahk" { AM_MEDIA_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAMVideoAccelerator.ahk" { IAMVideoAccelerator }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\WindowsMediaFormat\IWMPlayerTimestampHook.ahk" { IWMPlayerTimestampHook }

/**
 * This interface is exposed by the Windows Media Decoder DMO and is called by a media player source filter to set up the various connections required to enable DirectX&#174; video acceleration (VA) for decoding of Windows Media-based video content.
 * @see https://learn.microsoft.com/windows/win32/api/wmdxva/nn-wmdxva-iwmcodecamvideoaccelerator
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IWMCodecAMVideoAccelerator extends IUnknown {
    /**
     * The interface identifier for IWMCodecAMVideoAccelerator
     * @type {Guid}
     */
    static IID := Guid("{d98ee251-34e0-4a2d-9312-9b4c788d9fa1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMCodecAMVideoAccelerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAcceleratorInterface : IntPtr
        NegotiateConnection     : IntPtr
        SetPlayerNotify         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMCodecAMVideoAccelerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetAcceleratorInterface method is called by the output pin on the player's source filter to pass the IAMVideoAccelerator interface on the Video Mixing Renderer (VMR) to the decoder DMO.
     * @param {IAMVideoAccelerator} pIAMVA Pointer to the <b>IAMVideoAccelerator</b> interface on the VMR.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmdxva/nf-wmdxva-iwmcodecamvideoaccelerator-setacceleratorinterface
     */
    SetAcceleratorInterface(pIAMVA) {
        result := ComCall(3, this, "ptr", pIAMVA, "HRESULT")
        return result
    }

    /**
     * The NegotiateConnection method is called by the output pin on the player's source filter during the connection process when it has been given a DirectX VA media type.
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType Pointer to the media type structure that represents the media type being proposed for the connection.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMO_E_TYPE_NOT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No input type has been set on the decoder.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder has no valid <b>IAMVideoAccelerator</b> interface pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pMediaType</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmdxva/nf-wmdxva-iwmcodecamvideoaccelerator-negotiateconnection
     */
    NegotiateConnection(pMediaType) {
        result := ComCall(4, this, AM_MEDIA_TYPE.Ptr, pMediaType, "HRESULT")
        return result
    }

    /**
     * The SetPlayerNotify method is called by the output pin on the source filter to provide the decoder DMO with the source filter's IWMPlayerTimestampHook interface to enable the source filter to update the time stamps on the samples before they are delivered to the renderer.
     * @param {IWMPlayerTimestampHook} pHook Pointer to the <b>IWMPlayerTimestampHook</b> interface exposed on the player.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code
     * @see https://learn.microsoft.com/windows/win32/api/wmdxva/nf-wmdxva-iwmcodecamvideoaccelerator-setplayernotify
     */
    SetPlayerNotify(pHook) {
        result := ComCall(5, this, "ptr", pHook, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMCodecAMVideoAccelerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAcceleratorInterface := CallbackCreate(GetMethod(implObj, "SetAcceleratorInterface"), flags, 2)
        this.vtbl.NegotiateConnection := CallbackCreate(GetMethod(implObj, "NegotiateConnection"), flags, 2)
        this.vtbl.SetPlayerNotify := CallbackCreate(GetMethod(implObj, "SetPlayerNotify"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAcceleratorInterface)
        CallbackFree(this.vtbl.NegotiateConnection)
        CallbackFree(this.vtbl.SetPlayerNotify)
    }
}
