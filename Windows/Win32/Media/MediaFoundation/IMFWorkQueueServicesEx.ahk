#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFWorkQueueServices.ahk

/**
 * Extends the IMFWorkQueueServices interface.
 * @remarks
 * 
  * This interface allows applications to control
  * both platform and topology work queues.
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfworkqueueservices">IMFWorkQueueServices</a> can be obtained from the session by querying     for the <b>MF_WORKQUEUE_SERVICES</b> service.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfworkqueueservicesex
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFWorkQueueServicesEx extends IMFWorkQueueServices{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFWorkQueueServicesEx
     * @type {Guid}
     */
    static IID => Guid("{96bf961b-40fe-42f1-ba9d-320238b49700}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTopologyWorkQueueMMCSSPriority", "BeginRegisterPlatformWorkQueueWithMMCSSEx", "GetPlatformWorkQueueMMCSSPriority"]

    /**
     * 
     * @param {Integer} dwTopologyWorkQueueId 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfworkqueueservicesex-gettopologyworkqueuemmcsspriority
     */
    GetTopologyWorkQueueMMCSSPriority(dwTopologyWorkQueueId) {
        result := ComCall(15, this, "uint", dwTopologyWorkQueueId, "int*", &plPriority := 0, "HRESULT")
        return plPriority
    }

    /**
     * 
     * @param {Integer} dwPlatformWorkQueue 
     * @param {PWSTR} wszClass 
     * @param {Integer} dwTaskId 
     * @param {Integer} lPriority 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} pState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfworkqueueservicesex-beginregisterplatformworkqueuewithmmcssex
     */
    BeginRegisterPlatformWorkQueueWithMMCSSEx(dwPlatformWorkQueue, wszClass, dwTaskId, lPriority, pCallback, pState) {
        wszClass := wszClass is String ? StrPtr(wszClass) : wszClass

        result := ComCall(16, this, "uint", dwPlatformWorkQueue, "ptr", wszClass, "uint", dwTaskId, "int", lPriority, "ptr", pCallback, "ptr", pState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwPlatformWorkQueueId 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfworkqueueservicesex-getplatformworkqueuemmcsspriority
     */
    GetPlatformWorkQueueMMCSSPriority(dwPlatformWorkQueueId) {
        result := ComCall(17, this, "uint", dwPlatformWorkQueueId, "int*", &plPriority := 0, "HRESULT")
        return plPriority
    }
}
