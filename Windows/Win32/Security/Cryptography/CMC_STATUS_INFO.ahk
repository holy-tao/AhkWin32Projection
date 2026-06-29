#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CMC_PEND_INFO.ahk" { CMC_PEND_INFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains status information about Certificate Management Messages over CMS.
 * @remarks
 * Additional members of the union may be defined in future versions.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmc_status_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMC_STATUS_INFO {
    #StructPack 8

    /**
     * A <b>DWORD</b> value that indicates the status of the message.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMC_STATUS_SUCCESS"></a><a id="cmc_status_success"></a><dl>
     * <dt><b>CMC_STATUS_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Request was granted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMC_STATUS_FAILED"></a><a id="cmc_status_failed"></a><dl>
     * <dt><b>CMC_STATUS_FAILED</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Request failed. There is addition information in other parts of the message.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMC_STATUS_PENDING"></a><a id="cmc_status_pending"></a><dl>
     * <dt><b>CMC_STATUS_PENDING</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Request body part has not been processed. Requester must poll again. This value is returned only on <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate requests</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMC_STATUS_NO_SUPPORT"></a><a id="cmc_status_no_support"></a><dl>
     * <dt><b>CMC_STATUS_NO_SUPPORT</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Requested operation is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMC_STATUS_CONFIRM_REQUIRED"></a><a id="cmc_status_confirm_required"></a><dl>
     * <dt><b>CMC_STATUS_CONFIRM_REQUIRED</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Confirmation by using the idConfirmCertAcceptance control is required before the certificate can be used.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwStatus : UInt32

    /**
     * A <b>DWORD</b> count of the elements in the <b>rgdwBodyList</b> array.
     */
    cBodyList : UInt32

    /**
     * A <b>DWORD</b> array.
     */
    rgdwBodyList : IntPtr

    /**
     * Optional string text indicating message status.
     */
    pwszStatusString : PWSTR

    /**
     * A <b>DWORD</b> value that identifies the union member to be used.
     */
    dwOtherInfoChoice : UInt32

    dwFailInfo : UInt32

    static __New() {
        DefineProp(this.Prototype, 'pPendInfo', { type: CMC_PEND_INFO.Ptr, offset: 32 })
        this.DeleteProp("__New")
    }
}
