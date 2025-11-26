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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FireESEvent"]

    /**
     * Raises an event derived from the IESEvent interface.
     * @param {IESEvent} pESEvent Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-iesevent">IESEvent</a> interface for the event being raised.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ieseventservice-fireesevent
     */
    FireESEvent(pESEvent) {
        result := ComCall(3, this, "ptr", pESEvent, "HRESULT")
        return result
    }
}
