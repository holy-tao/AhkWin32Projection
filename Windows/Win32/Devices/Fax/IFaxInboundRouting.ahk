#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFaxInboundRoutingMethods.ahk" { IFaxInboundRoutingMethods }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFaxInboundRoutingExtensions.ahk" { IFaxInboundRoutingExtensions }

/**
 * The IFaxInboundRouting interface defines a configuration object used by a fax client application to access the inbound routing extensions registered with the fax service, represented by FaxInboundRoutingExtensions objects, and the routing methods the extensions expose, represented by FaxInboundRoutingMethods objects.
 * @remarks
 * A default implementation of <b>IFaxInboundRouting</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundrouting">FaxInboundRouting</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxinboundrouting
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxInboundRouting extends IDispatch {
    /**
     * The interface identifier for IFaxInboundRouting
     * @type {Guid}
     */
    static IID := Guid("{8148c20f-9d52-45b1-bf96-38fc12713527}")

    /**
     * The class identifier for FaxInboundRouting
     * @type {Guid}
     */
    static CLSID := Guid("{e80248ed-ad65-4218-8108-991924d4e7ed}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxInboundRouting interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetExtensions : IntPtr
        GetMethods    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxInboundRouting.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetExtensions method retrieves the collection of inbound routing extensions registered with the fax service.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {IFaxInboundRoutingExtensions} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxinboundroutingextensions">IFaxInboundRoutingExtensions</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxinboundroutingextensions">IFaxInboundRoutingExtensions</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundrouting-getextensions
     */
    GetExtensions() {
        result := ComCall(7, this, "ptr*", &pFaxInboundRoutingExtensions := 0, "HRESULT")
        return IFaxInboundRoutingExtensions(pFaxInboundRoutingExtensions)
    }

    /**
     * The IFaxInboundRouting::GetMethods method retrieves the ordered collection of all the inbound routing methods exposed by all the inbound routing extensions currently registered with the fax service.
     * @remarks
     * Order is based on the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingmethod-priority">Priority</a> property of each routing method. The priority is associated with the order in which the fax service calls the routing method when the service receives a fax job.
     * 
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {IFaxInboundRoutingMethods} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxinboundroutingmethods">IFaxInboundRoutingMethods</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxinboundroutingmethods">IFaxInboundRoutingMethods</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundrouting-getmethods
     */
    GetMethods() {
        result := ComCall(8, this, "ptr*", &pFaxInboundRoutingMethods := 0, "HRESULT")
        return IFaxInboundRoutingMethods(pFaxInboundRoutingMethods)
    }

    Query(iid) {
        if (IFaxInboundRouting.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetExtensions := CallbackCreate(GetMethod(implObj, "GetExtensions"), flags, 2)
        this.vtbl.GetMethods := CallbackCreate(GetMethod(implObj, "GetMethods"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetExtensions)
        CallbackFree(this.vtbl.GetMethods)
    }
}
