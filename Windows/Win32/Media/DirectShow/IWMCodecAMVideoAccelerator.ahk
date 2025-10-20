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
     * 
     * @param {Pointer<IAMVideoAccelerator>} pIAMVA 
     * @returns {HRESULT} 
     */
    SetAcceleratorInterface(pIAMVA) {
        result := ComCall(3, this, "ptr", pIAMVA, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType 
     * @returns {HRESULT} 
     */
    NegotiateConnection(pMediaType) {
        result := ComCall(4, this, "ptr", pMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPlayerTimestampHook>} pHook 
     * @returns {HRESULT} 
     */
    SetPlayerNotify(pHook) {
        result := ComCall(5, this, "ptr", pHook, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
