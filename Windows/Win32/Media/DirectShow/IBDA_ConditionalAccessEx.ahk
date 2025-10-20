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
     * 
     * @param {Integer} ulDialogRequest 
     * @param {BSTR} bstrLanguage 
     * @param {Integer} RequestType 
     * @param {Integer} ulcbEntitlementTokenLen 
     * @param {Pointer<Byte>} pbEntitlementToken 
     * @param {Pointer<UInt32>} pulDescrambleStatus 
     * @returns {HRESULT} 
     */
    CheckEntitlementToken(ulDialogRequest, bstrLanguage, RequestType, ulcbEntitlementTokenLen, pbEntitlementToken, pulDescrambleStatus) {
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        result := ComCall(3, this, "uint", ulDialogRequest, "ptr", bstrLanguage, "int", RequestType, "uint", ulcbEntitlementTokenLen, "char*", pbEntitlementToken, "uint*", pulDescrambleStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulcbCaptureTokenLen 
     * @param {Pointer<Byte>} pbCaptureToken 
     * @returns {HRESULT} 
     */
    SetCaptureToken(ulcbCaptureTokenLen, pbCaptureToken) {
        result := ComCall(4, this, "uint", ulcbCaptureTokenLen, "char*", pbCaptureToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulDialogRequest 
     * @param {BSTR} bstrLanguage 
     * @param {Integer} EventId 
     * @returns {HRESULT} 
     */
    OpenBroadcastMmi(ulDialogRequest, bstrLanguage, EventId) {
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        result := ComCall(5, this, "uint", ulDialogRequest, "ptr", bstrLanguage, "uint", EventId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulDialogRequest 
     * @param {BSTR} bstrLanguage 
     * @param {Integer} ulDialogNumber 
     * @param {Integer} ReasonCode 
     * @param {Pointer<UInt32>} pulSessionResult 
     * @returns {HRESULT} 
     */
    CloseMmiDialog(ulDialogRequest, bstrLanguage, ulDialogNumber, ReasonCode, pulSessionResult) {
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        result := ComCall(6, this, "uint", ulDialogRequest, "ptr", bstrLanguage, "uint", ulDialogNumber, "int", ReasonCode, "uint*", pulSessionResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulDialogRequestNumber 
     * @returns {HRESULT} 
     */
    CreateDialogRequestNumber(pulDialogRequestNumber) {
        result := ComCall(7, this, "uint*", pulDialogRequestNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
