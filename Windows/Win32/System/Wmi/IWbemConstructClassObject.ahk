#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWbemConstructClassObject extends IUnknown {
    /**
     * The interface identifier for IWbemConstructClassObject
     * @type {Guid}
     */
    static IID := Guid("{9ef76194-70d5-11d1-ad90-00c04fd8fdff}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemConstructClassObject interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetInheritanceChain : IntPtr
        SetPropertyOrigin   : IntPtr
        SetMethodOrigin     : IntPtr
        SetServerNamespace  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemConstructClassObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} lNumAntecedents 
     * @param {Integer} awszAntecedents 
     * @returns {HRESULT} 
     */
    SetInheritanceChain(lNumAntecedents, awszAntecedents) {
        result := ComCall(3, this, "int", lNumAntecedents, "ptr", awszAntecedents, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszPropertyName 
     * @param {Integer} lOriginIndex 
     * @returns {HRESULT} 
     */
    SetPropertyOrigin(wszPropertyName, lOriginIndex) {
        wszPropertyName := wszPropertyName is String ? StrPtr(wszPropertyName) : wszPropertyName

        result := ComCall(4, this, "ptr", wszPropertyName, "int", lOriginIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszMethodName 
     * @param {Integer} lOriginIndex 
     * @returns {HRESULT} 
     */
    SetMethodOrigin(wszMethodName, lOriginIndex) {
        wszMethodName := wszMethodName is String ? StrPtr(wszMethodName) : wszMethodName

        result := ComCall(5, this, "ptr", wszMethodName, "int", lOriginIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszServer 
     * @param {PWSTR} wszNamespace 
     * @returns {HRESULT} 
     */
    SetServerNamespace(wszServer, wszNamespace) {
        wszServer := wszServer is String ? StrPtr(wszServer) : wszServer
        wszNamespace := wszNamespace is String ? StrPtr(wszNamespace) : wszNamespace

        result := ComCall(6, this, "ptr", wszServer, "ptr", wszNamespace, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWbemConstructClassObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetInheritanceChain := CallbackCreate(GetMethod(implObj, "SetInheritanceChain"), flags, 3)
        this.vtbl.SetPropertyOrigin := CallbackCreate(GetMethod(implObj, "SetPropertyOrigin"), flags, 3)
        this.vtbl.SetMethodOrigin := CallbackCreate(GetMethod(implObj, "SetMethodOrigin"), flags, 3)
        this.vtbl.SetServerNamespace := CallbackCreate(GetMethod(implObj, "SetServerNamespace"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetInheritanceChain)
        CallbackFree(this.vtbl.SetPropertyOrigin)
        CallbackFree(this.vtbl.SetMethodOrigin)
        CallbackFree(this.vtbl.SetServerNamespace)
    }
}
