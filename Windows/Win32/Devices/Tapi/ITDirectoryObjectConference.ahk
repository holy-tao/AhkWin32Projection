#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITDirectoryObjectConference interface provides methods that allow an application to set and get conference details. The ITDirectoryObjectConference interface is created by calling QueryInterface on ITDirectoryObject.
 * @see https://docs.microsoft.com/windows/win32/api//rend/nn-rend-itdirectoryobjectconference
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITDirectoryObjectConference extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITDirectoryObjectConference
     * @type {Guid}
     */
    static IID => Guid("{f1029e5d-cb5b-11d0-8d59-00c04fd91ac0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Protocol", "get_Originator", "put_Originator", "get_AdvertisingScope", "put_AdvertisingScope", "get_Url", "put_Url", "get_Description", "put_Description", "get_IsEncrypted", "put_IsEncrypted", "get_StartTime", "put_StartTime", "get_StopTime", "put_StopTime"]

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
     * @type {Integer} 
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
     * @returns {BSTR} Pointer to a <b>BSTR</b> containing the protocol identifier.
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectoryobjectconference-get_protocol
     */
    get_Protocol() {
        ppProtocol := BSTR()
        result := ComCall(7, this, "ptr", ppProtocol, "HRESULT")
        return ppProtocol
    }

    /**
     * The get_Originator method gets the originator's user name.
     * @returns {BSTR} Pointer to a <b>BSTR</b> containing the originator's user name.
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectoryobjectconference-get_originator
     */
    get_Originator() {
        ppOriginator := BSTR()
        result := ComCall(8, this, "ptr", ppOriginator, "HRESULT")
        return ppOriginator
    }

    /**
     * The put_Originator method sets the originator's user name.
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
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectoryobjectconference-put_originator
     */
    put_Originator(pOriginator) {
        pOriginator := pOriginator is String ? BSTR.Alloc(pOriginator).Value : pOriginator

        result := ComCall(9, this, "ptr", pOriginator, "HRESULT")
        return result
    }

    /**
     * The get_AdvertisingScope method gets the advertising scope.
     * @returns {Integer} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/ne-rend-rnd_advertising_scope">RND_ADVERTISING_SCOPE</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectoryobjectconference-get_advertisingscope
     */
    get_AdvertisingScope() {
        result := ComCall(10, this, "int*", &pAdvertisingScope := 0, "HRESULT")
        return pAdvertisingScope
    }

    /**
     * The put_AdvertisingScope method sets the advertising scope.
     * @param {Integer} AdvertisingScope Pointer to 
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
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectoryobjectconference-put_advertisingscope
     */
    put_AdvertisingScope(AdvertisingScope) {
        result := ComCall(11, this, "int", AdvertisingScope, "HRESULT")
        return result
    }

    /**
     * The get_Url method gets a URL.
     * @returns {BSTR} Pointer to a <b>BSTR</b> containing the URL.
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectoryobjectconference-get_url
     */
    get_Url() {
        ppUrl := BSTR()
        result := ComCall(12, this, "ptr", ppUrl, "HRESULT")
        return ppUrl
    }

    /**
     * The put_Url method sets a URL.
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
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectoryobjectconference-put_url
     */
    put_Url(pUrl) {
        pUrl := pUrl is String ? BSTR.Alloc(pUrl).Value : pUrl

        result := ComCall(13, this, "ptr", pUrl, "HRESULT")
        return result
    }

    /**
     * The get_Description method gets the description of the conference.
     * @returns {BSTR} Pointer to a <b>BSTR</b> containing the description of the conference.
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectoryobjectconference-get_description
     */
    get_Description() {
        ppDescription := BSTR()
        result := ComCall(14, this, "ptr", ppDescription, "HRESULT")
        return ppDescription
    }

    /**
     * The put_Description method sets the description of the conference.
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
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectoryobjectconference-put_description
     */
    put_Description(pDescription) {
        pDescription := pDescription is String ? BSTR.Alloc(pDescription).Value : pDescription

        result := ComCall(15, this, "ptr", pDescription, "HRESULT")
        return result
    }

    /**
     * The get_IsEncrypted method gets whether the conference is encrypted.
     * @returns {VARIANT_BOOL} Pointer to whether the conference is encrypted.
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectoryobjectconference-get_isencrypted
     */
    get_IsEncrypted() {
        result := ComCall(16, this, "short*", &pfEncrypted := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectoryobjectconference-put_isencrypted
     */
    put_IsEncrypted(fEncrypted) {
        result := ComCall(17, this, "short", fEncrypted, "HRESULT")
        return result
    }

    /**
     * The get_StartTime method gets the start time of the conference.
     * @returns {Float} Pointer to the conference start time.
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectoryobjectconference-get_starttime
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
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectoryobjectconference-put_starttime
     */
    put_StartTime(Date) {
        result := ComCall(19, this, "double", Date, "HRESULT")
        return result
    }

    /**
     * The get_StopTime method gets the stop time of the conference. If the end time is zero, the session is not bounded.
     * @returns {Float} Pointer to the conference stop time.
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectoryobjectconference-get_stoptime
     */
    get_StopTime() {
        result := ComCall(20, this, "double*", &pDate := 0, "HRESULT")
        return pDate
    }

    /**
     * The put_StopTime method sets the stop time of the conference. If the end time is zero, the session is not bounded.
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
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectoryobjectconference-put_stoptime
     */
    put_StopTime(Date) {
        result := ComCall(21, this, "double", Date, "HRESULT")
        return result
    }
}
