#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Contains methods that configure an event service that implements the IESEventService interface.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESEventServiceConfiguration)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ieseventserviceconfiguration
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IESEventServiceConfiguration extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IESEventServiceConfiguration
     * @type {Guid}
     */
    static IID => Guid("{33b9daae-9309-491d-a051-bcad2a70cd66}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetParent", "RemoveParent", "SetOwner", "RemoveOwner", "SetGraph", "RemoveGraph"]

    /**
     * Sets a parent event service for an event service that implements the IESEventService interface. Once an event service has set a parent, it can receive advise events from the parent.
     * @param {IESEventService} pEventService Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ieseventservice">IESEventService</a> interface for the parent event service.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ieseventserviceconfiguration-setparent
     */
    SetParent(pEventService) {
        result := ComCall(3, this, "ptr", pEventService, "HRESULT")
        return result
    }

    /**
     * Removes the parent of the current event service. Once an event service has removed a parent, the parent can no longer pass advise events to the child event service for handling.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ieseventserviceconfiguration-removeparent
     */
    RemoveParent() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Adds an owner to an event service, where event service refers to a generic Windows event service that implements the IESEventService interface.
     * @param {IESEvents} pESEvents Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-iesevents">IESEvents</a> interface that the  parent event service uses to advise its child.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ieseventserviceconfiguration-setowner
     */
    SetOwner(pESEvents) {
        result := ComCall(5, this, "ptr", pESEvents, "HRESULT")
        return result
    }

    /**
     * Removes the owner of an event service, where event service refers to a generic Windows event service that implements the IESEventService interface.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ieseventserviceconfiguration-removeowner
     */
    RemoveOwner() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Attaches an event service that implements the IESEventService interface to a filter graph. This method allows the processing of events that support the IESEvent interface from devices in the graph.
     * @param {IFilterGraph} pGraph Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ifiltergraph">IFilterGraph</a> interface that is attached to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ieseventservice">IESEventService</a> event service.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ieseventserviceconfiguration-setgraph
     */
    SetGraph(pGraph) {
        result := ComCall(7, this, "ptr", pGraph, "HRESULT")
        return result
    }

    /**
     * Removes an event service that implements the IESEventService interface from a filter graph. This method prevents the processing of events from Protected Broadcast Driver Architecture (PBDA) devices in the graph.
     * @param {IFilterGraph} pGraph Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ifiltergraph">IFilterGraph</a> interface for the event service that is removed.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ieseventserviceconfiguration-removegraph
     */
    RemoveGraph(pGraph) {
        result := ComCall(8, this, "ptr", pGraph, "HRESULT")
        return result
    }
}
