#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implements event handling for devices that have registered to receive specific events derived from the IESEvent interface. In a Protected Broadcast Driver Architecture graph, Media Sink Devices implement this interface to register for events.
 * @remarks
 * 
 * 
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESEvents)</c>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-iesevents
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IESEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IESEvents
     * @type {Guid}
     */
    static IID => Guid("{abd414bf-cfe5-4e5e-af5b-4b4e49c5bfeb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnESEventReceived"]

    /**
     * 
     * @param {Guid} guidEventType 
     * @param {IESEvent} pESEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesevents-oneseventreceived
     */
    OnESEventReceived(guidEventType, pESEvent) {
        result := ComCall(3, this, "ptr", guidEventType, "ptr", pESEvent, "HRESULT")
        return result
    }
}
