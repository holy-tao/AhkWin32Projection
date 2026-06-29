#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\BDA_CONDITIONALACCESS_REQUESTTYPE.ahk" { BDA_CONDITIONALACCESS_REQUESTTYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\BDA_CONDITIONALACCESS_MMICLOSEREASON.ahk" { BDA_CONDITIONALACCESS_MMICLOSEREASON }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to a device's Conditional Access Service (CAS), which manages access to protected content.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_ConditionalAccessEx)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_conditionalaccessex
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_ConditionalAccessEx extends IUnknown {
    /**
     * The interface identifier for IBDA_ConditionalAccessEx
     * @type {Guid}
     */
    static IID := Guid("{497c3418-23cb-44ba-bb62-769f506fcea7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_ConditionalAccessEx interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CheckEntitlementToken     : IntPtr
        SetCaptureToken           : IntPtr
        OpenBroadcastMmi          : IntPtr
        CloseMmiDialog            : IntPtr
        CreateDialogRequestNumber : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_ConditionalAccessEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Checks the access availability of content that is identified by an entitlement token.
     * @param {Integer} ulDialogRequest A dialog request number that specifies the dialog that might be triggered by setting the value. A dialog is part of the device's user interface (MMI).
     * @param {BSTR} bstrLanguage The language of the dialog. This string contains an ISO 639-2 language code with a dash followed by an ISO 3166 country/region code.
     * @param {BDA_CONDITIONALACCESS_REQUESTTYPE} RequestType The type of access that is being requested, specified as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/bda-conditionalaccess-requesttype">BDA_CONDITIONALACCESS_REQUESTTYPE</a> enumeration.
     * @param {Integer} ulcbEntitlementTokenLen The size, in bytes, of the <i>pbEntitlementToken</i> array.
     * @param {Pointer<Integer>} pbEntitlementToken Pointer to a byte array that contains the entitlement token.
     * @returns {Integer} Receives a status code indicating the descrambling status. For more information, see <i>Protected Broadcast Driver Architecture, Part 1: Core Services</i>, section 5.5.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccessex-checkentitlementtoken
     */
    CheckEntitlementToken(ulDialogRequest, bstrLanguage, RequestType, ulcbEntitlementTokenLen, pbEntitlementToken) {
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        pbEntitlementTokenMarshal := pbEntitlementToken is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", ulDialogRequest, BSTR, bstrLanguage, BDA_CONDITIONALACCESS_REQUESTTYPE, RequestType, "uint", ulcbEntitlementTokenLen, pbEntitlementTokenMarshal, pbEntitlementToken, "uint*", &pulDescrambleStatus := 0, "HRESULT")
        return pulDescrambleStatus
    }

    /**
     * Requests special events that are identified by a capture token.
     * @param {Integer} ulcbCaptureTokenLen The size, in bytes, of the <i>pbCaptureToken</i> array.
     * @param {Pointer<Integer>} pbCaptureToken Pointer to a byte array that contains the capture token.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccessex-setcapturetoken
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
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccessex-openbroadcastmmi
     */
    OpenBroadcastMmi(ulDialogRequest, bstrLanguage, EventId) {
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        result := ComCall(5, this, "uint", ulDialogRequest, BSTR, bstrLanguage, "uint", EventId, "HRESULT")
        return result
    }

    /**
     * Notifies the Conditional Access Service (CAS) that the media sink device (MSD) has closed a user interface (MMI) dialog.
     * @param {Integer} ulDialogRequest A logical link with the user interface (MMI) dialog that was triggered by the action.
     * @param {BSTR} bstrLanguage The language for any dialogs resulting from this action. This string contains an ISO 639-2 language code with a dash followed by an ISO 3166 country/region code.
     * @param {Integer} ulDialogNumber The dialog number of the dialog that was closed.
     * @param {BDA_CONDITIONALACCESS_MMICLOSEREASON} ReasonCode The reason for closing the dialog,  specified as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/bda-conditionalaccess-mmiclosereason">BDA_CONDITIONALACCESS_MMICLOSEREASON</a> enumeration.
     * @returns {Integer} Receives the result code for the MMI session. For more information, see <i>Protected Broadcast Driver Architecture, Part 1: Core Services - CAS</i>, section 2.6.6.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccessex-closemmidialog
     */
    CloseMmiDialog(ulDialogRequest, bstrLanguage, ulDialogNumber, ReasonCode) {
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        result := ComCall(6, this, "uint", ulDialogRequest, BSTR, bstrLanguage, "uint", ulDialogNumber, BDA_CONDITIONALACCESS_MMICLOSEREASON, ReasonCode, "uint*", &pulSessionResult := 0, "HRESULT")
        return pulSessionResult
    }

    /**
     * Gets a new dialog box request number.
     * @returns {Integer} Receives the dialog box request number.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccessex-createdialogrequestnumber
     */
    CreateDialogRequestNumber() {
        result := ComCall(7, this, "uint*", &pulDialogRequestNumber := 0, "HRESULT")
        return pulDialogRequestNumber
    }

    Query(iid) {
        if (IBDA_ConditionalAccessEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CheckEntitlementToken := CallbackCreate(GetMethod(implObj, "CheckEntitlementToken"), flags, 7)
        this.vtbl.SetCaptureToken := CallbackCreate(GetMethod(implObj, "SetCaptureToken"), flags, 3)
        this.vtbl.OpenBroadcastMmi := CallbackCreate(GetMethod(implObj, "OpenBroadcastMmi"), flags, 4)
        this.vtbl.CloseMmiDialog := CallbackCreate(GetMethod(implObj, "CloseMmiDialog"), flags, 6)
        this.vtbl.CreateDialogRequestNumber := CallbackCreate(GetMethod(implObj, "CreateDialogRequestNumber"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CheckEntitlementToken)
        CallbackFree(this.vtbl.SetCaptureToken)
        CallbackFree(this.vtbl.OpenBroadcastMmi)
        CallbackFree(this.vtbl.CloseMmiDialog)
        CallbackFree(this.vtbl.CreateDialogRequestNumber)
    }
}
