#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWSManEx.ahk" { IWSManEx }

/**
 * Extends the methods and properties of the IWSManEx interface to include a method that returns a session flag value related to authentication using client certificates.
 * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nn-wsmandisp-iwsmanex2
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct IWSManEx2 extends IWSManEx {
    /**
     * The interface identifier for IWSManEx2
     * @type {Guid}
     */
    static IID := Guid("{1d1b5ae0-42d9-4021-8261-3987619512e9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSManEx2 interfaces
    */
    struct Vtbl extends IWSManEx.Vtbl {
        SessionFlagUseClientCertificate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSManEx2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the value of the authentication flag WSManFlagUseClientCertificate for use in the flags parameter of IWSMan::CreateSession.
     * @returns {Integer} The session flags to use.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex2-sessionflaguseclientcertificate
     */
    SessionFlagUseClientCertificate() {
        result := ComCall(31, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    Query(iid) {
        if (IWSManEx2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SessionFlagUseClientCertificate := CallbackCreate(GetMethod(implObj, "SessionFlagUseClientCertificate"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SessionFlagUseClientCertificate)
    }
}
