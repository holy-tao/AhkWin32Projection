#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWSManEx2.ahk" { IWSManEx2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Extends the methods and properties of the IWSManEx interface to include a method that returns a session flag value related to authentication using the Credential Security Support Provider (CredSSP).
 * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nn-wsmandisp-iwsmanex3
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct IWSManEx3 extends IWSManEx2 {
    /**
     * The interface identifier for IWSManEx3
     * @type {Guid}
     */
    static IID := Guid("{6400e966-011d-4eac-8474-049e0848afad}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSManEx3 interfaces
    */
    struct Vtbl extends IWSManEx2.Vtbl {
        SessionFlagUTF16                             : IntPtr
        SessionFlagUseCredSsp                        : IntPtr
        EnumerationFlagAssociationInstance           : IntPtr
        EnumerationFlagAssociatedInstance            : IntPtr
        SessionFlagSkipRevocationCheck               : IntPtr
        SessionFlagAllowNegotiateImplicitCredentials : IntPtr
        SessionFlagUseSsl                            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSManEx3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    SessionFlagUTF16() {
        result := ComCall(32, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the authentication flag WSManFlagUseCredSsp for use in the flags parameter of IWSMan::CreateSession.
     * @returns {Integer} Specifies the authentication flag to use.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex3-sessionflagusecredssp
     */
    SessionFlagUseCredSsp() {
        result := ComCall(33, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * 
     * @returns {Integer} 
     */
    EnumerationFlagAssociationInstance() {
        result := ComCall(34, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * 
     * @returns {Integer} 
     */
    EnumerationFlagAssociatedInstance() {
        result := ComCall(35, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * 
     * @returns {Integer} 
     */
    SessionFlagSkipRevocationCheck() {
        result := ComCall(36, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * 
     * @returns {Integer} 
     */
    SessionFlagAllowNegotiateImplicitCredentials() {
        result := ComCall(37, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * 
     * @returns {Integer} 
     */
    SessionFlagUseSsl() {
        result := ComCall(38, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    Query(iid) {
        if (IWSManEx3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SessionFlagUTF16 := CallbackCreate(GetMethod(implObj, "SessionFlagUTF16"), flags, 2)
        this.vtbl.SessionFlagUseCredSsp := CallbackCreate(GetMethod(implObj, "SessionFlagUseCredSsp"), flags, 2)
        this.vtbl.EnumerationFlagAssociationInstance := CallbackCreate(GetMethod(implObj, "EnumerationFlagAssociationInstance"), flags, 2)
        this.vtbl.EnumerationFlagAssociatedInstance := CallbackCreate(GetMethod(implObj, "EnumerationFlagAssociatedInstance"), flags, 2)
        this.vtbl.SessionFlagSkipRevocationCheck := CallbackCreate(GetMethod(implObj, "SessionFlagSkipRevocationCheck"), flags, 2)
        this.vtbl.SessionFlagAllowNegotiateImplicitCredentials := CallbackCreate(GetMethod(implObj, "SessionFlagAllowNegotiateImplicitCredentials"), flags, 2)
        this.vtbl.SessionFlagUseSsl := CallbackCreate(GetMethod(implObj, "SessionFlagUseSsl"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SessionFlagUTF16)
        CallbackFree(this.vtbl.SessionFlagUseCredSsp)
        CallbackFree(this.vtbl.EnumerationFlagAssociationInstance)
        CallbackFree(this.vtbl.EnumerationFlagAssociatedInstance)
        CallbackFree(this.vtbl.SessionFlagSkipRevocationCheck)
        CallbackFree(this.vtbl.SessionFlagAllowNegotiateImplicitCredentials)
        CallbackFree(this.vtbl.SessionFlagUseSsl)
    }
}
