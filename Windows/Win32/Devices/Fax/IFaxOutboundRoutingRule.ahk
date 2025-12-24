#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxOutboundRoutingRule interface describes a configuration object that is used by a fax client application to set and retrieve information about an individual fax outbound routing rule.
 * @remarks
 * 
 * A default implementation of <b>IFaxOutboundRoutingRule</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutingrule">FaxOutboundRoutingRule</a> object.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxoutboundroutingrule
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxOutboundRoutingRule extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxOutboundRoutingRule
     * @type {Guid}
     */
    static IID => Guid("{e1f795d5-07c2-469f-b027-acacc23219da}")

    /**
     * The class identifier for FaxOutboundRoutingRule
     * @type {Guid}
     */
    static CLSID => Guid("{6549eebf-08d1-475a-828b-3bf105952fa0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CountryCode", "get_AreaCode", "get_Status", "get_UseDevice", "put_UseDevice", "get_DeviceId", "put_DeviceId", "get_GroupName", "put_GroupName", "Refresh", "Save"]

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
     * @type {Integer} 
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
     * 
     * If this property is equal to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_routing_rule_code_enum">frrcANY_CODE</a>, the outbound routing rule applies to all country/region codes.
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutingrule-get_countrycode
     */
    get_CountryCode() {
        result := ComCall(7, this, "int*", &plCountryCode := 0, "HRESULT")
        return plCountryCode
    }

    /**
     * The IFaxOutboundRoutingRule::get_AreaCode property specifies the area code to which the outbound routing rule applies.
     * @remarks
     * 
     * If this property is equal to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_routing_rule_code_enum">frrcANY_CODE</a>, the outbound routing rule applies to all area codes.
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutingrule-get_areacode
     */
    get_AreaCode() {
        result := ComCall(8, this, "int*", &plAreaCode := 0, "HRESULT")
        return plAreaCode
    }

    /**
     * The IFaxOutboundRoutingRule::get_Status property indicates the current status of the outbound routing rule; for example, whether the rule is valid and whether it can apply to fax jobs.
     * @remarks
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutingrule-get_status
     */
    get_Status() {
        result := ComCall(9, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * The IFaxOutboundRoutingRule::get_UseDevice property is a Boolean value that indicates whether the outbound routing rule points to a single fax device.
     * @remarks
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutingrule-get_usedevice
     */
    get_UseDevice() {
        result := ComCall(10, this, "short*", &pbUseDevice := 0, "HRESULT")
        return pbUseDevice
    }

    /**
     * The IFaxOutboundRoutingRule::get_UseDevice property is a Boolean value that indicates whether the outbound routing rule points to a single fax device.
     * @remarks
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @param {VARIANT_BOOL} bUseDevice 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutingrule-put_usedevice
     */
    put_UseDevice(bUseDevice) {
        result := ComCall(11, this, "short", bUseDevice, "HRESULT")
        return result
    }

    /**
     * The IFaxOutboundRoutingRule::get_DeviceId property specifies the device ID if the outbound routing rule points to a single fax device.
     * @remarks
     * 
     * This property is valid only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutingrule-usedevice-vb">IFaxOutboundRoutingRule::get_UseDevice</a> property is equal to <b>TRUE</b>.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutingrule-get_deviceid
     */
    get_DeviceId() {
        result := ComCall(12, this, "int*", &plDeviceId := 0, "HRESULT")
        return plDeviceId
    }

    /**
     * The IFaxOutboundRoutingRule::get_DeviceId property specifies the device ID if the outbound routing rule points to a single fax device.
     * @remarks
     * 
     * This property is valid only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutingrule-usedevice-vb">IFaxOutboundRoutingRule::get_UseDevice</a> property is equal to <b>TRUE</b>.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @param {Integer} DeviceId 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutingrule-put_deviceid
     */
    put_DeviceId(DeviceId) {
        result := ComCall(13, this, "int", DeviceId, "HRESULT")
        return result
    }

    /**
     * The IFaxOutboundRoutingRule::get_GroupName property specifies the group name if the outbound routing rule points to a group of fax devices.
     * @remarks
     * 
     * This property is valid only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutingrule-usedevice-vb">IFaxOutboundRoutingRule::get_UseDevice</a> property is equal to <b>FALSE</b>.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutingrule-get_groupname
     */
    get_GroupName() {
        pbstrGroupName := BSTR()
        result := ComCall(14, this, "ptr", pbstrGroupName, "HRESULT")
        return pbstrGroupName
    }

    /**
     * The IFaxOutboundRoutingRule::get_GroupName property specifies the group name if the outbound routing rule points to a group of fax devices.
     * @remarks
     * 
     * This property is valid only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutingrule-usedevice-vb">IFaxOutboundRoutingRule::get_UseDevice</a> property is equal to <b>FALSE</b>.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @param {BSTR} bstrGroupName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutingrule-put_groupname
     */
    put_GroupName(bstrGroupName) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(15, this, "ptr", bstrGroupName, "HRESULT")
        return result
    }

    /**
     * The IFaxOutboundRoutingRule::Refresh method refreshes FaxOutboundRoutingRule object information from the fax server.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutingrule-refresh
     */
    Refresh() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * The IFaxOutboundRoutingRule::Save method saves the FaxOutboundRoutingRule object data.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutingrule-save
     */
    Save() {
        result := ComCall(17, this, "HRESULT")
        return result
    }
}
