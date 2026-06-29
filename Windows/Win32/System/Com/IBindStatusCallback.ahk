#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IBinding.ahk" { IBinding }
#Import ".\BINDINFO.ahk" { BINDINFO }
#Import ".\STGMEDIUM.ahk" { STGMEDIUM }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FORMATETC.ahk" { FORMATETC }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct IBindStatusCallback extends IUnknown {
    /**
     * The interface identifier for IBindStatusCallback
     * @type {Guid}
     */
    static IID := Guid("{79eac9c1-baf9-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBindStatusCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnStartBinding    : IntPtr
        GetPriority       : IntPtr
        OnLowResource     : IntPtr
        OnProgress        : IntPtr
        OnStopBinding     : IntPtr
        GetBindInfo       : IntPtr
        OnDataAvailable   : IntPtr
        OnObjectAvailable : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBindStatusCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwReserved 
     * @param {IBinding} pib 
     * @returns {HRESULT} 
     */
    OnStartBinding(dwReserved, pib) {
        result := ComCall(3, this, "uint", dwReserved, "ptr", pib, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPriority() {
        result := ComCall(4, this, "int*", &pnPriority := 0, "HRESULT")
        return pnPriority
    }

    /**
     * 
     * @param {Integer} reserved 
     * @returns {HRESULT} 
     */
    OnLowResource(reserved) {
        result := ComCall(5, this, "uint", reserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulProgress 
     * @param {Integer} ulProgressMax 
     * @param {Integer} ulStatusCode 
     * @param {PWSTR} szStatusText 
     * @returns {HRESULT} 
     */
    OnProgress(ulProgress, ulProgressMax, ulStatusCode, szStatusText) {
        szStatusText := szStatusText is String ? StrPtr(szStatusText) : szStatusText

        result := ComCall(6, this, "uint", ulProgress, "uint", ulProgressMax, "uint", ulStatusCode, "ptr", szStatusText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} _hresult 
     * @param {PWSTR} szError 
     * @returns {HRESULT} 
     */
    OnStopBinding(_hresult, szError) {
        szError := szError is String ? StrPtr(szError) : szError

        result := ComCall(7, this, "int", _hresult, "ptr", szError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BINDINFO>} pbindinfo 
     * @returns {Integer} 
     */
    GetBindInfo(pbindinfo) {
        result := ComCall(8, this, "uint*", &grfBINDF := 0, BINDINFO.Ptr, pbindinfo, "HRESULT")
        return grfBINDF
    }

    /**
     * 
     * @param {Integer} grfBSCF 
     * @param {Integer} dwSize 
     * @param {Pointer<FORMATETC>} pformatetc 
     * @param {Pointer<STGMEDIUM>} pstgmed 
     * @returns {HRESULT} 
     */
    OnDataAvailable(grfBSCF, dwSize, pformatetc, pstgmed) {
        result := ComCall(9, this, "uint", grfBSCF, "uint", dwSize, FORMATETC.Ptr, pformatetc, STGMEDIUM.Ptr, pstgmed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     */
    OnObjectAvailable(riid, punk) {
        result := ComCall(10, this, Guid.Ptr, riid, "ptr", punk, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBindStatusCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnStartBinding := CallbackCreate(GetMethod(implObj, "OnStartBinding"), flags, 3)
        this.vtbl.GetPriority := CallbackCreate(GetMethod(implObj, "GetPriority"), flags, 2)
        this.vtbl.OnLowResource := CallbackCreate(GetMethod(implObj, "OnLowResource"), flags, 2)
        this.vtbl.OnProgress := CallbackCreate(GetMethod(implObj, "OnProgress"), flags, 5)
        this.vtbl.OnStopBinding := CallbackCreate(GetMethod(implObj, "OnStopBinding"), flags, 3)
        this.vtbl.GetBindInfo := CallbackCreate(GetMethod(implObj, "GetBindInfo"), flags, 3)
        this.vtbl.OnDataAvailable := CallbackCreate(GetMethod(implObj, "OnDataAvailable"), flags, 5)
        this.vtbl.OnObjectAvailable := CallbackCreate(GetMethod(implObj, "OnObjectAvailable"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnStartBinding)
        CallbackFree(this.vtbl.GetPriority)
        CallbackFree(this.vtbl.OnLowResource)
        CallbackFree(this.vtbl.OnProgress)
        CallbackFree(this.vtbl.OnStopBinding)
        CallbackFree(this.vtbl.GetBindInfo)
        CallbackFree(this.vtbl.OnDataAvailable)
        CallbackFree(this.vtbl.OnObjectAvailable)
    }
}
