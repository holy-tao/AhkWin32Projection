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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCaptureDeviceSource", "GetCaptureDeviceActivate", "GetService", "AddEffect", "RemoveEffect", "RemoveAllEffects", "GetAvailableDeviceMediaType", "SetCurrentDeviceMediaType", "GetCurrentDeviceMediaType", "GetDeviceStreamCount", "GetDeviceStreamCategory", "GetMirrorState", "SetMirrorState", "GetStreamIndexFromFriendlyName"]

    /**
     * 
     * @param {Integer} mfCaptureEngineDeviceType 
     * @param {Pointer<IMFMediaSource>} ppMediaSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getcapturedevicesource
     */
    GetCaptureDeviceSource(mfCaptureEngineDeviceType, ppMediaSource) {
        result := ComCall(3, this, "int", mfCaptureEngineDeviceType, "ptr*", ppMediaSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mfCaptureEngineDeviceType 
     * @param {Pointer<IMFActivate>} ppActivate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getcapturedeviceactivate
     */
    GetCaptureDeviceActivate(mfCaptureEngineDeviceType, ppActivate) {
        result := ComCall(4, this, "int", mfCaptureEngineDeviceType, "ptr*", ppActivate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidService 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppUnknown 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getservice
     */
    GetService(rguidService, riid, ppUnknown) {
        result := ComCall(5, this, "ptr", rguidService, "ptr", riid, "ptr*", ppUnknown, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSourceStreamIndex 
     * @param {IUnknown} pUnknown 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-addeffect
     */
    AddEffect(dwSourceStreamIndex, pUnknown) {
        result := ComCall(6, this, "uint", dwSourceStreamIndex, "ptr", pUnknown, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSourceStreamIndex 
     * @param {IUnknown} pUnknown 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-removeeffect
     */
    RemoveEffect(dwSourceStreamIndex, pUnknown) {
        result := ComCall(7, this, "uint", dwSourceStreamIndex, "ptr", pUnknown, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSourceStreamIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-removealleffects
     */
    RemoveAllEffects(dwSourceStreamIndex) {
        result := ComCall(8, this, "uint", dwSourceStreamIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSourceStreamIndex 
     * @param {Integer} dwMediaTypeIndex 
     * @param {Pointer<IMFMediaType>} ppMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getavailabledevicemediatype
     */
    GetAvailableDeviceMediaType(dwSourceStreamIndex, dwMediaTypeIndex, ppMediaType) {
        result := ComCall(9, this, "uint", dwSourceStreamIndex, "uint", dwMediaTypeIndex, "ptr*", ppMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSourceStreamIndex 
     * @param {IMFMediaType} pMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-setcurrentdevicemediatype
     */
    SetCurrentDeviceMediaType(dwSourceStreamIndex, pMediaType) {
        result := ComCall(10, this, "uint", dwSourceStreamIndex, "ptr", pMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSourceStreamIndex 
     * @param {Pointer<IMFMediaType>} ppMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getcurrentdevicemediatype
     */
    GetCurrentDeviceMediaType(dwSourceStreamIndex, ppMediaType) {
        result := ComCall(11, this, "uint", dwSourceStreamIndex, "ptr*", ppMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwStreamCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getdevicestreamcount
     */
    GetDeviceStreamCount(pdwStreamCount) {
        result := ComCall(12, this, "uint*", pdwStreamCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSourceStreamIndex 
     * @param {Pointer<Integer>} pStreamCategory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getdevicestreamcategory
     */
    GetDeviceStreamCategory(dwSourceStreamIndex, pStreamCategory) {
        result := ComCall(13, this, "uint", dwSourceStreamIndex, "int*", pStreamCategory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<BOOL>} pfMirrorState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getmirrorstate
     */
    GetMirrorState(dwStreamIndex, pfMirrorState) {
        result := ComCall(14, this, "uint", dwStreamIndex, "ptr", pfMirrorState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {BOOL} fMirrorState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-setmirrorstate
     */
    SetMirrorState(dwStreamIndex, fMirrorState) {
        result := ComCall(15, this, "uint", dwStreamIndex, "int", fMirrorState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uifriendlyName 
     * @param {Pointer<Integer>} pdwActualStreamIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getstreamindexfromfriendlyname
     */
    GetStreamIndexFromFriendlyName(uifriendlyName, pdwActualStreamIndex) {
        result := ComCall(16, this, "uint", uifriendlyName, "uint*", pdwActualStreamIndex, "HRESULT")
        return result
    }
}
