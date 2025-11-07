#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaSource.ahk
#Include .\IMFActivate.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IMFMediaType.ahk

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
     * @returns {IMFMediaSource} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getcapturedevicesource
     */
    GetCaptureDeviceSource(mfCaptureEngineDeviceType) {
        result := ComCall(3, this, "int", mfCaptureEngineDeviceType, "ptr*", &ppMediaSource := 0, "HRESULT")
        return IMFMediaSource(ppMediaSource)
    }

    /**
     * 
     * @param {Integer} mfCaptureEngineDeviceType 
     * @returns {IMFActivate} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getcapturedeviceactivate
     */
    GetCaptureDeviceActivate(mfCaptureEngineDeviceType) {
        result := ComCall(4, this, "int", mfCaptureEngineDeviceType, "ptr*", &ppActivate := 0, "HRESULT")
        return IMFActivate(ppActivate)
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidService 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getservice
     */
    GetService(rguidService, riid) {
        result := ComCall(5, this, "ptr", rguidService, "ptr", riid, "ptr*", &ppUnknown := 0, "HRESULT")
        return IUnknown(ppUnknown)
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
     * @returns {IMFMediaType} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getavailabledevicemediatype
     */
    GetAvailableDeviceMediaType(dwSourceStreamIndex, dwMediaTypeIndex) {
        result := ComCall(9, this, "uint", dwSourceStreamIndex, "uint", dwMediaTypeIndex, "ptr*", &ppMediaType := 0, "HRESULT")
        return IMFMediaType(ppMediaType)
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
     * @returns {IMFMediaType} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getcurrentdevicemediatype
     */
    GetCurrentDeviceMediaType(dwSourceStreamIndex) {
        result := ComCall(11, this, "uint", dwSourceStreamIndex, "ptr*", &ppMediaType := 0, "HRESULT")
        return IMFMediaType(ppMediaType)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getdevicestreamcount
     */
    GetDeviceStreamCount() {
        result := ComCall(12, this, "uint*", &pdwStreamCount := 0, "HRESULT")
        return pdwStreamCount
    }

    /**
     * 
     * @param {Integer} dwSourceStreamIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getdevicestreamcategory
     */
    GetDeviceStreamCategory(dwSourceStreamIndex) {
        result := ComCall(13, this, "uint", dwSourceStreamIndex, "int*", &pStreamCategory := 0, "HRESULT")
        return pStreamCategory
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getmirrorstate
     */
    GetMirrorState(dwStreamIndex) {
        result := ComCall(14, this, "uint", dwStreamIndex, "int*", &pfMirrorState := 0, "HRESULT")
        return pfMirrorState
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getstreamindexfromfriendlyname
     */
    GetStreamIndexFromFriendlyName(uifriendlyName) {
        result := ComCall(16, this, "uint", uifriendlyName, "uint*", &pdwActualStreamIndex := 0, "HRESULT")
        return pdwActualStreamIndex
    }
}
