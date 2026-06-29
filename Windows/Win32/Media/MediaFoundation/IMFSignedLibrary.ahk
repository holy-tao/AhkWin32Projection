#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Provides a method that allows content protection systems to get the procedure address of a function in the signed library. This method provides the same functionality as GetProcAddress which is not available to Windows Store apps.
 * @remarks
 * See  <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfloadsignedlibrary">MFLoadSignedLibrary</a> for an example of how to create and use an <b>IMFSignedLibrary</b> object.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfsignedlibrary
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSignedLibrary extends IUnknown {
    /**
     * The interface identifier for IMFSignedLibrary
     * @type {Guid}
     */
    static IID := Guid("{4a724bca-ff6a-4c07-8e0d-7a358421cf06}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSignedLibrary interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProcedureAddress : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSignedLibrary.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the procedure address of the specified function in the signed library.
     * @remarks
     * See  <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfloadsignedlibrary">MFLoadSignedLibrary</a> for an example of how to create an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsignedlibrary">IMFSignedLibrary</a> object and call the <b>GetProcedureAddress</b> method.
     * @param {PSTR} name The entry point name in the DLL that specifies the function.
     * @returns {Pointer<Void>} Receives the address of the entry point.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsignedlibrary-getprocedureaddress
     */
    GetProcedureAddress(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(3, this, "ptr", name, "ptr*", &_address := 0, "HRESULT")
        return _address
    }

    Query(iid) {
        if (IMFSignedLibrary.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProcedureAddress := CallbackCreate(GetMethod(implObj, "GetProcedureAddress"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProcedureAddress)
    }
}
