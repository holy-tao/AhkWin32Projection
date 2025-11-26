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
     * The RegisterSink method registers the application for pluggable terminal event notification.
     * @param {ITPluggableTerminalEventSink} pEventSink Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msp/nn-msp-itpluggableterminaleventsink">ITPluggableTerminalEventSink</a> interface.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3/nf-tapi3-itpluggableterminaleventsinkregistration-registersink
     */
    RegisterSink(pEventSink) {
        result := ComCall(3, this, "ptr", pEventSink, "HRESULT")
        return result
    }

    /**
     * The UnregisterSink method clears event registration for pluggable terminal events.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3/nf-tapi3-itpluggableterminaleventsinkregistration-unregistersink
     */
    UnregisterSink() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
