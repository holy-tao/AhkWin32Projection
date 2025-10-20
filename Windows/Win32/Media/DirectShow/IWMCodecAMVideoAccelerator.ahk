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
     * 
     * @param {IAMVideoAccelerator} pIAMVA 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmdxva/nf-wmdxva-iwmcodecamvideoaccelerator-setacceleratorinterface
     */
    SetAcceleratorInterface(pIAMVA) {
        result := ComCall(3, this, "ptr", pIAMVA, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmdxva/nf-wmdxva-iwmcodecamvideoaccelerator-negotiateconnection
     */
    NegotiateConnection(pMediaType) {
        result := ComCall(4, this, "ptr", pMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPlayerTimestampHook} pHook 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmdxva/nf-wmdxva-iwmcodecamvideoaccelerator-setplayernotify
     */
    SetPlayerNotify(pHook) {
        result := ComCall(5, this, "ptr", pHook, "HRESULT")
        return result
    }
}
