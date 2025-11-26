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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrule-get_countrycode
     */
    get_CountryCode() {
        result := ComCall(7, this, "int*", &plCountryCode := 0, "HRESULT")
        return plCountryCode
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrule-get_areacode
     */
    get_AreaCode() {
        result := ComCall(8, this, "int*", &plAreaCode := 0, "HRESULT")
        return plAreaCode
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrule-get_status
     */
    get_Status() {
        result := ComCall(9, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrule-get_usedevice
     */
    get_UseDevice() {
        result := ComCall(10, this, "short*", &pbUseDevice := 0, "HRESULT")
        return pbUseDevice
    }

    /**
     * 
     * @param {VARIANT_BOOL} bUseDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrule-put_usedevice
     */
    put_UseDevice(bUseDevice) {
        result := ComCall(11, this, "short", bUseDevice, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrule-get_deviceid
     */
    get_DeviceId() {
        result := ComCall(12, this, "int*", &plDeviceId := 0, "HRESULT")
        return plDeviceId
    }

    /**
     * 
     * @param {Integer} DeviceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrule-put_deviceid
     */
    put_DeviceId(DeviceId) {
        result := ComCall(13, this, "int", DeviceId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrule-get_groupname
     */
    get_GroupName() {
        pbstrGroupName := BSTR()
        result := ComCall(14, this, "ptr", pbstrGroupName, "HRESULT")
        return pbstrGroupName
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrule-put_groupname
     */
    put_GroupName(bstrGroupName) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(15, this, "ptr", bstrGroupName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrule-refresh
     */
    Refresh() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrule-save
     */
    Save() {
        result := ComCall(17, this, "HRESULT")
        return result
    }
}
