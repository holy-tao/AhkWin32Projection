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
     * 
     * @param {Pointer<Int32>} pCardStatus 
     * @param {Pointer<Int32>} pCardAssociation 
     * @param {Pointer<BSTR>} pbstrCardError 
     * @param {Pointer<VARIANT_BOOL>} pfOOBLocked 
     * @returns {HRESULT} 
     */
    get_SmartCardStatus(pCardStatus, pCardAssociation, pbstrCardError, pfOOBLocked) {
        result := ComCall(3, this, "int*", pCardStatus, "int*", pCardAssociation, "ptr", pbstrCardError, "ptr", pfOOBLocked, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCardName 
     * @param {Pointer<BSTR>} pbstrCardManufacturer 
     * @param {Pointer<VARIANT_BOOL>} pfDaylightSavings 
     * @param {Pointer<Byte>} pbyRatingRegion 
     * @param {Pointer<Int32>} plTimeZoneOffsetMinutes 
     * @param {Pointer<BSTR>} pbstrLanguage 
     * @param {Pointer<EALocationCodeType>} pEALocationCode 
     * @returns {HRESULT} 
     */
    get_SmartCardInfo(pbstrCardName, pbstrCardManufacturer, pfDaylightSavings, pbyRatingRegion, plTimeZoneOffsetMinutes, pbstrLanguage, pEALocationCode) {
        result := ComCall(4, this, "ptr", pbstrCardName, "ptr", pbstrCardManufacturer, "ptr", pfDaylightSavings, "char*", pbyRatingRegion, "int*", plTimeZoneOffsetMinutes, "ptr", pbstrLanguage, "ptr", pEALocationCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulcApplications 
     * @param {Integer} ulcApplicationsMax 
     * @param {Pointer<SmartCardApplication>} rgApplications 
     * @returns {HRESULT} 
     */
    get_SmartCardApplications(pulcApplications, ulcApplicationsMax, rgApplications) {
        result := ComCall(5, this, "uint*", pulcApplications, "uint", ulcApplicationsMax, "ptr", rgApplications, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} usVirtualChannel 
     * @param {Pointer<Int32>} pEntitlement 
     * @returns {HRESULT} 
     */
    get_Entitlement(usVirtualChannel, pEntitlement) {
        result := ComCall(6, this, "ushort", usVirtualChannel, "int*", pEntitlement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} usVirtualChannel 
     * @returns {HRESULT} 
     */
    TuneByChannel(usVirtualChannel) {
        result := ComCall(7, this, "ushort", usVirtualChannel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} usProgramNumber 
     * @returns {HRESULT} 
     */
    SetProgram(usProgramNumber) {
        result := ComCall(8, this, "ushort", usProgramNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} usProgramNumber 
     * @returns {HRESULT} 
     */
    AddProgram(usProgramNumber) {
        result := ComCall(9, this, "ushort", usProgramNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} usProgramNumber 
     * @returns {HRESULT} 
     */
    RemoveProgram(usProgramNumber) {
        result := ComCall(10, this, "ushort", usProgramNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} byDialogNumber 
     * @param {Pointer<BSTR>} pbstrURL 
     * @returns {HRESULT} 
     */
    GetModuleUI(byDialogNumber, pbstrURL) {
        result := ComCall(11, this, "char", byDialogNumber, "ptr", pbstrURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} byDialogNumber 
     * @param {Integer} CloseReason 
     * @returns {HRESULT} 
     */
    InformUIClosed(byDialogNumber, CloseReason) {
        result := ComCall(12, this, "char", byDialogNumber, "int", CloseReason, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
