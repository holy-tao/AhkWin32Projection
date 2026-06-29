#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\IBindCtx.ahk" { IBindCtx }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\IClassFactory.ahk" { IClassFactory }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInternetProtocol.ahk" { IInternetProtocol }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IInternetSession extends IUnknown {
    /**
     * The interface identifier for IInternetSession
     * @type {Guid}
     */
    static IID := Guid("{79eac9e7-baf9-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInternetSession interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterNameSpace    : IntPtr
        UnregisterNameSpace  : IntPtr
        RegisterMimeFilter   : IntPtr
        UnregisterMimeFilter : IntPtr
        CreateBinding        : IntPtr
        SetSessionOption     : IntPtr
        GetSessionOption     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInternetSession.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IClassFactory} pCF 
     * @param {Pointer<Guid>} rclsid 
     * @param {PWSTR} pwzProtocol 
     * @param {Integer} cPatterns 
     * @param {Pointer<PWSTR>} ppwzPatterns 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    RegisterNameSpace(pCF, rclsid, pwzProtocol, cPatterns, ppwzPatterns, dwReserved) {
        pwzProtocol := pwzProtocol is String ? StrPtr(pwzProtocol) : pwzProtocol

        ppwzPatternsMarshal := ppwzPatterns is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pCF, Guid.Ptr, rclsid, "ptr", pwzProtocol, "uint", cPatterns, ppwzPatternsMarshal, ppwzPatterns, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IClassFactory} pCF 
     * @param {PWSTR} pszProtocol 
     * @returns {HRESULT} 
     */
    UnregisterNameSpace(pCF, pszProtocol) {
        pszProtocol := pszProtocol is String ? StrPtr(pszProtocol) : pszProtocol

        result := ComCall(4, this, "ptr", pCF, "ptr", pszProtocol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IClassFactory} pCF 
     * @param {Pointer<Guid>} rclsid 
     * @param {PWSTR} pwzType 
     * @returns {HRESULT} 
     */
    RegisterMimeFilter(pCF, rclsid, pwzType) {
        pwzType := pwzType is String ? StrPtr(pwzType) : pwzType

        result := ComCall(5, this, "ptr", pCF, Guid.Ptr, rclsid, "ptr", pwzType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IClassFactory} pCF 
     * @param {PWSTR} pwzType 
     * @returns {HRESULT} 
     */
    UnregisterMimeFilter(pCF, pwzType) {
        pwzType := pwzType is String ? StrPtr(pwzType) : pwzType

        result := ComCall(6, this, "ptr", pCF, "ptr", pwzType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IBindCtx} pBC 
     * @param {PWSTR} szUrl 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<IUnknown>} ppUnk 
     * @param {Pointer<IInternetProtocol>} ppOInetProt 
     * @param {Integer} dwOption 
     * @returns {HRESULT} 
     */
    CreateBinding(pBC, szUrl, pUnkOuter, ppUnk, ppOInetProt, dwOption) {
        szUrl := szUrl is String ? StrPtr(szUrl) : szUrl

        result := ComCall(7, this, "ptr", pBC, "ptr", szUrl, "ptr", pUnkOuter, IUnknown.Ptr, ppUnk, IInternetProtocol.Ptr, ppOInetProt, "uint", dwOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOption 
     * @param {Pointer<Void>} pBuffer 
     * @param {Integer} dwBufferLength 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    SetSessionOption(dwOption, pBuffer, dwBufferLength, dwReserved) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "uint", dwOption, pBufferMarshal, pBuffer, "uint", dwBufferLength, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOption 
     * @param {Pointer<Void>} pBuffer 
     * @param {Pointer<Integer>} pdwBufferLength 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    GetSessionOption(dwOption, pBuffer, pdwBufferLength, dwReserved) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"
        pdwBufferLengthMarshal := pdwBufferLength is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "uint", dwOption, pBufferMarshal, pBuffer, pdwBufferLengthMarshal, pdwBufferLength, "uint", dwReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInternetSession.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterNameSpace := CallbackCreate(GetMethod(implObj, "RegisterNameSpace"), flags, 7)
        this.vtbl.UnregisterNameSpace := CallbackCreate(GetMethod(implObj, "UnregisterNameSpace"), flags, 3)
        this.vtbl.RegisterMimeFilter := CallbackCreate(GetMethod(implObj, "RegisterMimeFilter"), flags, 4)
        this.vtbl.UnregisterMimeFilter := CallbackCreate(GetMethod(implObj, "UnregisterMimeFilter"), flags, 3)
        this.vtbl.CreateBinding := CallbackCreate(GetMethod(implObj, "CreateBinding"), flags, 7)
        this.vtbl.SetSessionOption := CallbackCreate(GetMethod(implObj, "SetSessionOption"), flags, 5)
        this.vtbl.GetSessionOption := CallbackCreate(GetMethod(implObj, "GetSessionOption"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterNameSpace)
        CallbackFree(this.vtbl.UnregisterNameSpace)
        CallbackFree(this.vtbl.RegisterMimeFilter)
        CallbackFree(this.vtbl.UnregisterMimeFilter)
        CallbackFree(this.vtbl.CreateBinding)
        CallbackFree(this.vtbl.SetSessionOption)
        CallbackFree(this.vtbl.GetSessionOption)
    }
}
