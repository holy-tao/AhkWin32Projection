#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Encapsulates the functionality of one or more output protection systems that a trusted output supports.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfoutputtrustauthority
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFOutputTrustAuthority extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFOutputTrustAuthority
     * @type {Guid}
     */
    static IID => Guid("{d19f8e94-b126-4446-890c-5dcb7ad71453}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAction", "SetPolicy"]

    /**
     * Retrieves the action that is performed by this output trust authority (OTA).
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfpolicymanager_action">MFPOLICYMANAGER_ACTION</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfoutputtrustauthority-getaction
     */
    GetAction() {
        result := ComCall(3, this, "int*", &pAction := 0, "HRESULT")
        return pAction
    }

    /**
     * Sets one or more policy objects on the output trust authority (OTA).
     * @param {Pointer<IMFOutputPolicy>} ppPolicy The address of  an array of <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfoutputpolicy">IMFOutputPolicy</a> pointers.
     * @param {Integer} nPolicy The number of elements in the <i>ppPolicy</i> array.
     * @param {Pointer<Pointer<Integer>>} ppbTicket Receives either a pointer to a buffer allocated by the OTA, or the value <b>NULL</b>. If this parameter receives a non-<b>NULL</b> value, the caller must release the buffer by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. 
     * 
     * <div class="alert"><b>Note</b>  Currently this parameter is reserved. An OTA should set the pointer to <b>NULL</b>.</div>
     * <div> </div>
     * @param {Pointer<Integer>} pcbTicket Receives the size of the <i>ppbTicket</i> buffer, in bytes. If <i>ppbTicket</i> receives the value <b>NULL</b>, <i>pcbTicket</i> receives the value zero.
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
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_S_WAIT_FOR_POLICY_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The policy was negotiated successfully, but the OTA will enforce it asynchronously.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_POLICY_UNSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The OTA does not support the requirements of this policy.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfoutputtrustauthority-setpolicy
     */
    SetPolicy(ppPolicy, nPolicy, ppbTicket, pcbTicket) {
        ppbTicketMarshal := ppbTicket is VarRef ? "ptr*" : "ptr"
        pcbTicketMarshal := pcbTicket is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr*", ppPolicy, "uint", nPolicy, ppbTicketMarshal, ppbTicket, pcbTicketMarshal, pcbTicket, "HRESULT")
        return result
    }
}
