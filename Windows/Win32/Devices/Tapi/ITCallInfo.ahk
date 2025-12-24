#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITAddress.ahk
#Include .\ITCallHub.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITCallInfo interface gets and sets a variety of information concerning a Call object. The ITAddress::get_Calls and IEnumCall::Next methods create the ITCallInfo interface.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itcallinfo
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITCallInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITCallInfo
     * @type {Guid}
     */
    static IID => Guid("{350f85d1-1227-11d3-83d4-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Address", "get_CallState", "get_Privilege", "get_CallHub", "get_CallInfoLong", "put_CallInfoLong", "get_CallInfoString", "put_CallInfoString", "get_CallInfoBuffer", "put_CallInfoBuffer", "GetCallInfoBuffer", "SetCallInfoBuffer", "ReleaseUserUserInfo"]

    /**
     * @type {ITAddress} 
     */
    Address {
        get => this.get_Address()
    }

    /**
     * @type {Integer} 
     */
    CallState {
        get => this.get_CallState()
    }

    /**
     * @type {Integer} 
     */
    Privilege {
        get => this.get_Privilege()
    }

    /**
     * @type {ITCallHub} 
     */
    CallHub {
        get => this.get_CallHub()
    }

    /**
     * The get_Address method gets a pointer to the ITAddress interface of the Address object.
     * @returns {ITAddress} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallinfo-get_address
     */
    get_Address() {
        result := ComCall(7, this, "ptr*", &ppAddress := 0, "HRESULT")
        return ITAddress(ppAddress)
    }

    /**
     * The get_CallState method gets a pointer to the current call state, such as CS_IDLE.
     * @returns {Integer} Pointer to variable containing current 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-call_state">CALL_STATE</a> type.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallinfo-get_callstate
     */
    get_CallState() {
        result := ComCall(8, this, "int*", &pCallState := 0, "HRESULT")
        return pCallState
    }

    /**
     * The get_Privilege method gets the call privilege of the application for the current call, such as CP_MONITOR.
     * @returns {Integer} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-call_privilege">CALL_PRIVILEGE</a>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallinfo-get_privilege
     */
    get_Privilege() {
        result := ComCall(9, this, "int*", &pPrivilege := 0, "HRESULT")
        return pPrivilege
    }

    /**
     * The get_CallHub method gets a pointer to the ITCallHub interface of the CallHub object.
     * @returns {ITCallHub} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallhub">ITCallHub</a> interface of the CallHub object.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallinfo-get_callhub
     */
    get_CallHub() {
        result := ComCall(10, this, "ptr*", &ppCallHub := 0, "HRESULT")
        return ITCallHub(ppCallHub)
    }

    /**
     * The get_CallInfoLong method gets call information items described by a long, such as the bearer mode.
     * @param {Integer} CallInfoLong <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-callinfo_long">CALLINFO_LONG</a> indicator of information type needed, such as CIL_BEARERMODE.
     * @returns {Integer} Pointer to value returned.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallinfo-get_callinfolong
     */
    get_CallInfoLong(CallInfoLong) {
        result := ComCall(11, this, "int", CallInfoLong, "int*", &plCallInfoLongVal := 0, "HRESULT")
        return plCallInfoLongVal
    }

    /**
     * The put_CallInfoLong method sets call information items described by a long, such as the bearer mode.
     * @param {Integer} CallInfoLong <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-callinfo_long">CALLINFO_LONG</a> indicator of information type needed, such as CIL_BEARERMODE.
     * @param {Integer} lCallInfoLongVal Pointer to new value.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>CallInfoLong</i> parameter is not a valid value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_INVALCALLSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current 
     * <a href="/windows/desktop/api/tapi3if/ne-tapi3if-call_state">call state</a> is not valid for this operation.
     * 								
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallinfo-put_callinfolong
     */
    put_CallInfoLong(CallInfoLong, lCallInfoLongVal) {
        result := ComCall(12, this, "int", CallInfoLong, "int", lCallInfoLongVal, "HRESULT")
        return result
    }

    /**
     * The get_CallInfoString method gets call information items described by a string, such as the displayable address.
     * @param {Integer} CallInfoString <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-callinfo_string">CALLINFO_STRING</a> indicator of information type needed, such as CIS_DISPLAYABLEADDRESS.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of needed string.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallinfo-get_callinfostring
     */
    get_CallInfoString(CallInfoString) {
        ppCallInfoString := BSTR()
        result := ComCall(13, this, "int", CallInfoString, "ptr", ppCallInfoString, "HRESULT")
        return ppCallInfoString
    }

    /**
     * The put_CallInfoString method sets call information items described by a string, such as the displayable address.
     * @param {Integer} CallInfoString <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-callinfo_string">CALLINFO_STRING</a> indicator of information type, such as CIS_DISPLAYABLEADDRESS.
     * @param {BSTR} pCallInfoString Pointer to a BSTR representation of the string.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>CallInfoString</i> parameter is not a valid value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_INVALCALLSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current 
     * <a href="/windows/desktop/api/tapi3if/ne-tapi3if-call_state">call state</a> is not valid for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallinfo-put_callinfostring
     */
    put_CallInfoString(CallInfoString, pCallInfoString) {
        pCallInfoString := pCallInfoString is String ? BSTR.Alloc(pCallInfoString).Value : pCallInfoString

        result := ComCall(14, this, "int", CallInfoString, "ptr", pCallInfoString, "HRESULT")
        return result
    }

    /**
     * The get_CallInfoBuffer method gets call information items which require a buffer, such as user-user information.
     * @param {Integer} CallInfoBuffer <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-callinfo_buffer">CALLINFO_BUFFER</a> indicator of information type needed, such as CIB_USERUSERINFO.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> representation of call information buffer. The application must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory allocated for this parameter.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallinfo-get_callinfobuffer
     */
    get_CallInfoBuffer(CallInfoBuffer) {
        ppCallInfoBuffer := VARIANT()
        result := ComCall(15, this, "int", CallInfoBuffer, "ptr", ppCallInfoBuffer, "HRESULT")
        return ppCallInfoBuffer
    }

    /**
     * The put_CallInfoBuffer method sets call information items which require a buffer, such as user-user information.
     * @param {Integer} CallInfoBuffer <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-callinfo_buffer">CALLINFO_BUFFER</a> indicator of information type, such as CIB_USERUSERINFO.
     * @param {VARIANT} pCallInfoBuffer <b>VARIANT</b>
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>CallInfoBuffer</i> parameter is not a valid value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_INVALCALLSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current 
     * <a href="/windows/desktop/api/tapi3if/ne-tapi3if-call_state">call state</a> is not valid for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallinfo-put_callinfobuffer
     */
    put_CallInfoBuffer(CallInfoBuffer, pCallInfoBuffer) {
        result := ComCall(16, this, "int", CallInfoBuffer, "ptr", pCallInfoBuffer, "HRESULT")
        return result
    }

    /**
     * The GetCallInfoBuffer method gets call information items that require a buffer, such as user-user information. Automation client applications, such as those written in Visual Basic, must use the ITCallInfo::get_CallInfoBuffer method.
     * @param {Integer} CallInfoBuffer <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-callinfo_buffer">CALLINFO_BUFFER</a> indicator of information type needed, such as CIB_USERUSERINFO.
     * @param {Pointer<Integer>} pdwSize Size of buffer returned in bytes.
     * @param {Pointer<Pointer<Integer>>} ppCallInfoBuffer Pointer to buffer containing the needed call information.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pdwSize</i> or <i>ppCallInfoBuffer</i> parameter is not a valid pointer.
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
     * The <i>CallInfoBuffer</i> parameter is not a valid value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_INVALCALLSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current 
     * <a href="/windows/desktop/api/tapi3if/ne-tapi3if-call_state">call state</a> is not valid for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallinfo-getcallinfobuffer
     */
    GetCallInfoBuffer(CallInfoBuffer, pdwSize, ppCallInfoBuffer) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        ppCallInfoBufferMarshal := ppCallInfoBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, "int", CallInfoBuffer, pdwSizeMarshal, pdwSize, ppCallInfoBufferMarshal, ppCallInfoBuffer, "HRESULT")
        return result
    }

    /**
     * The SetCallInfoBuffer method sets call information items that require a buffer, such as user-user information. Automation client applications, such as those written in Visual Basic, must use the ITCallInfo::put_CallInfoBuffer method.
     * @param {Integer} CallInfoBuffer <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-callinfo_buffer">CALLINFO_BUFFER</a> indicator of information type needed, such as CIB_USERUSERINFO.
     * @param {Integer} dwSize Size of <i>pCallInfoBuffer</i>.
     * @param {Pointer<Integer>} pCallInfoBuffer Pointer to call information buffer.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pCallInfoBuffer</i> parameter is not a valid pointer.
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
     * The <i>CallInfoBuffer</i> parameter is not a valid value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_INVALCALLSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current 
     * <a href="/windows/desktop/api/tapi3if/ne-tapi3if-call_state">call state</a> is not valid for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallinfo-setcallinfobuffer
     */
    SetCallInfoBuffer(CallInfoBuffer, dwSize, pCallInfoBuffer) {
        pCallInfoBufferMarshal := pCallInfoBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(18, this, "int", CallInfoBuffer, "uint", dwSize, pCallInfoBufferMarshal, pCallInfoBuffer, "HRESULT")
        return result
    }

    /**
     * The ReleaseUserUserInfo method informs the service provider that the application has processed the user-user information obtained from the ITCallInfo::GetCallInfoBuffer method.
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
     * <dt><b>TAPI_E_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed because the TAPI 3 DLL timed it out. The timeout interval is two minutes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallinfo-releaseuseruserinfo
     */
    ReleaseUserUserInfo() {
        result := ComCall(19, this, "HRESULT")
        return result
    }
}
