#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITsSbBaseNotifySink.ahk

/**
 * Exposes methods that notify Remote Desktop Connection Broker (RD Connection Broker) about initialization or termination of a plug-in.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbpluginnotifysink
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbPluginNotifySink extends ITsSbBaseNotifySink{
    /**
     * The interface identifier for ITsSbPluginNotifySink
     * @type {Guid}
     */
    static IID => Guid("{44dfe30b-c3be-40f5-bf82-7a95bb795adf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     */
    OnInitialized(hr) {
        result := ComCall(5, this, "int", hr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnTerminated() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
