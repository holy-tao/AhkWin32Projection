#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables retrieving the IUnknown pointer stored in the error info with the call to RoOriginateLanguageException.
 * @see https://learn.microsoft.com/windows/win32/api/restrictederrorinfo/nn-restrictederrorinfo-ilanguageexceptionerrorinfo
 * @namespace Windows.Win32.System.WinRT
 */
export default struct ILanguageExceptionErrorInfo extends IUnknown {
    /**
     * The interface identifier for ILanguageExceptionErrorInfo
     * @type {Guid}
     */
    static IID := Guid("{04a2dbf3-df83-116c-0946-0812abf6e07d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILanguageExceptionErrorInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetLanguageException : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILanguageExceptionErrorInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the stored IUnknown object from the error object.
     * @remarks
     * Language projections query for the appropriate interface to identify this object as generated from an exception to get the original object.
     * @returns {IUnknown} The stored <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> object from the error object.
     * @see https://learn.microsoft.com/windows/win32/api/restrictederrorinfo/nf-restrictederrorinfo-ilanguageexceptionerrorinfo-getlanguageexception
     */
    GetLanguageException() {
        result := ComCall(3, this, "ptr*", &languageException := 0, "HRESULT")
        return IUnknown(languageException)
    }

    Query(iid) {
        if (ILanguageExceptionErrorInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLanguageException := CallbackCreate(GetMethod(implObj, "GetLanguageException"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLanguageException)
    }
}
