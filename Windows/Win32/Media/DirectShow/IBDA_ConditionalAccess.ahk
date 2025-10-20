#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IBDA_ConditionalAccess interface provides conditional access to program content.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof()</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_conditionalaccess
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_ConditionalAccess extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_ConditionalAccess
     * @type {Guid}
     */
    static IID => Guid("{cd51f1e0-7be9-4123-8482-a2a796c0a6b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SmartCardStatus", "get_SmartCardInfo", "get_SmartCardApplications", "get_Entitlement", "TuneByChannel", "SetProgram", "AddProgram", "RemoveProgram", "GetModuleUI", "InformUIClosed"]

    /**
     * 
     * @param {Pointer<Integer>} pCardStatus 
     * @param {Pointer<Integer>} pCardAssociation 
     * @param {Pointer<BSTR>} pbstrCardError 
     * @param {Pointer<VARIANT_BOOL>} pfOOBLocked 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccess-get_smartcardstatus
     */
    get_SmartCardStatus(pCardStatus, pCardAssociation, pbstrCardError, pfOOBLocked) {
        result := ComCall(3, this, "int*", pCardStatus, "int*", pCardAssociation, "ptr", pbstrCardError, "ptr", pfOOBLocked, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCardName 
     * @param {Pointer<BSTR>} pbstrCardManufacturer 
     * @param {Pointer<VARIANT_BOOL>} pfDaylightSavings 
     * @param {Pointer<Integer>} pbyRatingRegion 
     * @param {Pointer<Integer>} plTimeZoneOffsetMinutes 
     * @param {Pointer<BSTR>} pbstrLanguage 
     * @param {Pointer<EALocationCodeType>} pEALocationCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccess-get_smartcardinfo
     */
    get_SmartCardInfo(pbstrCardName, pbstrCardManufacturer, pfDaylightSavings, pbyRatingRegion, plTimeZoneOffsetMinutes, pbstrLanguage, pEALocationCode) {
        result := ComCall(4, this, "ptr", pbstrCardName, "ptr", pbstrCardManufacturer, "ptr", pfDaylightSavings, "char*", pbyRatingRegion, "int*", plTimeZoneOffsetMinutes, "ptr", pbstrLanguage, "ptr", pEALocationCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulcApplications 
     * @param {Integer} ulcApplicationsMax 
     * @param {Pointer<SmartCardApplication>} rgApplications 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccess-get_smartcardapplications
     */
    get_SmartCardApplications(pulcApplications, ulcApplicationsMax, rgApplications) {
        result := ComCall(5, this, "uint*", pulcApplications, "uint", ulcApplicationsMax, "ptr", rgApplications, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} usVirtualChannel 
     * @param {Pointer<Integer>} pEntitlement 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccess-get_entitlement
     */
    get_Entitlement(usVirtualChannel, pEntitlement) {
        result := ComCall(6, this, "ushort", usVirtualChannel, "int*", pEntitlement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} usVirtualChannel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccess-tunebychannel
     */
    TuneByChannel(usVirtualChannel) {
        result := ComCall(7, this, "ushort", usVirtualChannel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} usProgramNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccess-setprogram
     */
    SetProgram(usProgramNumber) {
        result := ComCall(8, this, "ushort", usProgramNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} usProgramNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccess-addprogram
     */
    AddProgram(usProgramNumber) {
        result := ComCall(9, this, "ushort", usProgramNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} usProgramNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccess-removeprogram
     */
    RemoveProgram(usProgramNumber) {
        result := ComCall(10, this, "ushort", usProgramNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} byDialogNumber 
     * @param {Pointer<BSTR>} pbstrURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccess-getmoduleui
     */
    GetModuleUI(byDialogNumber, pbstrURL) {
        result := ComCall(11, this, "char", byDialogNumber, "ptr", pbstrURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} byDialogNumber 
     * @param {Integer} CloseReason 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccess-informuiclosed
     */
    InformUIClosed(byDialogNumber, CloseReason) {
        result := ComCall(12, this, "char", byDialogNumber, "int", CloseReason, "HRESULT")
        return result
    }
}
