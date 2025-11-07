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
     * 
     * @param {Integer} ulDialogRequest 
     * @param {BSTR} bstrLanguage 
     * @param {Integer} RequestType 
     * @param {Integer} ulcbEntitlementTokenLen 
     * @param {Pointer<Integer>} pbEntitlementToken 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccessex-checkentitlementtoken
     */
    CheckEntitlementToken(ulDialogRequest, bstrLanguage, RequestType, ulcbEntitlementTokenLen, pbEntitlementToken) {
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        pbEntitlementTokenMarshal := pbEntitlementToken is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", ulDialogRequest, "ptr", bstrLanguage, "int", RequestType, "uint", ulcbEntitlementTokenLen, pbEntitlementTokenMarshal, pbEntitlementToken, "uint*", &pulDescrambleStatus := 0, "HRESULT")
        return pulDescrambleStatus
    }

    /**
     * 
     * @param {Integer} ulcbCaptureTokenLen 
     * @param {Pointer<Integer>} pbCaptureToken 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccessex-setcapturetoken
     */
    SetCaptureToken(ulcbCaptureTokenLen, pbCaptureToken) {
        pbCaptureTokenMarshal := pbCaptureToken is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", ulcbCaptureTokenLen, pbCaptureTokenMarshal, pbCaptureToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulDialogRequest 
     * @param {BSTR} bstrLanguage 
     * @param {Integer} EventId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccessex-openbroadcastmmi
     */
    OpenBroadcastMmi(ulDialogRequest, bstrLanguage, EventId) {
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        result := ComCall(5, this, "uint", ulDialogRequest, "ptr", bstrLanguage, "uint", EventId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulDialogRequest 
     * @param {BSTR} bstrLanguage 
     * @param {Integer} ulDialogNumber 
     * @param {Integer} ReasonCode 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccessex-closemmidialog
     */
    CloseMmiDialog(ulDialogRequest, bstrLanguage, ulDialogNumber, ReasonCode) {
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        result := ComCall(6, this, "uint", ulDialogRequest, "ptr", bstrLanguage, "uint", ulDialogNumber, "int", ReasonCode, "uint*", &pulSessionResult := 0, "HRESULT")
        return pulSessionResult
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccessex-createdialogrequestnumber
     */
    CreateDialogRequestNumber() {
        result := ComCall(7, this, "uint*", &pulDialogRequestNumber := 0, "HRESULT")
        return pulDialogRequestNumber
    }
}
