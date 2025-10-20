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
     * 
     * @param {Integer} changeType 
     * @param {Pointer<ITsSbSession>} pSession 
     * @returns {HRESULT} 
     */
    NotifySessionChange(changeType, pSession) {
        result := ComCall(3, this, "int", changeType, "ptr", pSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} TargetChangeType 
     * @param {Pointer<ITsSbTarget>} pTarget 
     * @returns {HRESULT} 
     */
    NotifyTargetChange(TargetChangeType, pTarget) {
        result := ComCall(4, this, "uint", TargetChangeType, "ptr", pTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ChangeType 
     * @param {Pointer<ITsSbClientConnection>} pConnection 
     * @returns {HRESULT} 
     */
    NotifyClientConnectionStateChange(ChangeType, pConnection) {
        result := ComCall(5, this, "int", ChangeType, "ptr", pConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
