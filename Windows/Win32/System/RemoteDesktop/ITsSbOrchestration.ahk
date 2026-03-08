#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITsSbPlugin.ahk

/**
 * Exposes methods that Remote Desktop Connection Broker (RD Connection Broker) uses to ensure that the target is ready before a client is redirected to it.
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssborchestration
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbOrchestration extends ITsSbPlugin{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PrepareTargetForConnect"]

    /**
     * Prepares the target for a client connection.
     * @remarks
     * This method is particularly useful for plug-ins that redirect users to virtual desktops. Remote Desktop Connection Broker (RD Connection Broker) 
     * calls this method after placement has successfully completed. Orchestration can 
     * include waking a virtual machine and determining its IP address. Your implementation of this method should ensure that the target is ready to accept a client connection.
     * @param {ITsSbClientConnection} pConnection A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbclientconnection">ITsSbClientConnection</a> client connection object.
     * @param {ITsSbOrchestrationNotifySink} pOrchestrationNotifySink A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssborchestrationnotifysink">ITsSbOrchestrationNotifySink</a> orchestration notify sink object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssborchestration-preparetargetforconnect
     */
    PrepareTargetForConnect(pConnection, pOrchestrationNotifySink) {
        result := ComCall(5, this, "ptr", pConnection, "ptr", pOrchestrationNotifySink, "HRESULT")
        return result
    }
}
