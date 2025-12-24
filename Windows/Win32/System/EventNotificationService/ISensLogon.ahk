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
     * The Logon method notifies an application that a user is logged on.
     * @param {BSTR} bstrUserName The name of a user who is logged on.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method returns successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sensevts/nf-sensevts-isenslogon-logon
     */
    Logon(bstrUserName) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(7, this, "ptr", bstrUserName, "HRESULT")
        return result
    }

    /**
     * The Logoff method notifies an application that a user is logged off.
     * @param {BSTR} bstrUserName The name of a user who logs off.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method returns successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sensevts/nf-sensevts-isenslogon-logoff
     */
    Logoff(bstrUserName) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(8, this, "ptr", bstrUserName, "HRESULT")
        return result
    }

    /**
     * The StartShell method notifies an application that the shell is started.
     * @param {BSTR} bstrUserName The name of a current user.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method returns successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sensevts/nf-sensevts-isenslogon-startshell
     */
    StartShell(bstrUserName) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(9, this, "ptr", bstrUserName, "HRESULT")
        return result
    }

    /**
     * The DisplayLock method notifies an application that the screen display is locked.
     * @param {BSTR} bstrUserName The name of a current user.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method returns successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sensevts/nf-sensevts-isenslogon-displaylock
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
     * The StartScreenSaver method notifies an application that a screen saver is started.
     * @param {BSTR} bstrUserName The name of a current user.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method returns successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sensevts/nf-sensevts-isenslogon-startscreensaver
     */
    StartScreenSaver(bstrUserName) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(12, this, "ptr", bstrUserName, "HRESULT")
        return result
    }

    /**
     * The StopScreenSaver method notifies an application that a screen saver is stopped.
     * @param {BSTR} bstrUserName The name of a current user.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method returns successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sensevts/nf-sensevts-isenslogon-stopscreensaver
     */
    StopScreenSaver(bstrUserName) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(13, this, "ptr", bstrUserName, "HRESULT")
        return result
    }
}
