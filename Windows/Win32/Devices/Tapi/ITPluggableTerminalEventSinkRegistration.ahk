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
     * 
     * @param {Pointer<ITPluggableTerminalEventSink>} pEventSink 
     * @returns {HRESULT} 
     */
    RegisterSink(pEventSink) {
        result := ComCall(3, this, "ptr", pEventSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnregisterSink() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
