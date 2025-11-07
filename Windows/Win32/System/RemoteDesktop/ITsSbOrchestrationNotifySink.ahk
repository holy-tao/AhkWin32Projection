#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITsSbBaseNotifySink.ahk

/**
 * Exposes methods that return an ITsSbTarget object to Remote Desktop Connection Broker (RD Connection Broker) after the target is successfully prepared for a connection.
 * @remarks
 * 
 * Plug-ins should use this interface to return an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtarget">ITsSbTarget</a> object to RD Connection Broker after the plug-in has successfully prepared ("orchestrated") the target.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssborchestrationnotifysink
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbOrchestrationNotifySink extends ITsSbBaseNotifySink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbOrchestrationNotifySink
     * @type {Guid}
     */
    static IID => Guid("{36c37d61-926b-442f-bca5-118c6d50dcf2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnReadyToConnect"]

    /**
     * 
     * @param {ITsSbTarget} pTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssborchestrationnotifysink-onreadytoconnect
     */
    OnReadyToConnect(pTarget) {
        result := ComCall(5, this, "ptr", pTarget, "HRESULT")
        return result
    }
}
