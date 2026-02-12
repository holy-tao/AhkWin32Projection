#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITsSbBaseNotifySink.ahk

/**
 * Exposes methods that notify Remote Desktop Connection Broker (RD Connection Broker) about initialization or termination of a plug-in.
 * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nn-sbtsv-itssbpluginnotifysink
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
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) that the plug-in has completed a call of Initialize.
     * @remarks
     * Plug-ins should call this method after they complete their initialization process.
     * @param {HRESULT} hr Specifies the result of the call to <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nf-sbtsv-itssbplugin-initialize">Initialize</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbpluginnotifysink-oninitialized
     */
    OnInitialized(hr) {
        result := ComCall(5, this, "int", hr, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) that the plug-in has completed a call of Terminate.
     * @remarks
     * Plug-ins should call this method after they complete their termination process or after throwing a fatal exception.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbpluginnotifysink-onterminated
     */
    OnTerminated() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
