#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IFaxActivity interface defines a read-only configuration object.
 * @remarks
 * A default implementation of <b>IFaxActivity</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxactivity">FaxActivity</a> object.
 * 
 * You can configure whether the fax service logs information about incoming and outgoing fax jobs in an activity log database. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxactivitylogging">FaxActivityLogging</a> configuration object permits configuration of the activity logging options that the fax service uses.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxactivity
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxActivity extends IDispatch {
    /**
     * The interface identifier for IFaxActivity
     * @type {Guid}
     */
    static IID := Guid("{4b106f97-3df5-40f2-bc3c-44cb8115ebdf}")

    /**
     * The class identifier for FaxActivity
     * @type {Guid}
     */
    static CLSID := Guid("{cfef5d0e-e84d-462e-aabb-87d31eb04fef}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxActivity interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_IncomingMessages : IntPtr
        get_RoutingMessages  : IntPtr
        get_OutgoingMessages : IntPtr
        get_QueuedMessages   : IntPtr
        Refresh              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxActivity.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    IncomingMessages {
        get => this.get_IncomingMessages()
    }

    /**
     * @type {Integer} 
     */
    RoutingMessages {
        get => this.get_RoutingMessages()
    }

    /**
     * @type {Integer} 
     */
    OutgoingMessages {
        get => this.get_OutgoingMessages()
    }

    /**
     * @type {Integer} 
     */
    QueuedMessages {
        get => this.get_QueuedMessages()
    }

    /**
     * The IFaxActivity::get_IncomingMessages property is a number that represents the total number of incoming fax jobs that the fax service is currently in the process of receiving.
     * @remarks
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivity-get_incomingmessages
     */
    get_IncomingMessages() {
        result := ComCall(7, this, "int*", &plIncomingMessages := 0, "HRESULT")
        return plIncomingMessages
    }

    /**
     * The IFaxActivity::get_RoutingMessages property is a number that represents the total number of incoming fax jobs that the fax service is currently routing.
     * @remarks
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivity-get_routingmessages
     */
    get_RoutingMessages() {
        result := ComCall(8, this, "int*", &plRoutingMessages := 0, "HRESULT")
        return plRoutingMessages
    }

    /**
     * The IFaxActivity::get_OutgoingMessages property is a number that represents the total number of outgoing fax jobs that the fax service is in the process of sending.
     * @remarks
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivity-get_outgoingmessages
     */
    get_OutgoingMessages() {
        result := ComCall(9, this, "int*", &plOutgoingMessages := 0, "HRESULT")
        return plOutgoingMessages
    }

    /**
     * The IFaxActivity::get_QueuedMessages property is a number that represents the total number of fax jobs in the fax job queue that are pending processing. This does not include jobs for which the number of retries has been exceeded.
     * @remarks
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivity-get_queuedmessages
     */
    get_QueuedMessages() {
        result := ComCall(10, this, "int*", &plQueuedMessages := 0, "HRESULT")
        return plQueuedMessages
    }

    /**
     * The IFaxActivity::Refresh method refreshes FaxActivity information from the fax server.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxactivity-refresh
     */
    Refresh() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFaxActivity.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_IncomingMessages := CallbackCreate(GetMethod(implObj, "get_IncomingMessages"), flags, 2)
        this.vtbl.get_RoutingMessages := CallbackCreate(GetMethod(implObj, "get_RoutingMessages"), flags, 2)
        this.vtbl.get_OutgoingMessages := CallbackCreate(GetMethod(implObj, "get_OutgoingMessages"), flags, 2)
        this.vtbl.get_QueuedMessages := CallbackCreate(GetMethod(implObj, "get_QueuedMessages"), flags, 2)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_IncomingMessages)
        CallbackFree(this.vtbl.get_RoutingMessages)
        CallbackFree(this.vtbl.get_OutgoingMessages)
        CallbackFree(this.vtbl.get_QueuedMessages)
        CallbackFree(this.vtbl.Refresh)
    }
}
