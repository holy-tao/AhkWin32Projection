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
     * Changes the parent window of the specified child window.
     * @param {Pointer<IESEventService>} pEventService 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is a handle to the previous parent window.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setparent
     */
    SetParent(pEventService) {
        result := ComCall(3, this, "ptr", pEventService, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveParent() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IESEvents>} pESEvents 
     * @returns {HRESULT} 
     */
    SetOwner(pESEvents) {
        result := ComCall(5, this, "ptr", pESEvents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveOwner() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFilterGraph>} pGraph 
     * @returns {HRESULT} 
     */
    SetGraph(pGraph) {
        result := ComCall(7, this, "ptr", pGraph, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFilterGraph>} pGraph 
     * @returns {HRESULT} 
     */
    RemoveGraph(pGraph) {
        result := ComCall(8, this, "ptr", pGraph, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
