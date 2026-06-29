#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\RND_ADVERTISING_SCOPE.ahk" { RND_ADVERTISING_SCOPE }

/**
 * The ITDirectoryObjectConference interface provides methods that allow an application to set and get conference details. The ITDirectoryObjectConference interface is created by calling QueryInterface on ITDirectoryObject.
 * @see https://learn.microsoft.com/windows/win32/api/rend/nn-rend-itdirectoryobjectconference
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITDirectoryObjectConference extends IDispatch {
    /**
     * The interface identifier for ITDirectoryObjectConference
     * @type {Guid}
     */
    static IID := Guid("{f1029e5d-cb5b-11d0-8d59-00c04fd91ac0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITDirectoryObjectConference interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Protocol         : IntPtr
        get_Originator       : IntPtr
        put_Originator       : IntPtr
        get_AdvertisingScope : IntPtr
        put_AdvertisingScope : IntPtr
        get_Url              : IntPtr
        put_Url              : IntPtr
        get_Description      : IntPtr
        put_Description      : IntPtr
        get_IsEncrypted      : IntPtr
        put_IsEncrypted      : IntPtr
        get_StartTime        : IntPtr
        put_StartTime        : IntPtr
        get_StopTime         : IntPtr
        put_StopTime         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITDirectoryObjectConference.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Protocol {
        get => this.get_Protocol()
    }

    /**
     * @type {BSTR} 
     */
    Originator {
        get => this.get_Originator()
        set => this.put_Originator(value)
    }

    /**
     * @type {RND_ADVERTISING_SCOPE} 
     */
    AdvertisingScope {
        get => this.get_AdvertisingScope()
        set => this.put_AdvertisingScope(value)
    }

    /**
     * @type {BSTR} 
     */
    Url {
        get => this.get_Url()
        set => this.put_Url(value)
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsEncrypted {
        get => this.get_IsEncrypted()
        set => this.put_IsEncrypted(value)
    }

    /**
     * @type {Float} 
     */
    StartTime {
        get => this.get_StartTime()
        set => this.put_StartTime(value)
    }

    /**
     * @type {Float} 
     */
    StopTime {
        get => this.get_StopTime()
        set => this.put_StopTime(value)
    }

    /**
     * The get_Protocol method gets protocol identification.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppProtocol</i> parameter.
     * @returns {BSTR} Pointer to a <b>BSTR</b> containing the protocol identifier.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-get_protocol
     */
    get_Protocol() {
        ppProtocol := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, ppProtocol, "HRESULT")
        return ppProtocol
    }

    /**
     * The get_Originator method gets the originator's user name.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppOriginator</i> parameter.
     * 
     * The originator's name, along with the machine name set in 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/itsdp-put-machineaddress">put_MachineAddress</a>, are collectively the originator of the conference, and both are in the o= line of the SDP.
     * @returns {BSTR} Pointer to a <b>BSTR</b> containing the originator's user name.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-get_originator
     */
    get_Originator() {
        ppOriginator := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, ppOriginator, "HRESULT")
        return ppOriginator
    }

    /**
     * The put_Originator method sets the originator's user name.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> to allocate memory for the <i>pOriginator</i> parameter and use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory when the variable is no longer needed.
     * 
     * The originator's name, along with the machine name set in 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/itsdp-put-machineaddress">put_MachineAddress</a>, are collectively the originator of the conference, and both are in the o= line of the SDP.
     * @param {BSTR} pOriginator Pointer to a <b>BSTR</b> containing the originator's user name.
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
     * The <i>pOriginator</i> parameter is not a valid pointer.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not yet implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-put_originator
     */
    put_Originator(pOriginator) {
        pOriginator := pOriginator is String ? BSTR.Alloc(pOriginator).Value : pOriginator

        result := ComCall(9, this, BSTR, pOriginator, "HRESULT")
        return result
    }

    /**
     * The get_AdvertisingScope method gets the advertising scope.
     * @returns {RND_ADVERTISING_SCOPE} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/ne-rend-rnd_advertising_scope">RND_ADVERTISING_SCOPE</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-get_advertisingscope
     */
    get_AdvertisingScope() {
        result := ComCall(10, this, "int*", &pAdvertisingScope := 0, "HRESULT")
        return pAdvertisingScope
    }

    /**
     * The put_AdvertisingScope method sets the advertising scope.
     * @remarks
     * This function may send data over the wire in unencrypted form; therefore, someone eavesdropping on the network may be able to read the data. The security risk of sending the data in clear text should be considered before using this method.
     * @param {RND_ADVERTISING_SCOPE} AdvertisingScope Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/ne-rend-rnd_advertising_scope">RND_ADVERTISING_SCOPE</a> enumeration.
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
     * The <i>AdvertisingScope</i> parameter is not valid.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not yet implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-put_advertisingscope
     */
    put_AdvertisingScope(AdvertisingScope) {
        result := ComCall(11, this, RND_ADVERTISING_SCOPE, AdvertisingScope, "HRESULT")
        return result
    }

    /**
     * The get_Url method gets a URL.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppUrl</i> parameter.
     * @returns {BSTR} Pointer to a <b>BSTR</b> containing the URL.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-get_url
     */
    get_Url() {
        ppUrl := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, ppUrl, "HRESULT")
        return ppUrl
    }

    /**
     * The put_Url method sets a URL.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> to allocate memory for the <i>pUrl</i> parameter and use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory when the variable is no longer needed.
     * 
     * This function may send data over the wire in unencrypted form; therefore, someone eavesdropping on the network may be able to read the data. The security risk of sending the data in clear text should be considered before using this method.
     * @param {BSTR} pUrl Pointer to a <b>BSTR</b> containing the URL.
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
     * The <i>pUrl</i> parameter is not a valid pointer.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not yet implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-put_url
     */
    put_Url(pUrl) {
        pUrl := pUrl is String ? BSTR.Alloc(pUrl).Value : pUrl

        result := ComCall(13, this, BSTR, pUrl, "HRESULT")
        return result
    }

    /**
     * The get_Description method gets the description of the conference.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppDescription</i> parameter.
     * @returns {BSTR} Pointer to a <b>BSTR</b> containing the description of the conference.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-get_description
     */
    get_Description() {
        ppDescription := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, ppDescription, "HRESULT")
        return ppDescription
    }

    /**
     * The put_Description method sets the description of the conference.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> to allocate memory for the <i>pDescription</i> parameter and use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory when the variable is no longer needed.
     * 
     * This function may send data over the wire in unencrypted form; therefore, someone eavesdropping on the network may be able to read the data. The security risk of sending the data in clear text should be considered before using this method.
     * @param {BSTR} pDescription Pointer to a <b>BSTR</b> containing the description of the conference.
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
     * The <i>pDescription</i> parameter is not a valid pointer.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not yet implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-put_description
     */
    put_Description(pDescription) {
        pDescription := pDescription is String ? BSTR.Alloc(pDescription).Value : pDescription

        result := ComCall(15, this, BSTR, pDescription, "HRESULT")
        return result
    }

    /**
     * The get_IsEncrypted method gets whether the conference is encrypted.
     * @returns {VARIANT_BOOL} Pointer to whether the conference is encrypted.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-get_isencrypted
     */
    get_IsEncrypted() {
        result := ComCall(16, this, VARIANT_BOOL.Ptr, &pfEncrypted := 0, "HRESULT")
        return pfEncrypted
    }

    /**
     * The put_IsEncrypted method sets whether the conference is encrypted.
     * @param {VARIANT_BOOL} fEncrypted Indicator of whether the conference is encrypted.
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
     * The <i>fEncrypted</i> parameter is not valid.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not yet implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-put_isencrypted
     */
    put_IsEncrypted(fEncrypted) {
        result := ComCall(17, this, VARIANT_BOOL, fEncrypted, "HRESULT")
        return result
    }

    /**
     * The get_StartTime method gets the start time of the conference.
     * @returns {Float} Pointer to the conference start time.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-get_starttime
     */
    get_StartTime() {
        result := ComCall(18, this, "double*", &pDate := 0, "HRESULT")
        return pDate
    }

    /**
     * The put_StartTime method sets the start time of the conference.
     * @param {Float} Date Conference start time.
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
     * The <i>Date</i> parameter is not valid.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not yet implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-put_starttime
     */
    put_StartTime(Date) {
        result := ComCall(19, this, "double", Date, "HRESULT")
        return result
    }

    /**
     * The get_StopTime method gets the stop time of the conference. If the end time is zero, the session is not bounded.
     * @returns {Float} Pointer to the conference stop time.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-get_stoptime
     */
    get_StopTime() {
        result := ComCall(20, this, "double*", &pDate := 0, "HRESULT")
        return pDate
    }

    /**
     * The put_StopTime method sets the stop time of the conference. If the end time is zero, the session is not bounded.
     * @remarks
     * This function may send data over the wire in unencrypted form; therefore, someone eavesdropping on the network may be able to read the data. The security risk of sending the data in clear text should be considered before using this method.
     * @param {Float} Date Conference stop time.
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
     * The <i>Date</i> parameter is not valid.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not yet implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-put_stoptime
     */
    put_StopTime(Date) {
        result := ComCall(21, this, "double", Date, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITDirectoryObjectConference.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Protocol := CallbackCreate(GetMethod(implObj, "get_Protocol"), flags, 2)
        this.vtbl.get_Originator := CallbackCreate(GetMethod(implObj, "get_Originator"), flags, 2)
        this.vtbl.put_Originator := CallbackCreate(GetMethod(implObj, "put_Originator"), flags, 2)
        this.vtbl.get_AdvertisingScope := CallbackCreate(GetMethod(implObj, "get_AdvertisingScope"), flags, 2)
        this.vtbl.put_AdvertisingScope := CallbackCreate(GetMethod(implObj, "put_AdvertisingScope"), flags, 2)
        this.vtbl.get_Url := CallbackCreate(GetMethod(implObj, "get_Url"), flags, 2)
        this.vtbl.put_Url := CallbackCreate(GetMethod(implObj, "put_Url"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.get_IsEncrypted := CallbackCreate(GetMethod(implObj, "get_IsEncrypted"), flags, 2)
        this.vtbl.put_IsEncrypted := CallbackCreate(GetMethod(implObj, "put_IsEncrypted"), flags, 2)
        this.vtbl.get_StartTime := CallbackCreate(GetMethod(implObj, "get_StartTime"), flags, 2)
        this.vtbl.put_StartTime := CallbackCreate(GetMethod(implObj, "put_StartTime"), flags, 2)
        this.vtbl.get_StopTime := CallbackCreate(GetMethod(implObj, "get_StopTime"), flags, 2)
        this.vtbl.put_StopTime := CallbackCreate(GetMethod(implObj, "put_StopTime"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Protocol)
        CallbackFree(this.vtbl.get_Originator)
        CallbackFree(this.vtbl.put_Originator)
        CallbackFree(this.vtbl.get_AdvertisingScope)
        CallbackFree(this.vtbl.put_AdvertisingScope)
        CallbackFree(this.vtbl.get_Url)
        CallbackFree(this.vtbl.put_Url)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.get_IsEncrypted)
        CallbackFree(this.vtbl.put_IsEncrypted)
        CallbackFree(this.vtbl.get_StartTime)
        CallbackFree(this.vtbl.put_StartTime)
        CallbackFree(this.vtbl.get_StopTime)
        CallbackFree(this.vtbl.put_StopTime)
    }
}
