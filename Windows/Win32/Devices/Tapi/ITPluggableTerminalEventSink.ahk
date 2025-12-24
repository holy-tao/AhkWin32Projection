#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITPluggableTerminalEventSink interface provides a method that fires a message to notify client applications about a change in a pluggable terminal.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3/nn-tapi3-itpluggableterminaleventsink
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITPluggableTerminalEventSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITPluggableTerminalEventSink
     * @type {Guid}
     */
    static IID => Guid("{6e0887be-ba1a-492e-bd10-4020ec5e33e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FireEvent"]

    /**
     * The FireEvent method results in a message that notifies the client application of a change in the pluggable terminal.
     * @param {Pointer<MSP_EVENT_INFO>} pMspEventInfo Pointer to a const cast of the 
     * <a href="https://docs.microsoft.com/windows/win32/api/msp/ns-msp-msp_event_info">MSP_EVENT_INFO</a> structure.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3/nf-tapi3-itpluggableterminaleventsink-fireevent
     */
    FireEvent(pMspEventInfo) {
        result := ComCall(3, this, "ptr", pMspEventInfo, "HRESULT")
        return result
    }
}
