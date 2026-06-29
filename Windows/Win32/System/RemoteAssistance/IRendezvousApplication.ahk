#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method used by an instant messaging (IM) application to create a remote assistance session.
 * @remarks
 * After an IM contact has accepted the remote assistance invitation, the IM application must instantiate the Windows Remote Assistance application on both sides of the connection by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> on the Windows Remote Assistance application's <b>IRendezvousApplication</b> interface. 
 * 
 * The IM application calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/rendezvoussession/nf-rendezvoussession-irendezvousapplication-setrendezvoussession">SetRendezvousSession</a> method to pass its implementation of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/rendezvoussession/nn-rendezvoussession-irendezvoussession">IRendezvousSession</a> interface to the Windows Remote Assistance application.
 * @see https://learn.microsoft.com/windows/win32/api/rendezvoussession/nn-rendezvoussession-irendezvousapplication
 * @namespace Windows.Win32.System.RemoteAssistance
 */
export default struct IRendezvousApplication extends IUnknown {
    /**
     * The interface identifier for IRendezvousApplication
     * @type {Guid}
     */
    static IID := Guid("{4f4d070b-a275-49fb-b10d-8ec26387b50d}")

    /**
     * The class identifier for RendezvousApplication
     * @type {Guid}
     */
    static CLSID := Guid("{0b7e019a-b5de-47fa-8966-9082f82fb192}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRendezvousApplication interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetRendezvousSession : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRendezvousApplication.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Passes IRendezvousSession to the Windows Remote Assistance application. This method is used by the instant messaging application.
     * @param {IUnknown} pRendezvousSession <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/rendezvoussession/nn-rendezvoussession-irendezvoussession">IRendezvousSession</a>
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
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/rendezvoussession/nn-rendezvoussession-irendezvoussession">IRendezvousSession</a> was passed to the Windows Remote Assistance application successfully. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session object passed to the method is not valid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A catastrophic error occurred while trying to pass the session to the Windows Remote Assistance application.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rendezvoussession/nf-rendezvoussession-irendezvousapplication-setrendezvoussession
     */
    SetRendezvousSession(pRendezvousSession) {
        result := ComCall(3, this, "ptr", pRendezvousSession, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRendezvousApplication.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetRendezvousSession := CallbackCreate(GetMethod(implObj, "SetRendezvousSession"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetRendezvousSession)
    }
}
