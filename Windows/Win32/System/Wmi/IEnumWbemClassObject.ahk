#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumWbemClassObject.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IEnumWbemClassObject interface is used to enumerate Common Information Model (CIM) objects and is similar to a standard COM enumerator.
 * @remarks
 * 
 * <b>IEnumWbemClassObject</b> is the object returned from a WMI query, and is used to enumerate through the returned values. For more information on how to use this class, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/querying-wmi">Querying WMI</a> and <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/enumerating-wmi">Enumerating WMI</a>.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-ienumwbemclassobject
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IEnumWbemClassObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumWbemClassObject
     * @type {Guid}
     */
    static IID => Guid("{027947e1-d731-11ce-a357-000000000001}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset", "Next", "NextAsync", "Clone", "Skip"]

    /**
     * The IEnumWbemClassObject::Reset method resets an enumeration sequence back to the beginning. Because CIM objects are dynamic, calling this method does not necessarily return the same list of objects that you obtained previously.
     * @returns {HRESULT} The 
     * <b>Reset</b> method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-ienumwbemclassobject-reset
     */
    Reset() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Use the IEnumWbemClassObject::Next method to get one or more objects starting at the current position in an enumeration.
     * @param {Integer} lTimeout Specifies the maximum amount of time in milliseconds that the call blocks before returning. If you use the 
     *       constant <b>WBEM_INFINITE</b> (0xFFFFFFFF), the call blocks until objects are available. If 
     *       you use the value 0 (<b>WBEM_NO_WAIT</b>), the call returns immediately, whether any objects 
     *       are available or not.
     * @param {Integer} uCount Number of requested objects.
     * @param {Pointer<IWbemClassObject>} apObjects Pointer to enough storage to hold the number of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> interface pointers specified by 
     *       <i>uCount</i>. This storage must be supplied by the caller. This parameter cannot be 
     *       <b>NULL</b>. The caller must call <b>Release</b> on each of the received 
     *       interface pointers when they are no longer needed.
     * @param {Pointer<Integer>} puReturned Pointer to a <b>ULONG</b> that receives the number of objects returned. This number can 
     *        be less than the number requested in <i>uCount</i>. This pointer cannot be 
     *        <b>NULL</b>.
     * 
     * <div class="alert"><b>Note</b>  The <b>Next</b> method returns 
     *        <b>WBEM_S_FALSE</b> when you have reached the end of the enumeration, even if objects have 
     *        been returned successfully. The <b>WBEM_S_NO_ERROR</b> value returns only when the number of 
     *        objects returned matches the number requested in <i>uCount</i>. The 
     *        <b>WBEM_S_TIMEDOUT</b> value is returned when the number of objects returned is less than 
     *        the number requested but you are not at the end of the enumeration. Therefore, you should use loop termination 
     *        logic that examines the <i>puReturned</i> value to ensure that you have reached the end of 
     *        the enumeration.</div>
     * <div> </div>
     * @returns {HRESULT} The <b>Next</b> method returns an <b>HRESULT</b> indicating 
     *       the status of the method call. The following list lists the value contained within an 
     *       <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-ienumwbemclassobject-next
     */
    Next(lTimeout, uCount, apObjects, puReturned) {
        puReturnedMarshal := puReturned is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "int", lTimeout, "uint", uCount, "ptr*", apObjects, puReturnedMarshal, puReturned, "int")
        return result
    }

    /**
     * Use the NextAsync method when a controlled asynchronous retrieval of objects to a sink is required.
     * @param {Integer} uCount Number of objects being requested.
     * @param {IWbemObjectSink} pSink Sink to receive the objects. The sink must be implemented by the caller. As each batch of objects is requested, they are delivered to the <i>pSink</i> parameter of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">Indicate</a> method followed by a final call to the <i>pSink</i>parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">SetStatus</a> method. If the sink is going to be used to deliver objects, this method returns <b>WBEM_S_NO_ERROR</b>, even if the number of objects to be delivered is less than requested. However, if there are no more objects remaining, then the <i>pSink</i> parameter is ignored (no calls to the <i>pSink</i>parameter of <b>SetStatus</b> are made). Instead, this method returns <b>WBEM_S_FALSE</b>.
     * @returns {HRESULT} The 
     * <b>NextAsync</b> method returns an <b>HRESULT</b> that indicates the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-ienumwbemclassobject-nextasync
     */
    NextAsync(uCount, pSink) {
        result := ComCall(5, this, "uint", uCount, "ptr", pSink, "int")
        return result
    }

    /**
     * The IEnumWbemClassObject::Clone method makes a logical copy of the entire enumerator, retaining its current position in an enumeration.
     * @returns {IEnumWbemClassObject} Receives a pointer to a new 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-ienumwbemclassobject">IEnumWbemClassObject</a> object. The caller must call 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> when the interface pointer is no longer 
     *       required. On error, there will not be a return of a new object.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-ienumwbemclassobject-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumWbemClassObject(ppEnum)
    }

    /**
     * You can use the IEnumWbemClassObject::Skip method to move the current position in an enumeration ahead by a specified number of objects. Also, this affects subsequent calls to NextAsync, but it does not affect pending deliveries begun with NextAsync.
     * @param {Integer} lTimeout Maximum amount of time in milliseconds that the call to 
     * <b>Skip</b> blocks before returning. If you use the constant <b>WBEM_INFINITE</b> (0xFFFFFFFF), the call blocks until the operation succeeds. If 
     * <b>Skip</b> cannot complete the operation before the <i>lTimeout</i> value expires, the call returns <b>WBEM_S_TIMEDOUT</b>.
     * @param {Integer} nCount Number of objects to skip. If this parameter is greater than the number of objects left to enumerate, then this call skips to the end of the enumeration and <b>WBEM_S_FALSE</b> is returned.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-ienumwbemclassobject-skip
     */
    Skip(lTimeout, nCount) {
        result := ComCall(7, this, "int", lTimeout, "uint", nCount, "int")
        return result
    }
}
