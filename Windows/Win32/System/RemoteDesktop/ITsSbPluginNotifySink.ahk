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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnInitialized", "OnTerminated"]

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbpluginnotifysink-oninitialized
     */
    OnInitialized(hr) {
        result := ComCall(5, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbpluginnotifysink-onterminated
     */
    OnTerminated() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
