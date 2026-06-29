#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\HMODULE.ahk" { HMODULE }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRDebuggingLibraryProvider extends IUnknown {
    /**
     * The interface identifier for ICLRDebuggingLibraryProvider
     * @type {Guid}
     */
    static IID := Guid("{3151c08d-4d09-4f9b-8838-2880bf18fe51}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRDebuggingLibraryProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ProvideLibrary : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRDebuggingLibraryProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwszFileName 
     * @param {Integer} dwTimestamp 
     * @param {Integer} dwSizeOfImage 
     * @returns {HMODULE} 
     */
    ProvideLibrary(pwszFileName, dwTimestamp, dwSizeOfImage) {
        pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

        phModule := HMODULE.Owned()
        result := ComCall(3, this, "ptr", pwszFileName, "uint", dwTimestamp, "uint", dwSizeOfImage, HMODULE.Ptr, phModule, "HRESULT")
        return phModule
    }

    Query(iid) {
        if (ICLRDebuggingLibraryProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ProvideLibrary := CallbackCreate(GetMethod(implObj, "ProvideLibrary"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ProvideLibrary)
    }
}
