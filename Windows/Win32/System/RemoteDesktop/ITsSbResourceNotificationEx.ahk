#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that Remote Desktop Connection Broker (RD Connection Broker) uses to notify plug-ins of any state changes that occur in the session, target, and client connection objects. (ITsSbResourceNotificationEx)
 * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nn-sbtsv-itssbresourcenotificationex
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbResourceNotificationEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbResourceNotificationEx
     * @type {Guid}
     */
    static IID => Guid("{a8a47fde-ca91-44d2-b897-3aa28a43b2b7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NotifySessionChangeEx", "NotifyTargetChangeEx", "NotifyClientConnectionStateChangeEx"]

    /**
     * Notifies registered plug-ins about state changes in a session object. (ITsSbResourceNotificationEx.NotifySessionChangeEx)
     * @param {BSTR} targetName The name of the target.
     * @param {BSTR} userName The user name.
     * @param {BSTR} domain The user domain.
     * @param {Integer} sessionId Identifies the session that changed.
     * @param {Integer} sessionState A <a href="https://docs.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-tssession_state">TSSESSION_STATE</a> value specifying he type of change that occurred.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcenotificationex-notifysessionchangeex
     */
    NotifySessionChangeEx(targetName, userName, domain, sessionId, sessionState) {
        if(targetName is String) {
            pin := BSTR.Alloc(targetName)
            targetName := pin.Value
        }
        if(userName is String) {
            pin := BSTR.Alloc(userName)
            userName := pin.Value
        }
        if(domain is String) {
            pin := BSTR.Alloc(domain)
            domain := pin.Value
        }

        result := ComCall(3, this, "ptr", targetName, "ptr", userName, "ptr", domain, "uint", sessionId, "int", sessionState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies registered plug-ins about state changes in a target object. (ITsSbResourceNotificationEx.NotifyTargetChangeEx)
     * @param {BSTR} targetName The name of the target.
     * @param {Integer} targetChangeType A value of the <a href="https://docs.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-target_change_type">TARGET_CHANGE_TYPE</a> enumeration that specifies the type of change that occurred in a target.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcenotificationex-notifytargetchangeex
     */
    NotifyTargetChangeEx(targetName, targetChangeType) {
        if(targetName is String) {
            pin := BSTR.Alloc(targetName)
            targetName := pin.Value
        }

        result := ComCall(4, this, "ptr", targetName, "uint", targetChangeType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies registered plug-ins about state changes in a client connection. (ITsSbResourceNotificationEx.NotifyClientConnectionStateChangeEx)
     * @param {BSTR} userName The user name.
     * @param {BSTR} domain The user domain.
     * @param {BSTR} initialProgram The initial program.
     * @param {BSTR} poolName The name of the pool.
     * @param {BSTR} targetName The name of the target.
     * @param {Integer} connectionChangeType 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcenotificationex-notifyclientconnectionstatechangeex
     */
    NotifyClientConnectionStateChangeEx(userName, domain, initialProgram, poolName, targetName, connectionChangeType) {
        if(userName is String) {
            pin := BSTR.Alloc(userName)
            userName := pin.Value
        }
        if(domain is String) {
            pin := BSTR.Alloc(domain)
            domain := pin.Value
        }
        if(initialProgram is String) {
            pin := BSTR.Alloc(initialProgram)
            initialProgram := pin.Value
        }
        if(poolName is String) {
            pin := BSTR.Alloc(poolName)
            poolName := pin.Value
        }
        if(targetName is String) {
            pin := BSTR.Alloc(targetName)
            targetName := pin.Value
        }

        result := ComCall(5, this, "ptr", userName, "ptr", domain, "ptr", initialProgram, "ptr", poolName, "ptr", targetName, "int", connectionChangeType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
