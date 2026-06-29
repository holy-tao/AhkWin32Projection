#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IBindStatusCallback.ahk" { IBindStatusCallback }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IBindCtx.ahk" { IBindCtx }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMoniker.ahk" { IMoniker }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct IBindHost extends IUnknown {
    /**
     * The interface identifier for IBindHost
     * @type {Guid}
     */
    static IID := Guid("{fc4801a1-2ba9-11cf-a229-00aa003d7352}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBindHost interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateMoniker        : IntPtr
        MonikerBindToStorage : IntPtr
        MonikerBindToObject  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBindHost.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} szName 
     * @param {IBindCtx} pBC 
     * @param {Integer} dwReserved 
     * @returns {IMoniker} 
     */
    CreateMoniker(szName, pBC, dwReserved) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(3, this, "ptr", szName, "ptr", pBC, "ptr*", &ppmk := 0, "uint", dwReserved, "HRESULT")
        return IMoniker(ppmk)
    }

    /**
     * 
     * @param {IMoniker} pMk 
     * @param {IBindCtx} pBC 
     * @param {IBindStatusCallback} pBSC 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    MonikerBindToStorage(pMk, pBC, pBSC, riid) {
        result := ComCall(4, this, "ptr", pMk, "ptr", pBC, "ptr", pBSC, Guid.Ptr, riid, "ptr*", &ppvObj := 0, "HRESULT")
        return ppvObj
    }

    /**
     * 
     * @param {IMoniker} pMk 
     * @param {IBindCtx} pBC 
     * @param {IBindStatusCallback} pBSC 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    MonikerBindToObject(pMk, pBC, pBSC, riid) {
        result := ComCall(5, this, "ptr", pMk, "ptr", pBC, "ptr", pBSC, Guid.Ptr, riid, "ptr*", &ppvObj := 0, "HRESULT")
        return ppvObj
    }

    Query(iid) {
        if (IBindHost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateMoniker := CallbackCreate(GetMethod(implObj, "CreateMoniker"), flags, 5)
        this.vtbl.MonikerBindToStorage := CallbackCreate(GetMethod(implObj, "MonikerBindToStorage"), flags, 6)
        this.vtbl.MonikerBindToObject := CallbackCreate(GetMethod(implObj, "MonikerBindToObject"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateMoniker)
        CallbackFree(this.vtbl.MonikerBindToStorage)
        CallbackFree(this.vtbl.MonikerBindToObject)
    }
}
