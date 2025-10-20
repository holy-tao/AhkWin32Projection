#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that Remote Desktop Connection Broker (RD Connection Broker) uses to notify plug-ins of any state changes that occur in the session, target, and client connection objects.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbresourcenotificationex
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbResourceNotificationEx extends IUnknown{
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
     * 
     * @param {BSTR} targetName 
     * @param {BSTR} userName 
     * @param {BSTR} domain 
     * @param {Integer} sessionId 
     * @param {Integer} sessionState 
     * @returns {HRESULT} 
     */
    NotifySessionChangeEx(targetName, userName, domain, sessionId, sessionState) {
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName
        userName := userName is String ? BSTR.Alloc(userName).Value : userName
        domain := domain is String ? BSTR.Alloc(domain).Value : domain

        result := ComCall(3, this, "ptr", targetName, "ptr", userName, "ptr", domain, "uint", sessionId, "int", sessionState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} targetName 
     * @param {Integer} targetChangeType 
     * @returns {HRESULT} 
     */
    NotifyTargetChangeEx(targetName, targetChangeType) {
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName

        result := ComCall(4, this, "ptr", targetName, "uint", targetChangeType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} userName 
     * @param {BSTR} domain 
     * @param {BSTR} initialProgram 
     * @param {BSTR} poolName 
     * @param {BSTR} targetName 
     * @param {Integer} connectionChangeType 
     * @returns {HRESULT} 
     */
    NotifyClientConnectionStateChangeEx(userName, domain, initialProgram, poolName, targetName, connectionChangeType) {
        userName := userName is String ? BSTR.Alloc(userName).Value : userName
        domain := domain is String ? BSTR.Alloc(domain).Value : domain
        initialProgram := initialProgram is String ? BSTR.Alloc(initialProgram).Value : initialProgram
        poolName := poolName is String ? BSTR.Alloc(poolName).Value : poolName
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName

        result := ComCall(5, this, "ptr", userName, "ptr", domain, "ptr", initialProgram, "ptr", poolName, "ptr", targetName, "int", connectionChangeType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
