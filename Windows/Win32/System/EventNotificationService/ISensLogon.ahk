#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ISensLogon interface handles logon events fired by SENS.
 * @see https://learn.microsoft.com/windows/win32/api/sensevts/nn-sensevts-isenslogon
 * @namespace Windows.Win32.System.EventNotificationService
 */
export default struct ISensLogon extends IDispatch {
    /**
     * The interface identifier for ISensLogon
     * @type {Guid}
     */
    static IID := Guid("{d597bab3-5b9f-11d1-8dd2-00aa004abd5e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISensLogon interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Logon            : IntPtr
        Logoff           : IntPtr
        StartShell       : IntPtr
        DisplayLock      : IntPtr
        DisplayUnlock    : IntPtr
        StartScreenSaver : IntPtr
        StopScreenSaver  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISensLogon.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Logon method notifies an application that a user is logged on. (ISensLogon.Logon)
     * @remarks
     * SENS calls this method to notify an application that a user is logged on.
     * 
     * <div class="alert"><b>Important</b>  This function will not work with multiple logins through Remote Desktop Services and does not support Remote Desktop Services or Fast-User Switching scenarios. Desktop applications can register for session changes notifications by calling <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsregistersessionnotification">WTSRegisterSessionNotification</a>. Services can handle session change notifications via SERVICE_CONTROL_SESSIONCHANGE control codes in their <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function_ex">HandlerEx</a> callback function.</div>
     * <div> </div>
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
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isenslogon-logon
     */
    Logon(bstrUserName) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(7, this, BSTR, bstrUserName, "HRESULT")
        return result
    }

    /**
     * The Logoff method notifies an application that a user is logged off. (ISensLogon.Logoff)
     * @remarks
     * SENS calls this method to notify an application that a user is logged off.
     * 
     * <div class="alert"><b>Important</b>  This function will not work with multiple logins through Remote Desktop Services and does not support Remote Desktop Services or Fast-User Switching scenarios. Desktop applications can register for session changes notifications by calling <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsregistersessionnotification">WTSRegisterSessionNotification</a>. Services can handle session change notifications via SERVICE_CONTROL_SESSIONCHANGE control codes in their <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function_ex">HandlerEx</a> callback function.</div>
     * <div> </div>
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
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isenslogon-logoff
     */
    Logoff(bstrUserName) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(8, this, BSTR, bstrUserName, "HRESULT")
        return result
    }

    /**
     * The StartShell method notifies an application that the shell is started.
     * @remarks
     * SENS calls this method to notify an application that the shell is started.
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
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isenslogon-startshell
     */
    StartShell(bstrUserName) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(9, this, BSTR, bstrUserName, "HRESULT")
        return result
    }

    /**
     * The DisplayLock method notifies an application that the screen display is locked.
     * @remarks
     * SENS calls this method to notify an application that the screen display is locked.
     * 
     * <div class="alert"><b>Important</b>  This function will not work with multiple logins through Remote Desktop Services and does not support Remote Desktop Services or Fast-User Switching scenarios. Desktop applications can register for session changes notifications by calling <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsregistersessionnotification">WTSRegisterSessionNotification</a>. Services can handle session change notifications via SERVICE_CONTROL_SESSIONCHANGE control codes in their <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function_ex">HandlerEx</a> callback function.</div>
     * <div> </div>
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
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isenslogon-displaylock
     */
    DisplayLock(bstrUserName) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(10, this, BSTR, bstrUserName, "HRESULT")
        return result
    }

    /**
     * The DisplayUnLock method notifies an application that the screen display is unlocked.
     * @remarks
     * SENS calls this method to notify an application that the screen display is unlocked.
     * 
     * <div class="alert"><b>Important</b>  This function will not work with multiple logins through Remote Desktop Services and does not support Remote Desktop Services or Fast-User Switching scenarios. Desktop applications can register for session changes notifications by calling <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsregistersessionnotification">WTSRegisterSessionNotification</a>. Services can handle session change notifications via SERVICE_CONTROL_SESSIONCHANGE control codes in their <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function_ex">HandlerEx</a> callback function.</div>
     * <div> </div>
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
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isenslogon-displayunlock
     */
    DisplayUnlock(bstrUserName) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(11, this, BSTR, bstrUserName, "HRESULT")
        return result
    }

    /**
     * The StartScreenSaver method notifies an application that a screen saver is started.
     * @remarks
     * SENS calls this method to notify an application that a screen saver is started.
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
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isenslogon-startscreensaver
     */
    StartScreenSaver(bstrUserName) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(12, this, BSTR, bstrUserName, "HRESULT")
        return result
    }

    /**
     * The StopScreenSaver method notifies an application that a screen saver is stopped.
     * @remarks
     * SENS calls this method to notify an application that a screen saver is stopped.
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
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isenslogon-stopscreensaver
     */
    StopScreenSaver(bstrUserName) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(13, this, BSTR, bstrUserName, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISensLogon.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Logon := CallbackCreate(GetMethod(implObj, "Logon"), flags, 2)
        this.vtbl.Logoff := CallbackCreate(GetMethod(implObj, "Logoff"), flags, 2)
        this.vtbl.StartShell := CallbackCreate(GetMethod(implObj, "StartShell"), flags, 2)
        this.vtbl.DisplayLock := CallbackCreate(GetMethod(implObj, "DisplayLock"), flags, 2)
        this.vtbl.DisplayUnlock := CallbackCreate(GetMethod(implObj, "DisplayUnlock"), flags, 2)
        this.vtbl.StartScreenSaver := CallbackCreate(GetMethod(implObj, "StartScreenSaver"), flags, 2)
        this.vtbl.StopScreenSaver := CallbackCreate(GetMethod(implObj, "StopScreenSaver"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Logon)
        CallbackFree(this.vtbl.Logoff)
        CallbackFree(this.vtbl.StartShell)
        CallbackFree(this.vtbl.DisplayLock)
        CallbackFree(this.vtbl.DisplayUnlock)
        CallbackFree(this.vtbl.StartScreenSaver)
        CallbackFree(this.vtbl.StopScreenSaver)
    }
}
