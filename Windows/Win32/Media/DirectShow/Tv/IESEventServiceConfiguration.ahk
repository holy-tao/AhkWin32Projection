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
     * Changes the parent window of the specified child window.
     * @param {IESEventService} pEventService 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is a handle to the previous parent window.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setparent
     */
    SetParent(pEventService) {
        result := ComCall(3, this, "ptr", pEventService, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieseventserviceconfiguration-removeparent
     */
    RemoveParent() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IESEvents} pESEvents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieseventserviceconfiguration-setowner
     */
    SetOwner(pESEvents) {
        result := ComCall(5, this, "ptr", pESEvents, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieseventserviceconfiguration-removeowner
     */
    RemoveOwner() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFilterGraph} pGraph 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieseventserviceconfiguration-setgraph
     */
    SetGraph(pGraph) {
        result := ComCall(7, this, "ptr", pGraph, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFilterGraph} pGraph 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieseventserviceconfiguration-removegraph
     */
    RemoveGraph(pGraph) {
        result := ComCall(8, this, "ptr", pGraph, "HRESULT")
        return result
    }
}
