#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITsSbPlugin.ahk

/**
 * Exposes methods that Remote Desktop Connection Broker (RD Connection Broker) uses to ensure that the target is ready before a client is redirected to it.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssborchestration
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbOrchestration extends ITsSbPlugin{
    /**
     * The interface identifier for ITsSbOrchestration
     * @type {Guid}
     */
    static IID => Guid("{64fc1172-9eb7-11dc-8b00-3aba56d89593}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {Pointer<ITsSbClientConnection>} pConnection 
     * @param {Pointer<ITsSbOrchestrationNotifySink>} pOrchestrationNotifySink 
     * @returns {HRESULT} 
     */
    PrepareTargetForConnect(pConnection, pOrchestrationNotifySink) {
        result := ComCall(5, this, "ptr", pConnection, "ptr", pOrchestrationNotifySink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
