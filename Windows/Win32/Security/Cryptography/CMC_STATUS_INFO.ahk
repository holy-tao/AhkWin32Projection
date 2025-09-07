#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains status information about Certificate Management Messages over CMS.
 * @remarks
 * Additional members of the union may be defined in future versions.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmc_status_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMC_STATUS_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

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
     * @type {Integer}
     */
    dwStatus {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <b>DWORD</b> count of the elements in the <b>rgdwBodyList</b> array.
     * @type {Integer}
     */
    cBodyList {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A <b>DWORD</b> array.
     * @type {Pointer<UInt32>}
     */
    rgdwBodyList {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Optional string text indicating message status.
     * @type {Pointer<Ptr>}
     */
    pwszStatusString {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A <b>DWORD</b> value that identifies the union member to be used.
     * @type {Integer}
     */
    dwOtherInfoChoice {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwFailInfo {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Pointer<CMC_PEND_INFO>}
     */
    pPendInfo {
        get => NumGet(this, 28, "ptr")
        set => NumPut("ptr", value, this, 28)
    }
}
