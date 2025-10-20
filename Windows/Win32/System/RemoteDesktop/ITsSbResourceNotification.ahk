#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that Remote Desktop Connection Broker (RD Connection Broker) uses to notify plug-ins of any state changes that occur in the session, target, and client connection objects.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbresourcenotification
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbResourceNotification extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbResourceNotification
     * @type {Guid}
     */
    static IID => Guid("{65d3e85a-c39b-11dc-b92d-3cd255d89593}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NotifySessionChange", "NotifyTargetChange", "NotifyClientConnectionStateChange"]

    /**
     * 
     * @param {Integer} changeType 
     * @param {ITsSbSession} pSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcenotification-notifysessionchange
     */
    NotifySessionChange(changeType, pSession) {
        result := ComCall(3, this, "int", changeType, "ptr", pSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} TargetChangeType 
     * @param {ITsSbTarget} pTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcenotification-notifytargetchange
     */
    NotifyTargetChange(TargetChangeType, pTarget) {
        result := ComCall(4, this, "uint", TargetChangeType, "ptr", pTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ChangeType 
     * @param {ITsSbClientConnection} pConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcenotification-notifyclientconnectionstatechange
     */
    NotifyClientConnectionStateChange(ChangeType, pConnection) {
        result := ComCall(5, this, "int", ChangeType, "ptr", pConnection, "HRESULT")
        return result
    }
}
