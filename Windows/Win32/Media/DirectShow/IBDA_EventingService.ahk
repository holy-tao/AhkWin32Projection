#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a device's Eventing Service.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_EventingService)</c>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_eventingservice
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_EventingService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_EventingService
     * @type {Guid}
     */
    static IID => Guid("{207c413f-00dc-4c61-bad6-6fee1ff07064}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CompleteEvent"]

    /**
     * Notifies the media transform device (MTD) when the media sink device (MSD) completes an event.
     * @param {Integer} ulEventID The identifier of the event.
     * @param {Integer} ulEventResult The result code of the event.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_eventingservice-completeevent
     */
    CompleteEvent(ulEventID, ulEventResult) {
        result := ComCall(3, this, "uint", ulEventID, "uint", ulEventResult, "HRESULT")
        return result
    }
}
