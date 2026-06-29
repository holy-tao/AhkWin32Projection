#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFaxOutboundRoutingRules.ahk" { IFaxOutboundRoutingRules }
#Import ".\IFaxOutboundRoutingGroups.ahk" { IFaxOutboundRoutingGroups }

/**
 * The IFaxOutboundRouting interface defines a configuration object that is used by a fax client application to configure the outbound routing groups (IFaxOutboundRoutingGroups interfaces) and outbound routing rules (IFaxOutboundRoutingRules interfaces).
 * @remarks
 * A default implementation of <b>IFaxOutboundRouting</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundrouting">FaxOutboundRouting</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxoutboundrouting
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxOutboundRouting extends IDispatch {
    /**
     * The interface identifier for IFaxOutboundRouting
     * @type {Guid}
     */
    static IID := Guid("{25dc05a4-9909-41bd-a95b-7e5d1dec1d43}")

    /**
     * The class identifier for FaxOutboundRouting
     * @type {Guid}
     */
    static CLSID := Guid("{c81b385e-b869-4afd-86c0-616498ed9be2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxOutboundRouting interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetGroups : IntPtr
        GetRules  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxOutboundRouting.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IFaxOutboundRouting::GetGroups method retrieves an interface that represents a collection of outbound routing groups.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {IFaxOutboundRoutingGroups} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutboundroutinggroups">IFaxOutboundRoutingGroups</a>**</b>
     * 
     * An address of a pointer that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutboundroutinggroups">IFaxOutboundRoutingGroups</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundrouting-getgroups
     */
    GetGroups() {
        result := ComCall(7, this, "ptr*", &pFaxOutboundRoutingGroups := 0, "HRESULT")
        return IFaxOutboundRoutingGroups(pFaxOutboundRoutingGroups)
    }

    /**
     * The IFaxOutboundRouting::GetRules method retrieves an interface that represents a collection of outbound routing groups.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {IFaxOutboundRoutingRules} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutboundroutingrules">IFaxOutboundRoutingRules</a>**</b>
     * 
     * An address of a pointer that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutboundroutingrules">IFaxOutboundRoutingRules</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundrouting-getrules
     */
    GetRules() {
        result := ComCall(8, this, "ptr*", &pFaxOutboundRoutingRules := 0, "HRESULT")
        return IFaxOutboundRoutingRules(pFaxOutboundRoutingRules)
    }

    Query(iid) {
        if (IFaxOutboundRouting.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGroups := CallbackCreate(GetMethod(implObj, "GetGroups"), flags, 2)
        this.vtbl.GetRules := CallbackCreate(GetMethod(implObj, "GetRules"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGroups)
        CallbackFree(this.vtbl.GetRules)
    }
}
