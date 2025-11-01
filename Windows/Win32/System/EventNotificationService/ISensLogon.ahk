#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The ISensLogon interface handles logon events fired by SENS.
 * @see https://docs.microsoft.com/windows/win32/api//sensevts/nn-sensevts-isenslogon
 * @namespace Windows.Win32.System.EventNotificationService
 * @version v4.0.30319
 */
class ISensLogon extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISensLogon
     * @type {Guid}
     */
    static IID => Guid("{d597bab3-5b9f-11d1-8dd2-00aa004abd5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Logon", "Logoff", "StartShell", "DisplayLock", "DisplayUnlock", "StartScreenSaver", "StopScreenSaver"]

    /**
     * 
     * @param {BSTR} bstrUserName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isenslogon-logon
     */
    Logon(bstrUserName) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(7, this, "ptr", bstrUserName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUserName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isenslogon-logoff
     */
    Logoff(bstrUserName) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(8, this, "ptr", bstrUserName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUserName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isenslogon-startshell
     */
    StartShell(bstrUserName) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(9, this, "ptr", bstrUserName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUserName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isenslogon-displaylock
     */
    DisplayLock(bstrUserName) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(10, this, "ptr", bstrUserName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUserName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isenslogon-displayunlock
     */
    DisplayUnlock(bstrUserName) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(11, this, "ptr", bstrUserName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUserName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isenslogon-startscreensaver
     */
    StartScreenSaver(bstrUserName) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(12, this, "ptr", bstrUserName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUserName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isenslogon-stopscreensaver
     */
    StopScreenSaver(bstrUserName) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(13, this, "ptr", bstrUserName, "HRESULT")
        return result
    }
}
