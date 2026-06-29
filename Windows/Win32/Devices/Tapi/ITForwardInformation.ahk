#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITForwardInformation interface provides methods for setup and implementation of call forwarding.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itforwardinformation
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITForwardInformation extends IDispatch {
    /**
     * The interface identifier for ITForwardInformation
     * @type {Guid}
     */
    static IID := Guid("{449f659e-88a3-11d1-bb5d-00c04fb6809f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITForwardInformation interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_NumRingsNoAnswer       : IntPtr
        get_NumRingsNoAnswer       : IntPtr
        SetForwardType             : IntPtr
        get_ForwardTypeDestination : IntPtr
        get_ForwardTypeCaller      : IntPtr
        GetForwardType             : IntPtr
        Clear                      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITForwardInformation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    NumRingsNoAnswer {
        get => this.get_NumRingsNoAnswer()
        set => this.put_NumRingsNoAnswer(value)
    }

    /**
     * The put_NumRingsNoAnswer method sets the number of rings after which a no answer condition is assumed.
     * @param {Integer} lNumRings Number of rings.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itforwardinformation-put_numringsnoanswer
     */
    put_NumRingsNoAnswer(lNumRings) {
        result := ComCall(7, this, "int", lNumRings, "HRESULT")
        return result
    }

    /**
     * The get_NumRingsNoAnswer method retrieves the number of rings after which a no answer condition is assumed.
     * @returns {Integer} Pointer to number of rings.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itforwardinformation-get_numringsnoanswer
     */
    get_NumRingsNoAnswer() {
        result := ComCall(8, this, "int*", &plNumRings := 0, "HRESULT")
        return plNumRings
    }

    /**
     * The SetForwardType method sets the forwarding mode and destination by caller address.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> to allocate memory for the <i>pDestAddress</i> and <i>pCallerAddress</i> parameters. The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory when the variables are no longer needed.
     * @param {Integer} ForwardType <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineforwardmode--constants">Line forward mode</a>.
     * @param {BSTR} pDestAddress Pointer to <b>BSTR</b> representation of destination address for forwarding.
     * @param {BSTR} pCallerAddress Pointer to <b>BSTR</b> representation of caller address.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pDestAddress</i> or <i>pCallerAddress</i> parameter is not a valid pointer.
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
     * The <i>ForwardType</i> parameter is not valid.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itforwardinformation-setforwardtype
     */
    SetForwardType(ForwardType, pDestAddress, pCallerAddress) {
        pDestAddress := pDestAddress is String ? BSTR.Alloc(pDestAddress).Value : pDestAddress
        pCallerAddress := pCallerAddress is String ? BSTR.Alloc(pCallerAddress).Value : pCallerAddress

        result := ComCall(9, this, "int", ForwardType, BSTR, pDestAddress, BSTR, pCallerAddress, "HRESULT")
        return result
    }

    /**
     * The get_ForwardTypeDestination method gets the destination for a forwarding mode.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppDestAddress</i> parameter.
     * @param {Integer} ForwardType <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineforwardmode--constants">Line forward mode</a>.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of destination address.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itforwardinformation-get_forwardtypedestination
     */
    get_ForwardTypeDestination(ForwardType) {
        ppDestAddress := BSTR.Owned()
        result := ComCall(10, this, "int", ForwardType, BSTR.Ptr, ppDestAddress, "HRESULT")
        return ppDestAddress
    }

    /**
     * The get_ForwardTypeCaller method gets the type of caller for a given forwarding mode.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppCallerAddress</i> parameter.
     * @param {Integer} Forwardtype <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineforwardmode--constants">Line forward mode</a>.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of caller address.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itforwardinformation-get_forwardtypecaller
     */
    get_ForwardTypeCaller(Forwardtype) {
        ppCallerAddress := BSTR.Owned()
        result := ComCall(11, this, "int", Forwardtype, BSTR.Ptr, ppCallerAddress, "HRESULT")
        return ppCallerAddress
    }

    /**
     * The GetForwardType method gets the forwarding mode.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppDestinationAddress</i> and <i>ppCallerAddress</i> parameters.
     * @param {Integer} ForwardType <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineforwardmode--constants">Line forward mode</a>.
     * @param {Pointer<BSTR>} ppDestinationAddress Pointer to <b>BSTR</b> representation of destination address.
     * @param {Pointer<BSTR>} ppCallerAddress Pointer to <b>BSTR</b> representation of the call originator's address.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ppDestAddress</i> or <i>ppCallerAddress</i> parameter is not a valid pointer.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itforwardinformation-getforwardtype
     */
    GetForwardType(ForwardType, ppDestinationAddress, ppCallerAddress) {
        result := ComCall(12, this, "int", ForwardType, BSTR.Ptr, ppDestinationAddress, BSTR.Ptr, ppCallerAddress, "HRESULT")
        return result
    }

    /**
     * The Clear method clears all forwarding information in this object.
     * @remarks
     * This method does not clear forwarding information in the service provider.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itforwardinformation-clear
     */
    Clear() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITForwardInformation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_NumRingsNoAnswer := CallbackCreate(GetMethod(implObj, "put_NumRingsNoAnswer"), flags, 2)
        this.vtbl.get_NumRingsNoAnswer := CallbackCreate(GetMethod(implObj, "get_NumRingsNoAnswer"), flags, 2)
        this.vtbl.SetForwardType := CallbackCreate(GetMethod(implObj, "SetForwardType"), flags, 4)
        this.vtbl.get_ForwardTypeDestination := CallbackCreate(GetMethod(implObj, "get_ForwardTypeDestination"), flags, 3)
        this.vtbl.get_ForwardTypeCaller := CallbackCreate(GetMethod(implObj, "get_ForwardTypeCaller"), flags, 3)
        this.vtbl.GetForwardType := CallbackCreate(GetMethod(implObj, "GetForwardType"), flags, 4)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_NumRingsNoAnswer)
        CallbackFree(this.vtbl.get_NumRingsNoAnswer)
        CallbackFree(this.vtbl.SetForwardType)
        CallbackFree(this.vtbl.get_ForwardTypeDestination)
        CallbackFree(this.vtbl.get_ForwardTypeCaller)
        CallbackFree(this.vtbl.GetForwardType)
        CallbackFree(this.vtbl.Clear)
    }
}
