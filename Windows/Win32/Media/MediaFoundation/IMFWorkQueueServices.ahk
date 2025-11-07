#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls the work queues created by the Media Session.
 * @remarks
 * 
 * If the application is using the protected media path (PMP) session, the methods in this interface automatically marshal the calls to the PMP process.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfworkqueueservices
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFWorkQueueServices extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFWorkQueueServices
     * @type {Guid}
     */
    static IID => Guid("{35fe1bb8-a3a9-40fe-bbec-eb569c9ccca3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginRegisterTopologyWorkQueuesWithMMCSS", "EndRegisterTopologyWorkQueuesWithMMCSS", "BeginUnregisterTopologyWorkQueuesWithMMCSS", "EndUnregisterTopologyWorkQueuesWithMMCSS", "GetTopologyWorkQueueMMCSSClass", "GetTopologyWorkQueueMMCSSTaskId", "BeginRegisterPlatformWorkQueueWithMMCSS", "EndRegisterPlatformWorkQueueWithMMCSS", "BeginUnregisterPlatformWorkQueueWithMMCSS", "EndUnregisterPlatformWorkQueueWithMMCSS", "GetPlaftormWorkQueueMMCSSClass", "GetPlatformWorkQueueMMCSSTaskId"]

    /**
     * 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} pState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfworkqueueservices-beginregistertopologyworkqueueswithmmcss
     */
    BeginRegisterTopologyWorkQueuesWithMMCSS(pCallback, pState) {
        result := ComCall(3, this, "ptr", pCallback, "ptr", pState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAsyncResult} pResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfworkqueueservices-endregistertopologyworkqueueswithmmcss
     */
    EndRegisterTopologyWorkQueuesWithMMCSS(pResult) {
        result := ComCall(4, this, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} pState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfworkqueueservices-beginunregistertopologyworkqueueswithmmcss
     */
    BeginUnregisterTopologyWorkQueuesWithMMCSS(pCallback, pState) {
        result := ComCall(5, this, "ptr", pCallback, "ptr", pState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAsyncResult} pResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfworkqueueservices-endunregistertopologyworkqueueswithmmcss
     */
    EndUnregisterTopologyWorkQueuesWithMMCSS(pResult) {
        result := ComCall(6, this, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwTopologyWorkQueueId 
     * @param {PWSTR} pwszClass 
     * @param {Pointer<Integer>} pcchClass 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfworkqueueservices-gettopologyworkqueuemmcssclass
     */
    GetTopologyWorkQueueMMCSSClass(dwTopologyWorkQueueId, pwszClass, pcchClass) {
        pwszClass := pwszClass is String ? StrPtr(pwszClass) : pwszClass

        pcchClassMarshal := pcchClass is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", dwTopologyWorkQueueId, "ptr", pwszClass, pcchClassMarshal, pcchClass, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwTopologyWorkQueueId 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfworkqueueservices-gettopologyworkqueuemmcsstaskid
     */
    GetTopologyWorkQueueMMCSSTaskId(dwTopologyWorkQueueId) {
        result := ComCall(8, this, "uint", dwTopologyWorkQueueId, "uint*", &pdwTaskId := 0, "HRESULT")
        return pdwTaskId
    }

    /**
     * 
     * @param {Integer} dwPlatformWorkQueue 
     * @param {PWSTR} wszClass 
     * @param {Integer} dwTaskId 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} pState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfworkqueueservices-beginregisterplatformworkqueuewithmmcss
     */
    BeginRegisterPlatformWorkQueueWithMMCSS(dwPlatformWorkQueue, wszClass, dwTaskId, pCallback, pState) {
        wszClass := wszClass is String ? StrPtr(wszClass) : wszClass

        result := ComCall(9, this, "uint", dwPlatformWorkQueue, "ptr", wszClass, "uint", dwTaskId, "ptr", pCallback, "ptr", pState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAsyncResult} pResult 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfworkqueueservices-endregisterplatformworkqueuewithmmcss
     */
    EndRegisterPlatformWorkQueueWithMMCSS(pResult) {
        result := ComCall(10, this, "ptr", pResult, "uint*", &pdwTaskId := 0, "HRESULT")
        return pdwTaskId
    }

    /**
     * 
     * @param {Integer} dwPlatformWorkQueue 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} pState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfworkqueueservices-beginunregisterplatformworkqueuewithmmcss
     */
    BeginUnregisterPlatformWorkQueueWithMMCSS(dwPlatformWorkQueue, pCallback, pState) {
        result := ComCall(11, this, "uint", dwPlatformWorkQueue, "ptr", pCallback, "ptr", pState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAsyncResult} pResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfworkqueueservices-endunregisterplatformworkqueuewithmmcss
     */
    EndUnregisterPlatformWorkQueueWithMMCSS(pResult) {
        result := ComCall(12, this, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwPlatformWorkQueueId 
     * @param {PWSTR} pwszClass 
     * @param {Pointer<Integer>} pcchClass 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfworkqueueservices-getplaftormworkqueuemmcssclass
     */
    GetPlaftormWorkQueueMMCSSClass(dwPlatformWorkQueueId, pwszClass, pcchClass) {
        pwszClass := pwszClass is String ? StrPtr(pwszClass) : pwszClass

        pcchClassMarshal := pcchClass is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", dwPlatformWorkQueueId, "ptr", pwszClass, pcchClassMarshal, pcchClass, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwPlatformWorkQueueId 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfworkqueueservices-getplatformworkqueuemmcsstaskid
     */
    GetPlatformWorkQueueMMCSSTaskId(dwPlatformWorkQueueId) {
        result := ComCall(14, this, "uint", dwPlatformWorkQueueId, "uint*", &pdwTaskId := 0, "HRESULT")
        return pdwTaskId
    }
}
