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
     * Registers the topology work queues with the Multimedia Class Scheduler Service (MMCSS).
     * @param {IMFAsyncCallback} pCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} pState A pointer to the <b>IUnknown</b> interface of a state object defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfworkqueueservices-beginregistertopologyworkqueueswithmmcss
     */
    BeginRegisterTopologyWorkQueuesWithMMCSS(pCallback, pState) {
        result := ComCall(3, this, "ptr", pCallback, "ptr", pState, "HRESULT")
        return result
    }

    /**
     * Completes an asynchronous request to register the topology work queues with the Multimedia Class Scheduler Service (MMCSS).
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfworkqueueservices-endregistertopologyworkqueueswithmmcss
     */
    EndRegisterTopologyWorkQueuesWithMMCSS(pResult) {
        result := ComCall(4, this, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * Unregisters the topology work queues from the Multimedia Class Scheduler Service (MMCSS).
     * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} pState Pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfworkqueueservices-beginunregistertopologyworkqueueswithmmcss
     */
    BeginUnregisterTopologyWorkQueuesWithMMCSS(pCallback, pState) {
        result := ComCall(5, this, "ptr", pCallback, "ptr", pState, "HRESULT")
        return result
    }

    /**
     * Completes an asynchronous request to unregister the topology work queues from the Multimedia Class Scheduler Service (MMCSS).
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfworkqueueservices-endunregistertopologyworkqueueswithmmcss
     */
    EndUnregisterTopologyWorkQueuesWithMMCSS(pResult) {
        result := ComCall(6, this, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * Retrieves the Multimedia Class Scheduler Service (MMCSS) class for a specified branch of the current topology.
     * @param {Integer} dwTopologyWorkQueueId Identifies the work queue assigned to this topology branch. The application defines this value by setting the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-toponode-workqueue-id-attribute">MF_TOPONODE_WORKQUEUE_ID</a> attribute on the source node for the branch.
     * @param {PWSTR} pwszClass Pointer to a buffer that receives the name of the MMCSS class. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} pcchClass On input, specifies the size of the <i>pwszClass</i> buffer, in characters. On output, receives the required size of the buffer, in characters. The size includes the terminating null character.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no work queue with the specified identifier.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pwszClass</i> buffer is too small to receive the class name.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfworkqueueservices-gettopologyworkqueuemmcssclass
     */
    GetTopologyWorkQueueMMCSSClass(dwTopologyWorkQueueId, pwszClass, pcchClass) {
        pwszClass := pwszClass is String ? StrPtr(pwszClass) : pwszClass

        pcchClassMarshal := pcchClass is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", dwTopologyWorkQueueId, "ptr", pwszClass, pcchClassMarshal, pcchClass, "HRESULT")
        return result
    }

    /**
     * Retrieves the Multimedia Class Scheduler Service (MMCSS) task identifier for a specified branch of the current topology.
     * @param {Integer} dwTopologyWorkQueueId Identifies the work queue assigned to this topology branch. The application defines this value by setting the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-toponode-workqueue-id-attribute">MF_TOPONODE_WORKQUEUE_ID</a> attribute on the source node for the branch.
     * @returns {Integer} Receives the task identifier.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfworkqueueservices-gettopologyworkqueuemmcsstaskid
     */
    GetTopologyWorkQueueMMCSSTaskId(dwTopologyWorkQueueId) {
        result := ComCall(8, this, "uint", dwTopologyWorkQueueId, "uint*", &pdwTaskId := 0, "HRESULT")
        return pdwTaskId
    }

    /**
     * Associates a platform work queue with a Multimedia Class Scheduler Service (MMCSS) task.
     * @param {Integer} dwPlatformWorkQueue The platform work queue to register with MMCSS. See <a href="https://docs.microsoft.com/windows/desktop/medfound/work-queue-identifiers">Work Queue Identifiers</a>.
     *           To register all of the standard work queues to the same MMCSS task, set this parameter to <b>MFASYNC_CALLBACK_QUEUE_ALL</b>.
     * @param {PWSTR} wszClass The name of the MMCSS task to be performed.
     * @param {Integer} dwTaskId The unique task identifier. To obtain a new task identifier, set this value to zero.
     * @param {IMFAsyncCallback} pCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} pState A pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfworkqueueservices-beginregisterplatformworkqueuewithmmcss
     */
    BeginRegisterPlatformWorkQueueWithMMCSS(dwPlatformWorkQueue, wszClass, dwTaskId, pCallback, pState) {
        wszClass := wszClass is String ? StrPtr(wszClass) : wszClass

        result := ComCall(9, this, "uint", dwPlatformWorkQueue, "ptr", wszClass, "uint", dwTaskId, "ptr", pCallback, "ptr", pState, "HRESULT")
        return result
    }

    /**
     * Completes an asynchronous request to associate a platform work queue with a Multimedia Class Scheduler Service (MMCSS) task.
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
     * @returns {Integer} The unique task identifier.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfworkqueueservices-endregisterplatformworkqueuewithmmcss
     */
    EndRegisterPlatformWorkQueueWithMMCSS(pResult) {
        result := ComCall(10, this, "ptr", pResult, "uint*", &pdwTaskId := 0, "HRESULT")
        return pdwTaskId
    }

    /**
     * Unregisters a platform work queue from a Multimedia Class Scheduler Service (MMCSS) task.
     * @param {Integer} dwPlatformWorkQueue Platform work queue to register with MMCSS. See <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfworkqueueservices-beginregisterplatformworkqueuewithmmcss">IMFWorkQueueServices::BeginRegisterPlatformWorkQueueWithMMCSS</a>.
     * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} pState Pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfworkqueueservices-beginunregisterplatformworkqueuewithmmcss
     */
    BeginUnregisterPlatformWorkQueueWithMMCSS(dwPlatformWorkQueue, pCallback, pState) {
        result := ComCall(11, this, "uint", dwPlatformWorkQueue, "ptr", pCallback, "ptr", pState, "HRESULT")
        return result
    }

    /**
     * Completes an asynchronous request to unregister a platform work queue from a Multimedia Class Scheduler Service (MMCSS) task.
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfworkqueueservices-endunregisterplatformworkqueuewithmmcss
     */
    EndUnregisterPlatformWorkQueueWithMMCSS(pResult) {
        result := ComCall(12, this, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * Retrieves the Multimedia Class Scheduler Service (MMCSS) class for a specified platform work queue.
     * @param {Integer} dwPlatformWorkQueueId Platform work queue to query. See <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfworkqueueservices-beginregisterplatformworkqueuewithmmcss">IMFWorkQueueServices::BeginRegisterPlatformWorkQueueWithMMCSS</a>.
     * @param {PWSTR} pwszClass Pointer to a buffer that receives the name of the MMCSS class. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} pcchClass On input, specifies the size of the pwszClass buffer, in characters. On output, receives the required size of the buffer, in characters. The size includes the terminating null character.
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
     * <dt><b>MF_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pwszClass</i> buffer is too small to receive the class name.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfworkqueueservices-getplaftormworkqueuemmcssclass
     */
    GetPlaftormWorkQueueMMCSSClass(dwPlatformWorkQueueId, pwszClass, pcchClass) {
        pwszClass := pwszClass is String ? StrPtr(pwszClass) : pwszClass

        pcchClassMarshal := pcchClass is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", dwPlatformWorkQueueId, "ptr", pwszClass, pcchClassMarshal, pcchClass, "HRESULT")
        return result
    }

    /**
     * Retrieves the Multimedia Class Scheduler Service (MMCSS) task identifier for a specified platform work queue.
     * @param {Integer} dwPlatformWorkQueueId Platform work queue to query. See <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfworkqueueservices-beginregisterplatformworkqueuewithmmcss">IMFWorkQueueServices::BeginRegisterPlatformWorkQueueWithMMCSS</a>.
     * @returns {Integer} Receives the task identifier.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfworkqueueservices-getplatformworkqueuemmcsstaskid
     */
    GetPlatformWorkQueueMMCSSTaskId(dwPlatformWorkQueueId) {
        result := ComCall(14, this, "uint", dwPlatformWorkQueueId, "uint*", &pdwTaskId := 0, "HRESULT")
        return pdwTaskId
    }
}
