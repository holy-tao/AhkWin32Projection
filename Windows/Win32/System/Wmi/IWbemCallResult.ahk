#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWbemClassObject.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWbemServices.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used for semisynchronous calls of the IWbemServices interface. When making such calls, the called IWbemServices method returns immediately, along with an IWbemCallResult object.
 * @see https://learn.microsoft.com/windows/win32/api//content/wbemcli/nn-wbemcli-iwbemcallresult
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemCallResult extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemCallResult
     * @type {Guid}
     */
    static IID => Guid("{44aca675-e8fc-11d0-a07c-00c04fb68820}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetResultObject", "GetResultString", "GetResultServices", "GetCallStatus"]

    /**
     * The IWbemCallResult::GetResultObject method attempts to retrieve an object from a previous semisynchronous call to IWbemServices::GetObject or IWbemServices::ExecMethod.
     * @param {Integer} lTimeout Specifies the maximum time in milliseconds that this call blocks before returning. If you use the constant <b>WBEM_INFINITE</b> (0xFFFFFFFF), the call blocks until the object is available. If you use 0, the call immediately returns either the object or a status code.
     * @returns {IWbemClassObject} This parameter cannot be <b>NULL</b>. It receives the copy of the object when it becomes available. You must call <b>IWbemClassObject::Release</b> on the returned object when the object is no longer required. A new object is not returned on error.
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemcli/nf-wbemcli-iwbemcallresult-getresultobject
     */
    GetResultObject(lTimeout) {
        result := ComCall(3, this, "int", lTimeout, "ptr*", &ppResultObject := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWbemClassObject(ppResultObject)
    }

    /**
     * The IWbemCallResult::GetResultString method returns the assigned object path of an instance newly created by IWbemServices::PutInstance.
     * @param {Integer} lTimeout Specifies the maximum time in milliseconds that this call blocks before returning. If you use the constant <b>WBEM_INFINITE</b> (0xFFFFFFFF), the call blocks until the object path is available. If you use 0, the call immediately returns either the object path or a status code.
     * @returns {BSTR} Cannot be <b>NULL</b>. This parameter receives a pointer to the object path, which, in turn, leads to the newly created object. The returned string must be deallocated using the system call <i>SysFreeString</i>. On error, a new string is not returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemcli/nf-wbemcli-iwbemcallresult-getresultstring
     */
    GetResultString(lTimeout) {
        pstrResultString := BSTR()
        result := ComCall(4, this, "int", lTimeout, "ptr", pstrResultString, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstrResultString
    }

    /**
     * Retrieves the IWbemServices pointer, which results from a semisynchronous call to IWbemServices::OpenNamespace when it becomes available.
     * @param {Integer} lTimeout The maximum time in milliseconds that this call blocks before it returns. If you use the constant <b>WBEM_INFINITE</b> (0xFFFFFFFF), the call blocks until the interface pointer is available. If you use 0, the call immediately returns either the pointer or a status code.
     * @returns {IWbemServices} Cannot be <b>NULL</b>. It receives a pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> interface requested by the original call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-opennamespace">OpenNamespace</a> when it becomes available The caller must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IWbemServices::Release</a> on the returned object when it is no longer required.
     * 
     * On error, a new object is not returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemcli/nf-wbemcli-iwbemcallresult-getresultservices
     */
    GetResultServices(lTimeout) {
        result := ComCall(5, this, "int", lTimeout, "ptr*", &ppServices := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWbemServices(ppServices)
    }

    /**
     * The IWbemCallResult::GetCallStatus method returns to the user the status of the current outstanding semisynchronous call. When this call returns WBEM_S_NO_ERROR, the original call to the IWbemServices method is complete.
     * @remarks
     * On error, you can call the COM function <b>GetErrorInfo</b> to obtain more error information. COM-specific error codes may also be returned if network problems cause you to lose the remote connection to Windows Management.
     * 
     * After invoking an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> method semisynchronously, you can call 
     * <b>GetCallStatus</b> at any time to determine whether the call is complete. After 
     * <b>GetCallStatus</b> has returned <b>WBEM_S_NO_ERROR</b>, which indicates completion of the original 
     * <b>IWbemServices</b> operation, calls to other 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcallresult">IWbemCallResult</a> methods may be required to retrieve the result of the call, according to the following rules:
     * 
     * <ul>
     * <li>For 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-opennamespace">IWbemServices::OpenNamespace</a>, the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemcallresult-getresultservices">GetResultServices</a> method must be called to retrieve the new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> pointer.</li>
     * <li>For 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-putinstance">IWbemServices::PutInstance</a>, the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemcallresult-getresultstring">GetResultString</a> method must be called to obtain the object path that was assigned to the object.</li>
     * <li>For 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-getobject">IWbemServices::GetObject</a>, the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemcallresult-getresultobject">GetResultObject</a> method must be called to retrieve the object.</li>
     * <li>For the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> methods 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-deleteinstance">DeleteInstance</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-deleteclass">DeleteClass</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-execmethod">ExecMethod</a>, the 
     * <b>GetCallStatus</b> method is the only call that returns information regarding these operations.</li>
     * </ul>
     * @param {Integer} lTimeout Specifies the maximum time in milliseconds that this call blocks before it returns. If you use the constant <b>WBEM_INFINITE</b> (0xFFFFFFFF), the call blocks until the original semisynchronous call to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> method is complete. If you use 0 (zero), the call immediately returns the call status.
     * @returns {Integer} If <b>WBEM_S_NO_ERROR</b> returns in the HRESULT to this method, this parameter will receive the final result status of a call to one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> methods: 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-opennamespace">OpenNamespace</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-putinstance">PutInstance</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-putclass">PutClass</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-getobject">GetObject</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-deleteinstance">DeleteInstance</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-deleteclass">DeleteClass</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-execmethod">ExecMethod</a>. On error, the value pointed to by <i>plStatus</i> will not be used.
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemcli/nf-wbemcli-iwbemcallresult-getcallstatus
     */
    GetCallStatus(lTimeout) {
        result := ComCall(6, this, "int", lTimeout, "int*", &plStatus := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plStatus
    }
}
