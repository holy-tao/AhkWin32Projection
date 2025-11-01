#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITPluggableTerminalEventSinkRegistration interface registers and unregisters a client application for pluggable terminal events. The ITPluggableTerminalEventSinkRegistration interface is created by calling QueryInterface on ITTerminal.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3/nn-tapi3-itpluggableterminaleventsinkregistration
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITPluggableTerminalEventSinkRegistration extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITPluggableTerminalEventSinkRegistration
     * @type {Guid}
     */
    static IID => Guid("{f7115709-a216-4957-a759-060ab32a90d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterSink", "UnregisterSink"]

    /**
     * 
     * @param {ITPluggableTerminalEventSink} pEventSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msp/nf-msp-itpluggableterminaleventsinkregistration-registersink
     */
    RegisterSink(pEventSink) {
        result := ComCall(3, this, "ptr", pEventSink, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msp/nf-msp-itpluggableterminaleventsinkregistration-unregistersink
     */
    UnregisterSink() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
