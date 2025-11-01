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
     * 
     * @param {Integer} ulEventID 
     * @param {Integer} ulEventResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_eventingservice-completeevent
     */
    CompleteEvent(ulEventID, ulEventResult) {
        result := ComCall(3, this, "uint", ulEventID, "uint", ulEventResult, "HRESULT")
        return result
    }
}
