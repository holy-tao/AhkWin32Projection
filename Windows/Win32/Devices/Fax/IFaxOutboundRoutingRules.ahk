#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IFaxOutboundRoutingRule.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxOutboundRoutingRules interface describes a configuration collection that is used by a fax client application to manage the fax outbound routing rules.
 * @remarks
 * 
 * A default implementation of <b>IFaxOutboundRoutingRules</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutingrules">FaxOutboundRoutingRules</a> object.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxoutboundroutingrules
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxOutboundRoutingRules extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxOutboundRoutingRules
     * @type {Guid}
     */
    static IID => Guid("{dcefa1e7-ae7d-4ed6-8521-369edcca5120}")

    /**
     * The class identifier for FaxOutboundRoutingRules
     * @type {Guid}
     */
    static CLSID => Guid("{d385beca-e624-4473-bfaa-9f4000831f54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count", "ItemByCountryAndArea", "RemoveByCountryAndArea", "Remove", "Add"]

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * The IFaxOutboundRoutingRules::get__NewEnum method returns a reference to an enumerator object that you can use to iterate through the FaxOutboundRoutingRules collection.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     *  Receives an indirect pointer to the enumerator object <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for this collection.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutingrules-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * The IFaxOutboundRoutingRules::get_Item method returns a IFaxOutboundRoutingRule interface from the IFaxOutboundRoutingRules interface using the routing rule's index.
     * @param {Integer} lIndex Type: <b>long</b>
     * 
     * A <b>long</b> value that specifies the outbound routing rule to retrieve from the collection. Valid values for this parameter are in the range from 1 to n, where n is the number of items returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutingrules-count-vb">IFaxOutboundRoutingRules::get_Count</a> method.
     * @returns {IFaxOutboundRoutingRule} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutboundroutingrule">IFaxOutboundRoutingRule</a>**</b>
     * 
     * An address of a pointer that receives the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutboundroutingrule">IFaxOutboundRoutingRule</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutingrules-get_item
     */
    get_Item(lIndex) {
        result := ComCall(8, this, "int", lIndex, "ptr*", &pFaxOutboundRoutingRule := 0, "HRESULT")
        return IFaxOutboundRoutingRule(pFaxOutboundRoutingRule)
    }

    /**
     * The IFaxOutboundRoutingRules::get_Count property represents the number of objects in the FaxOutboundRoutingRules collection. This is the total number of outbound routing rules associated with the fax server.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutingrules-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * The IFaxOutboundRoutingRules::get_ItemByCountryAndArea method returns an outbound routing rule (FaxOutboundRoutingRule object) from the collection using the routing rule's country/region code and area code.
     * @param {Integer} lCountryCode Type: <b>long</b>
     * 
     * A <b>long</b> value that specifies the country/region code of the outbound routing rule to retrieve. Specifying <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_routing_rule_code_enum">frrcANY_CODE</a> will return a rule for any country/region code.
     * @param {Integer} lAreaCode Type: <b>long</b>
     * 
     * A <b>long</b> value that specifies the area code of the outbound routing rule to retrieve. Specifying <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_routing_rule_code_enum">frrcANY_CODE</a> will return a rule for any area code within the specified country/region code.
     * @returns {IFaxOutboundRoutingRule} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutingrule">FaxOutboundRoutingRule</a>**</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutingrule">FaxOutboundRoutingRule</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutingrules-itembycountryandarea
     */
    ItemByCountryAndArea(lCountryCode, lAreaCode) {
        result := ComCall(10, this, "int", lCountryCode, "int", lAreaCode, "ptr*", &pFaxOutboundRoutingRule := 0, "HRESULT")
        return IFaxOutboundRoutingRule(pFaxOutboundRoutingRule)
    }

    /**
     * The IFaxOutboundRoutingRules::RemoveByCountryAndArea method removes an outbound routing rule (FaxOutboundRoutingRule object) from the collection using the routing rule's country/region code and area code.
     * @param {Integer} lCountryCode Type: <b>long</b>
     * 
     * A <b>long</b> value that specifies the country/region code of the outbound routing rule to remove from the collection. Specifying <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_routing_rule_code_enum">frrcANY_CODE</a> will remove a rule that applies to all country/region codes.
     * @param {Integer} lAreaCode Type: <b>long</b>
     * 
     * A <b>long</b> value that specifies the area code of the outbound routing rule to remove from the collection. Specifying <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_routing_rule_code_enum">frrcANY_CODE</a> will remove a rule that applies to all area codes within the specified country/region code.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutingrules-removebycountryandarea
     */
    RemoveByCountryAndArea(lCountryCode, lAreaCode) {
        result := ComCall(11, this, "int", lCountryCode, "int", lAreaCode, "HRESULT")
        return result
    }

    /**
     * The IFaxOutboundRoutingRules::Remove method removes an outbound routing rule (FaxOutboundRoutingRule object) from the FaxOutboundRoutingRules collection using the routing rule's index.
     * @param {Integer} lIndex Type: <b>long</b>
     * 
     * A <b>long</b> value that specifies the index of the outbound routing rule to remove from the collection. Valid values for this parameter are in the range from 1 to n, where n is the number of rules returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutingrules-count-vb">IFaxOutboundRoutingRules::get_Count</a> method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutingrules-remove
     */
    Remove(lIndex) {
        result := ComCall(12, this, "int", lIndex, "HRESULT")
        return result
    }

    /**
     * The IFaxOutboundRoutingRules::Add method adds an outbound routing rule (IFaxOutboundRoutingRule interface) to the collection defined by the IFaxOutboundRoutingRules interface.
     * @param {Integer} lCountryCode Type: <b>long</b>
     * 
     * A <b>long</b> value that specifies the country/region code to associate with the outbound routing rule. Specifying <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_routing_rule_code_enum">frrcANY_CODE</a> will add a rule that applies to any country/region code.
     * @param {Integer} lAreaCode Type: <b>long</b>
     * 
     * Specifies a <b>long</b> value that indicates the area code to associate with the outbound routing rule. Specifying <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_routing_rule_code_enum">frrcANY_CODE</a> will add a rule that applies to any area code within the specified country/region code.
     * @param {VARIANT_BOOL} bUseDevice Type: <b>VARIANT_BOOL</b>
     * 
     * Specifies a Boolean value that indicates whether the outbound routing rule points to a single fax device rather than to a group of devices.
     * @param {BSTR} bstrGroupName Type: <b>BSTR</b>
     * 
     * Specifies a null-terminated string that contains the name of the outbound routing group to which the new routing rule belongs. If <i>bUseDevice</i> is set to <b>TRUE</b>, this should be an empty string.
     * @param {Integer} lDeviceId Type: <b>long</b>
     * 
     * Specifies the device to associate with the outbound routing rule. If <i>bUseDevice</i> is set to <b>FALSE</b>, this parameter is ignored.
     * @returns {IFaxOutboundRoutingRule} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutboundroutingrule">IFaxOutboundRoutingRule</a>**</b>
     * 
     * An address of a pointer that receives a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutboundroutingrule">IFaxOutboundRoutingRule</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutingrules-add
     */
    Add(lCountryCode, lAreaCode, bUseDevice, bstrGroupName, lDeviceId) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(13, this, "int", lCountryCode, "int", lAreaCode, "short", bUseDevice, "ptr", bstrGroupName, "int", lDeviceId, "ptr*", &pFaxOutboundRoutingRule := 0, "HRESULT")
        return IFaxOutboundRoutingRule(pFaxOutboundRoutingRule)
    }
}
