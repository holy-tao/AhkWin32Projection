#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\IFilterGraph.ahk" { IFilterGraph }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\IESEvents.ahk" { IESEvents }
#Import ".\IESEventService.ahk" { IESEventService }

/**
 * Contains methods that configure an event service that implements the IESEventService interface.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESEventServiceConfiguration)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ieseventserviceconfiguration
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IESEventServiceConfiguration extends IUnknown {
    /**
     * The interface identifier for IESEventServiceConfiguration
     * @type {Guid}
     */
    static IID := Guid("{33b9daae-9309-491d-a051-bcad2a70cd66}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IESEventServiceConfiguration interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetParent    : IntPtr
        RemoveParent : IntPtr
        SetOwner     : IntPtr
        RemoveOwner  : IntPtr
        SetGraph     : IntPtr
        RemoveGraph  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IESEventServiceConfiguration.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets a parent event service for an event service that implements the IESEventService interface. Once an event service has set a parent, it can receive advise events from the parent.
     * @param {IESEventService} pEventService Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ieseventservice">IESEventService</a> interface for the parent event service.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieseventserviceconfiguration-setparent
     */
    SetParent(pEventService) {
        result := ComCall(3, this, "ptr", pEventService, "HRESULT")
        return result
    }

    /**
     * Removes the parent of the current event service. Once an event service has removed a parent, the parent can no longer pass advise events to the child event service for handling.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieseventserviceconfiguration-removeparent
     */
    RemoveParent() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Adds an owner to an event service, where event service refers to a generic Windows event service that implements the IESEventService interface.
     * @param {IESEvents} pESEvents Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-iesevents">IESEvents</a> interface that the  parent event service uses to advise its child.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieseventserviceconfiguration-setowner
     */
    SetOwner(pESEvents) {
        result := ComCall(5, this, "ptr", pESEvents, "HRESULT")
        return result
    }

    /**
     * Removes the owner of an event service, where event service refers to a generic Windows event service that implements the IESEventService interface.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieseventserviceconfiguration-removeowner
     */
    RemoveOwner() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Attaches an event service that implements the IESEventService interface to a filter graph. This method allows the processing of events that support the IESEvent interface from devices in the graph.
     * @param {IFilterGraph} pGraph Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ifiltergraph">IFilterGraph</a> interface that is attached to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ieseventservice">IESEventService</a> event service.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieseventserviceconfiguration-setgraph
     */
    SetGraph(pGraph) {
        result := ComCall(7, this, "ptr", pGraph, "HRESULT")
        return result
    }

    /**
     * Removes an event service that implements the IESEventService interface from a filter graph. This method prevents the processing of events from Protected Broadcast Driver Architecture (PBDA) devices in the graph.
     * @param {IFilterGraph} pGraph Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ifiltergraph">IFilterGraph</a> interface for the event service that is removed.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieseventserviceconfiguration-removegraph
     */
    RemoveGraph(pGraph) {
        result := ComCall(8, this, "ptr", pGraph, "HRESULT")
        return result
    }

    Query(iid) {
        if (IESEventServiceConfiguration.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetParent := CallbackCreate(GetMethod(implObj, "SetParent"), flags, 2)
        this.vtbl.RemoveParent := CallbackCreate(GetMethod(implObj, "RemoveParent"), flags, 1)
        this.vtbl.SetOwner := CallbackCreate(GetMethod(implObj, "SetOwner"), flags, 2)
        this.vtbl.RemoveOwner := CallbackCreate(GetMethod(implObj, "RemoveOwner"), flags, 1)
        this.vtbl.SetGraph := CallbackCreate(GetMethod(implObj, "SetGraph"), flags, 2)
        this.vtbl.RemoveGraph := CallbackCreate(GetMethod(implObj, "RemoveGraph"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetParent)
        CallbackFree(this.vtbl.RemoveParent)
        CallbackFree(this.vtbl.SetOwner)
        CallbackFree(this.vtbl.RemoveOwner)
        CallbackFree(this.vtbl.SetGraph)
        CallbackFree(this.vtbl.RemoveGraph)
    }
}
