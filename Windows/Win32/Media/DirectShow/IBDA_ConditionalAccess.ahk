#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SmartCardApplication.ahk" { SmartCardApplication }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\EALocationCodeType.ahk" { EALocationCodeType }
#Import ".\EntitlementType.ahk" { EntitlementType }
#Import ".\UICloseReasonType.ahk" { UICloseReasonType }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\SmartCardStatusType.ahk" { SmartCardStatusType }
#Import ".\SmartCardAssociationType.ahk" { SmartCardAssociationType }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IBDA_ConditionalAccess interface provides conditional access to program content.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof()</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_conditionalaccess
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_ConditionalAccess extends IUnknown {
    /**
     * The interface identifier for IBDA_ConditionalAccess
     * @type {Guid}
     */
    static IID := Guid("{cd51f1e0-7be9-4123-8482-a2a796c0a6b0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_ConditionalAccess interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_SmartCardStatus       : IntPtr
        get_SmartCardInfo         : IntPtr
        get_SmartCardApplications : IntPtr
        get_Entitlement           : IntPtr
        TuneByChannel             : IntPtr
        SetProgram                : IntPtr
        AddProgram                : IntPtr
        RemoveProgram             : IntPtr
        GetModuleUI               : IntPtr
        InformUIClosed            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_ConditionalAccess.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The get_SmartCardStatus method retrieves the status of the smart card.
     * @remarks
     * All three parameters must be non-NULL or the method fails and returns <b>E_POINTER</b>.
     * @param {Pointer<SmartCardStatusType>} pCardStatus Pointer to a variable of type <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/ne-bdaiface-smartcardstatustype">SmartCardStatusType</a> that receives the card status type.
     * @param {Pointer<SmartCardAssociationType>} pCardAssociation Pointer to a variable of type <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/ne-bdaiface-smartcardassociationtype">SmartCardAssociationType</a> that receives the card association type.
     * @param {Pointer<BSTR>} pbstrCardError Receives a string containing the card error. When the string is no longer required, call the <b>SysFreeString</b> function to free it.
     * @param {Pointer<VARIANT_BOOL>} pfOOBLocked Receives a value indicating if the operation is blocked.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccess-get_smartcardstatus
     */
    get_SmartCardStatus(pCardStatus, pCardAssociation, pbstrCardError, pfOOBLocked) {
        pCardStatusMarshal := pCardStatus is VarRef ? "int*" : "ptr"
        pCardAssociationMarshal := pCardAssociation is VarRef ? "int*" : "ptr"
        pfOOBLockedMarshal := pfOOBLocked is VarRef ? "short*" : "ptr"

        result := ComCall(3, this, pCardStatusMarshal, pCardStatus, pCardAssociationMarshal, pCardAssociation, BSTR.Ptr, pbstrCardError, pfOOBLockedMarshal, pfOOBLocked, "HRESULT")
        return result
    }

    /**
     * The get_SmartCardInfo method retrieves information about the smart card.
     * @param {Pointer<BSTR>} pbstrCardName Receives a string containing the card name. When the string is no longer required, call the <b>SysFreeString</b> function to free it.
     * @param {Pointer<BSTR>} pbstrCardManufacturer Receives a string containing the name of the card manufacturer. When the string is no longer required, call the <b>SysFreeString</b> function to free it.
     * @param {Pointer<VARIANT_BOOL>} pfDaylightSavings Receives a value indicating whether daylight savings is in effect. If the value is VARIANT_TRUE, daylight savings is in effect. If the value is VARIANT_FALSE, daylight savings is not in effect.
     * @param {Pointer<Integer>} pbyRatingRegion Receives a value indicating the rating region.
     * @param {Pointer<Integer>} plTimeZoneOffsetMinutes Receives the time zone offset in minutes.
     * @param {Pointer<BSTR>} pbstrLanguage Receives a string indicating the language. When the string is no longer required, call the <b>SysFreeString</b> function to free it.
     * @param {Pointer<EALocationCodeType>} pEALocationCode Pointer to a buffer that receives the emergency alert location code information. The buffer size must be at least <c>sizeof(EALocationCodeType)</c>. The method writes a structure of type <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/ns-bdaiface-ealocationcodetype">EALocationCodeType</a> to the buffer. The structure specifies the location code scheme (for example, SCTE 18), state, county, and county subdivision for the emergency alert.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccess-get_smartcardinfo
     */
    get_SmartCardInfo(pbstrCardName, pbstrCardManufacturer, pfDaylightSavings, pbyRatingRegion, plTimeZoneOffsetMinutes, pbstrLanguage, pEALocationCode) {
        pfDaylightSavingsMarshal := pfDaylightSavings is VarRef ? "short*" : "ptr"
        pbyRatingRegionMarshal := pbyRatingRegion is VarRef ? "char*" : "ptr"
        plTimeZoneOffsetMinutesMarshal := plTimeZoneOffsetMinutes is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, BSTR.Ptr, pbstrCardName, BSTR.Ptr, pbstrCardManufacturer, pfDaylightSavingsMarshal, pfDaylightSavings, pbyRatingRegionMarshal, pbyRatingRegion, plTimeZoneOffsetMinutesMarshal, plTimeZoneOffsetMinutes, BSTR.Ptr, pbstrLanguage, EALocationCodeType.Ptr, pEALocationCode, "HRESULT")
        return result
    }

    /**
     * The get_SmartCardApplications method retrieves a list of the smart card applications.
     * @remarks
     * <div class="alert"><b>Note</b>  The <i>pulcApplications</i> parameter is marked in the IDL file as [in, out] but is used as an [in] parameter. To preserve binary compatibility with previous versions, it has not been changed.</div>
     * <div> </div>
     * @param {Pointer<Integer>} pulcApplications Receives a count of the number of smart card applications in the <i>rgApplications</i> array.
     * @param {Integer} ulcApplicationsMax The maximum number of smart card applications that the <i>rgApplications</i> buffer can hold.
     * @param {Pointer<SmartCardApplication>} rgApplications Pointer to a buffer that receives an array of smart card applications. Each array element is a <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/ns-bdaiface-smartcardapplication">SmartCardApplication</a> structure.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccess-get_smartcardapplications
     */
    get_SmartCardApplications(pulcApplications, ulcApplicationsMax, rgApplications) {
        pulcApplicationsMarshal := pulcApplications is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pulcApplicationsMarshal, pulcApplications, "uint", ulcApplicationsMax, SmartCardApplication.Ptr, rgApplications, "HRESULT")
        return result
    }

    /**
     * The get_Entitlement method retrieves the entitlement type for a virtual channel.
     * @param {Integer} usVirtualChannel Specifies the virtual channel number.
     * @returns {EntitlementType} Receives the entitlement type.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccess-get_entitlement
     */
    get_Entitlement(usVirtualChannel) {
        result := ComCall(6, this, "ushort", usVirtualChannel, "int*", &pEntitlement := 0, "HRESULT")
        return pEntitlement
    }

    /**
     * The TuneByChannel method tunes to a virtual channel.
     * @param {Integer} usVirtualChannel Specifies the virtual channel number.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccess-tunebychannel
     */
    TuneByChannel(usVirtualChannel) {
        result := ComCall(7, this, "ushort", usVirtualChannel, "HRESULT")
        return result
    }

    /**
     * The SetProgram method sets the program number.
     * @param {Integer} usProgramNumber Specifies the program number.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccess-setprogram
     */
    SetProgram(usProgramNumber) {
        result := ComCall(8, this, "ushort", usProgramNumber, "HRESULT")
        return result
    }

    /**
     * Currently not implemented.
     * @param {Integer} usProgramNumber Reserved.
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccess-addprogram
     */
    AddProgram(usProgramNumber) {
        result := ComCall(9, this, "ushort", usProgramNumber, "HRESULT")
        return result
    }

    /**
     * Currently not implemented.
     * @param {Integer} usProgramNumber Reserved.
     * @returns {HRESULT} Returns <b>E_NOTIMPL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccess-removeprogram
     */
    RemoveProgram(usProgramNumber) {
        result := ComCall(10, this, "ushort", usProgramNumber, "HRESULT")
        return result
    }

    /**
     * The GetModuleUI method retrieves the URL for a user interface dialog.
     * @param {Integer} byDialogNumber Specifies the dialog number.
     * @returns {BSTR} Pointer to a pointer variable that receives a pointer to a string containing the URL. When the string is no longer required, call the <b>SysFreeString</b> function to free it.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccess-getmoduleui
     */
    GetModuleUI(byDialogNumber) {
        pbstrURL := BSTR.Owned()
        result := ComCall(11, this, "char", byDialogNumber, BSTR.Ptr, pbstrURL, "HRESULT")
        return pbstrURL
    }

    /**
     * The InformUIClosed method informs the device that the user-interface dialog is closed.
     * @param {Integer} byDialogNumber Specifies the dialog number.
     * @param {UICloseReasonType} CloseReason Specifies the reason for closing the dialog, as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/ne-bdaiface-uiclosereasontype">UICloseReasonType</a> enumeration.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. It returns <b>S_FALSE</b> if a dialog with the specified dialog number cannot be found. If the method fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_conditionalaccess-informuiclosed
     */
    InformUIClosed(byDialogNumber, CloseReason) {
        result := ComCall(12, this, "char", byDialogNumber, UICloseReasonType, CloseReason, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_ConditionalAccess.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SmartCardStatus := CallbackCreate(GetMethod(implObj, "get_SmartCardStatus"), flags, 5)
        this.vtbl.get_SmartCardInfo := CallbackCreate(GetMethod(implObj, "get_SmartCardInfo"), flags, 8)
        this.vtbl.get_SmartCardApplications := CallbackCreate(GetMethod(implObj, "get_SmartCardApplications"), flags, 4)
        this.vtbl.get_Entitlement := CallbackCreate(GetMethod(implObj, "get_Entitlement"), flags, 3)
        this.vtbl.TuneByChannel := CallbackCreate(GetMethod(implObj, "TuneByChannel"), flags, 2)
        this.vtbl.SetProgram := CallbackCreate(GetMethod(implObj, "SetProgram"), flags, 2)
        this.vtbl.AddProgram := CallbackCreate(GetMethod(implObj, "AddProgram"), flags, 2)
        this.vtbl.RemoveProgram := CallbackCreate(GetMethod(implObj, "RemoveProgram"), flags, 2)
        this.vtbl.GetModuleUI := CallbackCreate(GetMethod(implObj, "GetModuleUI"), flags, 3)
        this.vtbl.InformUIClosed := CallbackCreate(GetMethod(implObj, "InformUIClosed"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SmartCardStatus)
        CallbackFree(this.vtbl.get_SmartCardInfo)
        CallbackFree(this.vtbl.get_SmartCardApplications)
        CallbackFree(this.vtbl.get_Entitlement)
        CallbackFree(this.vtbl.TuneByChannel)
        CallbackFree(this.vtbl.SetProgram)
        CallbackFree(this.vtbl.AddProgram)
        CallbackFree(this.vtbl.RemoveProgram)
        CallbackFree(this.vtbl.GetModuleUI)
        CallbackFree(this.vtbl.InformUIClosed)
    }
}
