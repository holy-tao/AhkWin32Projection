#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements an event service that includes methods that raise events derived from the IESEvent interface.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESEventService)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ieseventservice
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IESEventService extends IUnknown{
    /**
     * The interface identifier for IESEventService
     * @type {Guid}
     */
    static IID => Guid("{ed89a619-4c06-4b2f-99eb-c7669b13047c}")

    /**
     * The class identifier for ESEventService
     * @type {Guid}
     */
    static CLSID => Guid("{c20447fc-ec60-475e-813f-d2b0a6decefe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IESEvent>} pESEvent 
     * @returns {HRESULT} 
     */
    FireESEvent(pESEvent) {
        result := ComCall(3, this, "ptr", pESEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
