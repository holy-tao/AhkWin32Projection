#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The ISensLogon2 interface handles logon events fired by SENS.
 * @see https://docs.microsoft.com/windows/win32/api//sensevts/nn-sensevts-isenslogon2
 * @namespace Windows.Win32.System.EventNotificationService
 * @version v4.0.30319
 */
class ISensLogon2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISensLogon2
     * @type {Guid}
     */
    static IID => Guid("{d597bab4-5b9f-11d1-8dd2-00aa004abd5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Logon", "Logoff", "SessionDisconnect", "SessionReconnect", "PostShell"]

    /**
     * The Logon method notifies an application that a user is logged on.
     * @param {BSTR} bstrUserName The name of a user who is logged on.
     * @param {Integer} dwSessionId The session identifier of a session.
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
     * @see https://docs.microsoft.com/windows/win32/api//sensevts/nf-sensevts-isenslogon2-logon
     */
    Logon(bstrUserName, dwSessionId) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(7, this, "ptr", bstrUserName, "uint", dwSessionId, "HRESULT")
        return result
    }

    /**
     * The Logoff method notifies an application that a user is logged off.
     * @param {BSTR} bstrUserName The name of a user who logs off.
     * @param {Integer} dwSessionId The session identifier of a session.
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
     * @see https://docs.microsoft.com/windows/win32/api//sensevts/nf-sensevts-isenslogon2-logoff
     */
    Logoff(bstrUserName, dwSessionId) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(8, this, "ptr", bstrUserName, "uint", dwSessionId, "HRESULT")
        return result
    }

    /**
     * The SessionDisconnect method is used to disconnect from a Fast User Switching session or a Remote Desktop Connection. This is different from logging off from a session, because when you use this method the session is disconnected.
     * @param {BSTR} bstrUserName The name of a current user.
     * @param {Integer} dwSessionId The session identifier of a session.
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
     * @see https://docs.microsoft.com/windows/win32/api//sensevts/nf-sensevts-isenslogon2-sessiondisconnect
     */
    SessionDisconnect(bstrUserName, dwSessionId) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(9, this, "ptr", bstrUserName, "uint", dwSessionId, "HRESULT")
        return result
    }

    /**
     * The session was reconnected. The SessionReconnect method is used when you reconnect to a Fast User Switching session or a Remote Desktop Connection. This is different from logging on to a new session.
     * @param {BSTR} bstrUserName Name of the current user.
     * @param {Integer} dwSessionId The session identifier of the session.
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
     * Method returned successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sensevts/nf-sensevts-isenslogon2-sessionreconnect
     */
    SessionReconnect(bstrUserName, dwSessionId) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(10, this, "ptr", bstrUserName, "uint", dwSessionId, "HRESULT")
        return result
    }

    /**
     * Use the PostShell method when a user has logged on and Windows Explorer is running. This method is different from the Logon method because Logon is called after logon when the Shell may not yet be running.
     * @param {BSTR} bstrUserName Name of the current user.
     * @param {Integer} dwSessionId The session identifier of the session.
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
     * Method returned successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sensevts/nf-sensevts-isenslogon2-postshell
     */
    PostShell(bstrUserName, dwSessionId) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(11, this, "ptr", bstrUserName, "uint", dwSessionId, "HRESULT")
        return result
    }
}
