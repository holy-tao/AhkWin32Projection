#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FAX_RULE_STATUS_ENUM.ahk" { FAX_RULE_STATUS_ENUM }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IFaxOutboundRoutingRule interface describes a configuration object that is used by a fax client application to set and retrieve information about an individual fax outbound routing rule.
 * @remarks
 * A default implementation of <b>IFaxOutboundRoutingRule</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutingrule">FaxOutboundRoutingRule</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxoutboundroutingrule
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxOutboundRoutingRule extends IDispatch {
    /**
     * The interface identifier for IFaxOutboundRoutingRule
     * @type {Guid}
     */
    static IID := Guid("{e1f795d5-07c2-469f-b027-acacc23219da}")

    /**
     * The class identifier for FaxOutboundRoutingRule
     * @type {Guid}
     */
    static CLSID := Guid("{6549eebf-08d1-475a-828b-3bf105952fa0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxOutboundRoutingRule interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_CountryCode : IntPtr
        get_AreaCode    : IntPtr
        get_Status      : IntPtr
        get_UseDevice   : IntPtr
        put_UseDevice   : IntPtr
        get_DeviceId    : IntPtr
        put_DeviceId    : IntPtr
        get_GroupName   : IntPtr
        put_GroupName   : IntPtr
        Refresh         : IntPtr
        Save            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxOutboundRoutingRule.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    CountryCode {
        get => this.get_CountryCode()
    }

    /**
     * @type {Integer} 
     */
    AreaCode {
        get => this.get_AreaCode()
    }

    /**
     * @type {FAX_RULE_STATUS_ENUM} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    UseDevice {
        get => this.get_UseDevice()
        set => this.put_UseDevice(value)
    }

    /**
     * @type {Integer} 
     */
    DeviceId {
        get => this.get_DeviceId()
        set => this.put_DeviceId(value)
    }

    /**
     * @type {BSTR} 
     */
    GroupName {
        get => this.get_GroupName()
        set => this.put_GroupName(value)
    }

    /**
     * The IFaxOutboundRoutingRule::get_CountryCode property specifies the country/region code to which the outbound routing rule applies.
     * @remarks
     * If this property is equal to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_routing_rule_code_enum">frrcANY_CODE</a>, the outbound routing rule applies to all country/region codes.
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrule-get_countrycode
     */
    get_CountryCode() {
        result := ComCall(7, this, "int*", &plCountryCode := 0, "HRESULT")
        return plCountryCode
    }

    /**
     * The IFaxOutboundRoutingRule::get_AreaCode property specifies the area code to which the outbound routing rule applies.
     * @remarks
     * If this property is equal to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_routing_rule_code_enum">frrcANY_CODE</a>, the outbound routing rule applies to all area codes.
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrule-get_areacode
     */
    get_AreaCode() {
        result := ComCall(8, this, "int*", &plAreaCode := 0, "HRESULT")
        return plAreaCode
    }

    /**
     * The IFaxOutboundRoutingRule::get_Status property indicates the current status of the outbound routing rule; for example, whether the rule is valid and whether it can apply to fax jobs.
     * @remarks
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {FAX_RULE_STATUS_ENUM} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrule-get_status
     */
    get_Status() {
        result := ComCall(9, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * The IFaxOutboundRoutingRule::get_UseDevice property is a Boolean value that indicates whether the outbound routing rule points to a single fax device. (Get)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrule-get_usedevice
     */
    get_UseDevice() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &pbUseDevice := 0, "HRESULT")
        return pbUseDevice
    }

    /**
     * The IFaxOutboundRoutingRule::get_UseDevice property is a Boolean value that indicates whether the outbound routing rule points to a single fax device. (Put)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {VARIANT_BOOL} bUseDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrule-put_usedevice
     */
    put_UseDevice(bUseDevice) {
        result := ComCall(11, this, VARIANT_BOOL, bUseDevice, "HRESULT")
        return result
    }

    /**
     * The IFaxOutboundRoutingRule::get_DeviceId property specifies the device ID if the outbound routing rule points to a single fax device. (Get)
     * @remarks
     * This property is valid only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutingrule-usedevice-vb">IFaxOutboundRoutingRule::get_UseDevice</a> property is equal to <b>TRUE</b>.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrule-get_deviceid
     */
    get_DeviceId() {
        result := ComCall(12, this, "int*", &plDeviceId := 0, "HRESULT")
        return plDeviceId
    }

    /**
     * The IFaxOutboundRoutingRule::get_DeviceId property specifies the device ID if the outbound routing rule points to a single fax device. (Put)
     * @remarks
     * This property is valid only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutingrule-usedevice-vb">IFaxOutboundRoutingRule::get_UseDevice</a> property is equal to <b>TRUE</b>.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {Integer} DeviceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrule-put_deviceid
     */
    put_DeviceId(DeviceId) {
        result := ComCall(13, this, "int", DeviceId, "HRESULT")
        return result
    }

    /**
     * The IFaxOutboundRoutingRule::get_GroupName property specifies the group name if the outbound routing rule points to a group of fax devices. (Get)
     * @remarks
     * This property is valid only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutingrule-usedevice-vb">IFaxOutboundRoutingRule::get_UseDevice</a> property is equal to <b>FALSE</b>.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrule-get_groupname
     */
    get_GroupName() {
        pbstrGroupName := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, pbstrGroupName, "HRESULT")
        return pbstrGroupName
    }

    /**
     * The IFaxOutboundRoutingRule::get_GroupName property specifies the group name if the outbound routing rule points to a group of fax devices. (Put)
     * @remarks
     * This property is valid only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutingrule-usedevice-vb">IFaxOutboundRoutingRule::get_UseDevice</a> property is equal to <b>FALSE</b>.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {BSTR} bstrGroupName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrule-put_groupname
     */
    put_GroupName(bstrGroupName) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(15, this, BSTR, bstrGroupName, "HRESULT")
        return result
    }

    /**
     * The IFaxOutboundRoutingRule::Refresh method refreshes FaxOutboundRoutingRule object information from the fax server.
     * @remarks
     * When the <b>IFaxOutboundRoutingRule::Refresh</b> method is called, any configuration changes made after the last <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutingrule-save-vb">IFaxOutboundRoutingRule::Save</a> method call are lost.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrule-refresh
     */
    Refresh() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * The IFaxOutboundRoutingRule::Save method saves the FaxOutboundRoutingRule object data.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_CONFIG</a> and <b>farQUERY_CONFIG</b> access rights.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrule-save
     */
    Save() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFaxOutboundRoutingRule.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CountryCode := CallbackCreate(GetMethod(implObj, "get_CountryCode"), flags, 2)
        this.vtbl.get_AreaCode := CallbackCreate(GetMethod(implObj, "get_AreaCode"), flags, 2)
        this.vtbl.get_Status := CallbackCreate(GetMethod(implObj, "get_Status"), flags, 2)
        this.vtbl.get_UseDevice := CallbackCreate(GetMethod(implObj, "get_UseDevice"), flags, 2)
        this.vtbl.put_UseDevice := CallbackCreate(GetMethod(implObj, "put_UseDevice"), flags, 2)
        this.vtbl.get_DeviceId := CallbackCreate(GetMethod(implObj, "get_DeviceId"), flags, 2)
        this.vtbl.put_DeviceId := CallbackCreate(GetMethod(implObj, "put_DeviceId"), flags, 2)
        this.vtbl.get_GroupName := CallbackCreate(GetMethod(implObj, "get_GroupName"), flags, 2)
        this.vtbl.put_GroupName := CallbackCreate(GetMethod(implObj, "put_GroupName"), flags, 2)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CountryCode)
        CallbackFree(this.vtbl.get_AreaCode)
        CallbackFree(this.vtbl.get_Status)
        CallbackFree(this.vtbl.get_UseDevice)
        CallbackFree(this.vtbl.put_UseDevice)
        CallbackFree(this.vtbl.get_DeviceId)
        CallbackFree(this.vtbl.put_DeviceId)
        CallbackFree(this.vtbl.get_GroupName)
        CallbackFree(this.vtbl.put_GroupName)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.Save)
    }
}
