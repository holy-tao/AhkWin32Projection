#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFaxOutboundRoutingGroups.ahk
#Include .\IFaxOutboundRoutingRules.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxOutboundRouting interface defines a configuration object that is used by a fax client application to configure the outbound routing groups (IFaxOutboundRoutingGroups interfaces) and outbound routing rules (IFaxOutboundRoutingRules interfaces).
 * @remarks
 * A default implementation of <b>IFaxOutboundRouting</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundrouting">FaxOutboundRouting</a> object.
 * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nn-faxcomex-ifaxoutboundrouting
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxOutboundRouting extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxOutboundRouting
     * @type {Guid}
     */
    static IID => Guid("{25dc05a4-9909-41bd-a95b-7e5d1dec1d43}")

    /**
     * The class identifier for FaxOutboundRouting
     * @type {Guid}
     */
    static CLSID => Guid("{c81b385e-b869-4afd-86c0-616498ed9be2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGroups", "GetRules"]

    /**
     * The IFaxOutboundRouting::GetGroups method retrieves an interface that represents a collection of outbound routing groups.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {IFaxOutboundRoutingGroups} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutboundroutinggroups">IFaxOutboundRoutingGroups</a>**</b>
     * 
     * An address of a pointer that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutboundroutinggroups">IFaxOutboundRoutingGroups</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxoutboundrouting-getgroups
     */
    GetGroups() {
        result := ComCall(7, this, "ptr*", &pFaxOutboundRoutingGroups := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFaxOutboundRoutingGroups(pFaxOutboundRoutingGroups)
    }

    /**
     * The IFaxOutboundRouting::GetRules method retrieves an interface that represents a collection of outbound routing groups.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {IFaxOutboundRoutingRules} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutboundroutingrules">IFaxOutboundRoutingRules</a>**</b>
     * 
     * An address of a pointer that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutboundroutingrules">IFaxOutboundRoutingRules</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxoutboundrouting-getrules
     */
    GetRules() {
        result := ComCall(8, this, "ptr*", &pFaxOutboundRoutingRules := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFaxOutboundRoutingRules(pFaxOutboundRoutingRules)
    }
}
