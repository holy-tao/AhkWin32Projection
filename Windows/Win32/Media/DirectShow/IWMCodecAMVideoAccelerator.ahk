#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is exposed by the Windows Media Decoder DMO and is called by a media player source filter to set up the various connections required to enable DirectX&#174; video acceleration (VA) for decoding of Windows Media-based video content.
 * @see https://docs.microsoft.com/windows/win32/api//wmdxva/nn-wmdxva-iwmcodecamvideoaccelerator
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IWMCodecAMVideoAccelerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMCodecAMVideoAccelerator
     * @type {Guid}
     */
    static IID => Guid("{d98ee251-34e0-4a2d-9312-9b4c788d9fa1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAcceleratorInterface", "NegotiateConnection", "SetPlayerNotify"]

    /**
     * The SetAcceleratorInterface method is called by the output pin on the player's source filter to pass the IAMVideoAccelerator interface on the Video Mixing Renderer (VMR) to the decoder DMO.
     * @param {IAMVideoAccelerator} pIAMVA Pointer to the <b>IAMVideoAccelerator</b> interface on the VMR.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmdxva/nf-wmdxva-iwmcodecamvideoaccelerator-setacceleratorinterface
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
     * @see https://docs.microsoft.com/windows/win32/api//wmdxva/nf-wmdxva-iwmcodecamvideoaccelerator-negotiateconnection
     */
    NegotiateConnection(pMediaType) {
        result := ComCall(4, this, "ptr", pMediaType, "HRESULT")
        return result
    }

    /**
     * The SetPlayerNotify method is called by the output pin on the source filter to provide the decoder DMO with the source filter's IWMPlayerTimestampHook interface to enable the source filter to update the time stamps on the samples before they are delivered to the renderer.
     * @param {IWMPlayerTimestampHook} pHook Pointer to the <b>IWMPlayerTimestampHook</b> interface exposed on the player.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code
     * @see https://docs.microsoft.com/windows/win32/api//wmdxva/nf-wmdxva-iwmcodecamvideoaccelerator-setplayernotify
     */
    SetPlayerNotify(pHook) {
        result := ComCall(5, this, "ptr", pHook, "HRESULT")
        return result
    }
}
