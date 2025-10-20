#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls the capture source object. The capture source manages the audio and video capture devices.
 * @remarks
 * 
  * To get a pointer to the capture source, call <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-getsource">IMFCaptureEngine::GetSource</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nn-mfcaptureengine-imfcapturesource
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCaptureSource extends IUnknown{
    /**
     * The interface identifier for IMFCaptureSource
     * @type {Guid}
     */
    static IID => Guid("{439a42a8-0d2c-4505-be83-f79b2a05d5c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} mfCaptureEngineDeviceType 
     * @param {Pointer<IMFMediaSource>} ppMediaSource 
     * @returns {HRESULT} 
     */
    GetCaptureDeviceSource(mfCaptureEngineDeviceType, ppMediaSource) {
        result := ComCall(3, this, "int", mfCaptureEngineDeviceType, "ptr", ppMediaSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mfCaptureEngineDeviceType 
     * @param {Pointer<IMFActivate>} ppActivate 
     * @returns {HRESULT} 
     */
    GetCaptureDeviceActivate(mfCaptureEngineDeviceType, ppActivate) {
        result := ComCall(4, this, "int", mfCaptureEngineDeviceType, "ptr", ppActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidService 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppUnknown 
     * @returns {HRESULT} 
     */
    GetService(rguidService, riid, ppUnknown) {
        result := ComCall(5, this, "ptr", rguidService, "ptr", riid, "ptr", ppUnknown, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSourceStreamIndex 
     * @param {Pointer<IUnknown>} pUnknown 
     * @returns {HRESULT} 
     */
    AddEffect(dwSourceStreamIndex, pUnknown) {
        result := ComCall(6, this, "uint", dwSourceStreamIndex, "ptr", pUnknown, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSourceStreamIndex 
     * @param {Pointer<IUnknown>} pUnknown 
     * @returns {HRESULT} 
     */
    RemoveEffect(dwSourceStreamIndex, pUnknown) {
        result := ComCall(7, this, "uint", dwSourceStreamIndex, "ptr", pUnknown, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSourceStreamIndex 
     * @returns {HRESULT} 
     */
    RemoveAllEffects(dwSourceStreamIndex) {
        result := ComCall(8, this, "uint", dwSourceStreamIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSourceStreamIndex 
     * @param {Integer} dwMediaTypeIndex 
     * @param {Pointer<IMFMediaType>} ppMediaType 
     * @returns {HRESULT} 
     */
    GetAvailableDeviceMediaType(dwSourceStreamIndex, dwMediaTypeIndex, ppMediaType) {
        result := ComCall(9, this, "uint", dwSourceStreamIndex, "uint", dwMediaTypeIndex, "ptr", ppMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSourceStreamIndex 
     * @param {Pointer<IMFMediaType>} pMediaType 
     * @returns {HRESULT} 
     */
    SetCurrentDeviceMediaType(dwSourceStreamIndex, pMediaType) {
        result := ComCall(10, this, "uint", dwSourceStreamIndex, "ptr", pMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSourceStreamIndex 
     * @param {Pointer<IMFMediaType>} ppMediaType 
     * @returns {HRESULT} 
     */
    GetCurrentDeviceMediaType(dwSourceStreamIndex, ppMediaType) {
        result := ComCall(11, this, "uint", dwSourceStreamIndex, "ptr", ppMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwStreamCount 
     * @returns {HRESULT} 
     */
    GetDeviceStreamCount(pdwStreamCount) {
        result := ComCall(12, this, "uint*", pdwStreamCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSourceStreamIndex 
     * @param {Pointer<Int32>} pStreamCategory 
     * @returns {HRESULT} 
     */
    GetDeviceStreamCategory(dwSourceStreamIndex, pStreamCategory) {
        result := ComCall(13, this, "uint", dwSourceStreamIndex, "int*", pStreamCategory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<BOOL>} pfMirrorState 
     * @returns {HRESULT} 
     */
    GetMirrorState(dwStreamIndex, pfMirrorState) {
        result := ComCall(14, this, "uint", dwStreamIndex, "ptr", pfMirrorState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {BOOL} fMirrorState 
     * @returns {HRESULT} 
     */
    SetMirrorState(dwStreamIndex, fMirrorState) {
        result := ComCall(15, this, "uint", dwStreamIndex, "int", fMirrorState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uifriendlyName 
     * @param {Pointer<UInt32>} pdwActualStreamIndex 
     * @returns {HRESULT} 
     */
    GetStreamIndexFromFriendlyName(uifriendlyName, pdwActualStreamIndex) {
        result := ComCall(16, this, "uint", uifriendlyName, "uint*", pdwActualStreamIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
