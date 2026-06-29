#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITRequest interface allows an application to use Assisted Telephony. Assisted Telephony provides telephony-enabled applications with a simple mechanism for making phone calls without requiring the developer to become fully literate in telephony.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itrequest
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITRequest extends IDispatch {
    /**
     * The interface identifier for ITRequest
     * @type {Guid}
     */
    static IID := Guid("{ac48ffdf-f8c4-11d1-a030-00c04fb6809f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITRequest interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        MakeCall : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITRequest.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The MakeCall method makes a call to the designated party.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> to allocate memory for the <i>pDestAddress, pAppName, pCalledParty,</i> and <i>pComment</i> parameters. The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory when the variables are no longer needed.
     * @param {BSTR} pDestAddress Pointer to a <b>BSTR</b> containing the destination address for the call.
     * @param {BSTR} pAppName Pointer to a <b>BSTR</b> containing the name of the application.
     * @param {BSTR} pCalledParty Pointer to a <b>BSTR</b> containing the called party name.
     * @param {BSTR} pComment Pointer to a <b>BSTR</b> containing a comment.
     * @returns {HRESULT} This method can return one of these values.
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPIERR_NOREQUESTRECIPIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No application exists that can handle the assisted telephony request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPIERR_INVALDESTADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The destination address is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPIERR_REQUESTQUEUEFULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TAPI Server request queue is full and cannot handle another assisted telephony request.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itrequest-makecall
     */
    MakeCall(pDestAddress, pAppName, pCalledParty, pComment) {
        pDestAddress := pDestAddress is String ? BSTR.Alloc(pDestAddress).Value : pDestAddress
        pAppName := pAppName is String ? BSTR.Alloc(pAppName).Value : pAppName
        pCalledParty := pCalledParty is String ? BSTR.Alloc(pCalledParty).Value : pCalledParty
        pComment := pComment is String ? BSTR.Alloc(pComment).Value : pComment

        result := ComCall(7, this, BSTR, pDestAddress, BSTR, pAppName, BSTR, pCalledParty, BSTR, pComment, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITRequest.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MakeCall := CallbackCreate(GetMethod(implObj, "MakeCall"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MakeCall)
    }
}
