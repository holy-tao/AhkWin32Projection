#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a device's Conditional Access Service (CAS), which manages access to protected content.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_ConditionalAccessEx)</c>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_conditionalaccessex
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_ConditionalAccessEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_ConditionalAccessEx
     * @type {Guid}
     */
    static IID => Guid("{497c3418-23cb-44ba-bb62-769f506fcea7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CheckEntitlementToken", "SetCaptureToken", "OpenBroadcastMmi", "CloseMmiDialog", "CreateDialogRequestNumber"]

    /**
     * Checks the access availability of content that is identified by an entitlement token.
     * @param {Integer} ulDialogRequest A dialog request number that specifies the dialog that might be triggered by setting the value. A dialog is part of the device's user interface (MMI).
     * @param {BSTR} bstrLanguage The language of the dialog. This string contains an ISO 639-2 language code with a dash followed by an ISO 3166 country/region code.
     * @param {Integer} RequestType The type of access that is being requested, specified as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/bda-conditionalaccess-requesttype">BDA_CONDITIONALACCESS_REQUESTTYPE</a> enumeration.
     * @param {Integer} ulcbEntitlementTokenLen The size, in bytes, of the <i>pbEntitlementToken</i> array.
     * @param {Pointer<Integer>} pbEntitlementToken Pointer to a byte array that contains the entitlement token.
     * @returns {Integer} Receives a status code indicating the descrambling status. For more information, see <i>Protected Broadcast Driver Architecture, Part 1: Core Services</i>, section 5.5.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_conditionalaccessex-checkentitlementtoken
     */
    CheckEntitlementToken(ulDialogRequest, bstrLanguage, RequestType, ulcbEntitlementTokenLen, pbEntitlementToken) {
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        pbEntitlementTokenMarshal := pbEntitlementToken is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", ulDialogRequest, "ptr", bstrLanguage, "int", RequestType, "uint", ulcbEntitlementTokenLen, pbEntitlementTokenMarshal, pbEntitlementToken, "uint*", &pulDescrambleStatus := 0, "HRESULT")
        return pulDescrambleStatus
    }

    /**
     * Requests special events that are identified by a capture token.
     * @param {Integer} ulcbCaptureTokenLen The size, in bytes, of the <i>pbCaptureToken</i> array.
     * @param {Pointer<Integer>} pbCaptureToken Pointer to a byte array that contains the capture token.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_conditionalaccessex-setcapturetoken
     */
    SetCaptureToken(ulcbCaptureTokenLen, pbCaptureToken) {
        pbCaptureTokenMarshal := pbCaptureToken is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", ulcbCaptureTokenLen, pbCaptureTokenMarshal, pbCaptureToken, "HRESULT")
        return result
    }

    /**
     * Responds to a BroadcastMMI event.
     * @param {Integer} ulDialogRequest A logical link with the MMI dialog box that was triggered by the action.
     * @param {BSTR} bstrLanguage The language of the dialog box. This string contains an ISO 639-2 language code with a dash followed by an ISO 3166 country/region code.
     * @param {Integer} EventId The event identifier of the BroadcastMMI event.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_conditionalaccessex-openbroadcastmmi
     */
    OpenBroadcastMmi(ulDialogRequest, bstrLanguage, EventId) {
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        result := ComCall(5, this, "uint", ulDialogRequest, "ptr", bstrLanguage, "uint", EventId, "HRESULT")
        return result
    }

    /**
     * Notifies the Conditional Access Service (CAS) that the media sink device (MSD) has closed a user interface (MMI) dialog.
     * @param {Integer} ulDialogRequest A logical link with the user interface (MMI) dialog that was triggered by the action.
     * @param {BSTR} bstrLanguage The language for any dialogs resulting from this action. This string contains an ISO 639-2 language code with a dash followed by an ISO 3166 country/region code.
     * @param {Integer} ulDialogNumber The dialog number of the dialog that was closed.
     * @param {Integer} ReasonCode The reason for closing the dialog,  specified as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/bda-conditionalaccess-mmiclosereason">BDA_CONDITIONALACCESS_MMICLOSEREASON</a> enumeration.
     * @returns {Integer} Receives the result code for the MMI session. For more information, see <i>Protected Broadcast Driver Architecture, Part 1: Core Services - CAS</i>, section 2.6.6.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_conditionalaccessex-closemmidialog
     */
    CloseMmiDialog(ulDialogRequest, bstrLanguage, ulDialogNumber, ReasonCode) {
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        result := ComCall(6, this, "uint", ulDialogRequest, "ptr", bstrLanguage, "uint", ulDialogNumber, "int", ReasonCode, "uint*", &pulSessionResult := 0, "HRESULT")
        return pulSessionResult
    }

    /**
     * Gets a new dialog box request number.
     * @returns {Integer} Receives the dialog box request number.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_conditionalaccessex-createdialogrequestnumber
     */
    CreateDialogRequestNumber() {
        result := ComCall(7, this, "uint*", &pulDialogRequestNumber := 0, "HRESULT")
        return pulDialogRequestNumber
    }
}
