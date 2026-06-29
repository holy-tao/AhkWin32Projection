#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct AsyncIFtpHomeDirectoryProvider extends IUnknown {
    /**
     * The interface identifier for AsyncIFtpHomeDirectoryProvider
     * @type {Guid}
     */
    static IID := Guid("{73f81638-6295-42bd-a2be-4a657f7c479c}")

    /**
     * The class identifier for AsyncIFtpHomeDirectoryProvider
     * @type {Guid}
     */
    static CLSID := Guid("{73f81638-6295-42bd-a2be-4a657f7c479c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for AsyncIFtpHomeDirectoryProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin_GetUserHomeDirectoryData  : IntPtr
        Finish_GetUserHomeDirectoryData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := AsyncIFtpHomeDirectoryProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszSessionId 
     * @param {PWSTR} pszSiteName 
     * @param {PWSTR} pszUserName 
     * @returns {HRESULT} 
     */
    Begin_GetUserHomeDirectoryData(pszSessionId, pszSiteName, pszUserName) {
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId
        pszSiteName := pszSiteName is String ? StrPtr(pszSiteName) : pszSiteName
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName

        result := ComCall(3, this, "ptr", pszSessionId, "ptr", pszSiteName, "ptr", pszUserName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    Finish_GetUserHomeDirectoryData() {
        result := ComCall(4, this, PWSTR.Ptr, &ppszHomeDirectoryData := 0, "HRESULT")
        return ppszHomeDirectoryData
    }

    Query(iid) {
        if (AsyncIFtpHomeDirectoryProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin_GetUserHomeDirectoryData := CallbackCreate(GetMethod(implObj, "Begin_GetUserHomeDirectoryData"), flags, 4)
        this.vtbl.Finish_GetUserHomeDirectoryData := CallbackCreate(GetMethod(implObj, "Finish_GetUserHomeDirectoryData"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin_GetUserHomeDirectoryData)
        CallbackFree(this.vtbl.Finish_GetUserHomeDirectoryData)
    }
}
