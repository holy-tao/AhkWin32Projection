#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MF_MEDIAKEYSESSION_TYPE.ahk" { MF_MEDIAKEYSESSION_TYPE }
#Import ".\IMFMediaKeySessionNotify2.ahk" { IMFMediaKeySessionNotify2 }
#Import ".\IMFMediaKeys.ahk" { IMFMediaKeys }
#Import ".\IMFMediaKeySession2.ahk" { IMFMediaKeySession2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaKeys2 extends IMFMediaKeys {
    /**
     * The interface identifier for IMFMediaKeys2
     * @type {Guid}
     */
    static IID := Guid("{45892507-ad66-4de2-83a2-acbb13cd8d43}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaKeys2 interfaces
    */
    struct Vtbl extends IMFMediaKeys.Vtbl {
        CreateSession2       : IntPtr
        SetServerCertificate : IntPtr
        GetDOMException      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaKeys2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {MF_MEDIAKEYSESSION_TYPE} eSessionType 
     * @param {IMFMediaKeySessionNotify2} pMFMediaKeySessionNotify2 
     * @returns {IMFMediaKeySession2} 
     */
    CreateSession2(eSessionType, pMFMediaKeySessionNotify2) {
        result := ComCall(7, this, MF_MEDIAKEYSESSION_TYPE, eSessionType, "ptr", pMFMediaKeySessionNotify2, "ptr*", &ppSession := 0, "HRESULT")
        return IMFMediaKeySession2(ppSession)
    }

    /**
     * 
     * @param {Integer} pbServerCertificate 
     * @param {Integer} cb 
     * @returns {HRESULT} 
     */
    SetServerCertificate(pbServerCertificate, cb) {
        result := ComCall(8, this, "ptr", pbServerCertificate, "uint", cb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} systemCode 
     * @returns {HRESULT} 
     */
    GetDOMException(systemCode) {
        result := ComCall(9, this, "int", systemCode, "int*", &code := 0, "HRESULT")
        return code
    }

    Query(iid) {
        if (IMFMediaKeys2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateSession2 := CallbackCreate(GetMethod(implObj, "CreateSession2"), flags, 4)
        this.vtbl.SetServerCertificate := CallbackCreate(GetMethod(implObj, "SetServerCertificate"), flags, 3)
        this.vtbl.GetDOMException := CallbackCreate(GetMethod(implObj, "GetDOMException"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateSession2)
        CallbackFree(this.vtbl.SetServerCertificate)
        CallbackFree(this.vtbl.GetDOMException)
    }
}
