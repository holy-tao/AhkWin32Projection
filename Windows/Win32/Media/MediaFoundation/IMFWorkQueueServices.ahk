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
     * 
     * @param {Pointer<IMFAsyncCallback>} pCallback 
     * @param {Pointer<IUnknown>} pState 
     * @returns {HRESULT} 
     */
    BeginRegisterTopologyWorkQueuesWithMMCSS(pCallback, pState) {
        result := ComCall(3, this, "ptr", pCallback, "ptr", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAsyncResult>} pResult 
     * @returns {HRESULT} 
     */
    EndRegisterTopologyWorkQueuesWithMMCSS(pResult) {
        result := ComCall(4, this, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAsyncCallback>} pCallback 
     * @param {Pointer<IUnknown>} pState 
     * @returns {HRESULT} 
     */
    BeginUnregisterTopologyWorkQueuesWithMMCSS(pCallback, pState) {
        result := ComCall(5, this, "ptr", pCallback, "ptr", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAsyncResult>} pResult 
     * @returns {HRESULT} 
     */
    EndUnregisterTopologyWorkQueuesWithMMCSS(pResult) {
        result := ComCall(6, this, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwTopologyWorkQueueId 
     * @param {PWSTR} pwszClass 
     * @param {Pointer<UInt32>} pcchClass 
     * @returns {HRESULT} 
     */
    GetTopologyWorkQueueMMCSSClass(dwTopologyWorkQueueId, pwszClass, pcchClass) {
        pwszClass := pwszClass is String ? StrPtr(pwszClass) : pwszClass

        result := ComCall(7, this, "uint", dwTopologyWorkQueueId, "ptr", pwszClass, "uint*", pcchClass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwTopologyWorkQueueId 
     * @param {Pointer<UInt32>} pdwTaskId 
     * @returns {HRESULT} 
     */
    GetTopologyWorkQueueMMCSSTaskId(dwTopologyWorkQueueId, pdwTaskId) {
        result := ComCall(8, this, "uint", dwTopologyWorkQueueId, "uint*", pdwTaskId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwPlatformWorkQueue 
     * @param {PWSTR} wszClass 
     * @param {Integer} dwTaskId 
     * @param {Pointer<IMFAsyncCallback>} pCallback 
     * @param {Pointer<IUnknown>} pState 
     * @returns {HRESULT} 
     */
    BeginRegisterPlatformWorkQueueWithMMCSS(dwPlatformWorkQueue, wszClass, dwTaskId, pCallback, pState) {
        wszClass := wszClass is String ? StrPtr(wszClass) : wszClass

        result := ComCall(9, this, "uint", dwPlatformWorkQueue, "ptr", wszClass, "uint", dwTaskId, "ptr", pCallback, "ptr", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAsyncResult>} pResult 
     * @param {Pointer<UInt32>} pdwTaskId 
     * @returns {HRESULT} 
     */
    EndRegisterPlatformWorkQueueWithMMCSS(pResult, pdwTaskId) {
        result := ComCall(10, this, "ptr", pResult, "uint*", pdwTaskId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwPlatformWorkQueue 
     * @param {Pointer<IMFAsyncCallback>} pCallback 
     * @param {Pointer<IUnknown>} pState 
     * @returns {HRESULT} 
     */
    BeginUnregisterPlatformWorkQueueWithMMCSS(dwPlatformWorkQueue, pCallback, pState) {
        result := ComCall(11, this, "uint", dwPlatformWorkQueue, "ptr", pCallback, "ptr", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAsyncResult>} pResult 
     * @returns {HRESULT} 
     */
    EndUnregisterPlatformWorkQueueWithMMCSS(pResult) {
        result := ComCall(12, this, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwPlatformWorkQueueId 
     * @param {PWSTR} pwszClass 
     * @param {Pointer<UInt32>} pcchClass 
     * @returns {HRESULT} 
     */
    GetPlaftormWorkQueueMMCSSClass(dwPlatformWorkQueueId, pwszClass, pcchClass) {
        pwszClass := pwszClass is String ? StrPtr(pwszClass) : pwszClass

        result := ComCall(13, this, "uint", dwPlatformWorkQueueId, "ptr", pwszClass, "uint*", pcchClass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwPlatformWorkQueueId 
     * @param {Pointer<UInt32>} pdwTaskId 
     * @returns {HRESULT} 
     */
    GetPlatformWorkQueueMMCSSTaskId(dwPlatformWorkQueueId, pdwTaskId) {
        result := ComCall(14, this, "uint", dwPlatformWorkQueueId, "uint*", pdwTaskId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
