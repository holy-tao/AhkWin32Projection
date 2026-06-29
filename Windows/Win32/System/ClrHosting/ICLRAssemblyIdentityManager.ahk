#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICLRProbingAssemblyEnum.ahk" { ICLRProbingAssemblyEnum }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ICLRAssemblyReferenceList.ahk" { ICLRAssemblyReferenceList }
#Import ".\ICLRReferenceAssemblyEnum.ahk" { ICLRReferenceAssemblyEnum }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRAssemblyIdentityManager extends IUnknown {
    /**
     * The interface identifier for ICLRAssemblyIdentityManager
     * @type {Guid}
     */
    static IID := Guid("{15f0a9da-3ff6-4393-9da9-fdfd284e6972}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRAssemblyIdentityManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCLRAssemblyReferenceList       : IntPtr
        GetBindingIdentityFromFile        : IntPtr
        GetBindingIdentityFromStream      : IntPtr
        GetReferencedAssembliesFromFile   : IntPtr
        GetReferencedAssembliesFromStream : IntPtr
        GetProbingAssembliesFromReference : IntPtr
        IsStronglyNamed                   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRAssemblyIdentityManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwzAssemblyReferences 
     * @param {Integer} dwNumOfReferences 
     * @returns {ICLRAssemblyReferenceList} 
     */
    GetCLRAssemblyReferenceList(ppwzAssemblyReferences, dwNumOfReferences) {
        ppwzAssemblyReferencesMarshal := ppwzAssemblyReferences is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, ppwzAssemblyReferencesMarshal, ppwzAssemblyReferences, "uint", dwNumOfReferences, "ptr*", &ppReferenceList := 0, "HRESULT")
        return ICLRAssemblyReferenceList(ppReferenceList)
    }

    /**
     * 
     * @param {PWSTR} pwzFilePath 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pwzBuffer 
     * @param {Pointer<Integer>} pcchBufferSize 
     * @returns {HRESULT} 
     */
    GetBindingIdentityFromFile(pwzFilePath, dwFlags, pwzBuffer, pcchBufferSize) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath
        pwzBuffer := pwzBuffer is String ? StrPtr(pwzBuffer) : pwzBuffer

        pcchBufferSizeMarshal := pcchBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pwzFilePath, "uint", dwFlags, "ptr", pwzBuffer, pcchBufferSizeMarshal, pcchBufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pStream 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pwzBuffer 
     * @param {Pointer<Integer>} pcchBufferSize 
     * @returns {HRESULT} 
     */
    GetBindingIdentityFromStream(pStream, dwFlags, pwzBuffer, pcchBufferSize) {
        pwzBuffer := pwzBuffer is String ? StrPtr(pwzBuffer) : pwzBuffer

        pcchBufferSizeMarshal := pcchBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pStream, "uint", dwFlags, "ptr", pwzBuffer, pcchBufferSizeMarshal, pcchBufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFilePath 
     * @param {Integer} dwFlags 
     * @param {ICLRAssemblyReferenceList} pExcludeAssembliesList 
     * @returns {ICLRReferenceAssemblyEnum} 
     */
    GetReferencedAssembliesFromFile(pwzFilePath, dwFlags, pExcludeAssembliesList) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        result := ComCall(6, this, "ptr", pwzFilePath, "uint", dwFlags, "ptr", pExcludeAssembliesList, "ptr*", &ppReferenceEnum := 0, "HRESULT")
        return ICLRReferenceAssemblyEnum(ppReferenceEnum)
    }

    /**
     * 
     * @param {IStream} pStream 
     * @param {Integer} dwFlags 
     * @param {ICLRAssemblyReferenceList} pExcludeAssembliesList 
     * @returns {ICLRReferenceAssemblyEnum} 
     */
    GetReferencedAssembliesFromStream(pStream, dwFlags, pExcludeAssembliesList) {
        result := ComCall(7, this, "ptr", pStream, "uint", dwFlags, "ptr", pExcludeAssembliesList, "ptr*", &ppReferenceEnum := 0, "HRESULT")
        return ICLRReferenceAssemblyEnum(ppReferenceEnum)
    }

    /**
     * 
     * @param {Integer} dwMachineType 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pwzReferenceIdentity 
     * @returns {ICLRProbingAssemblyEnum} 
     */
    GetProbingAssembliesFromReference(dwMachineType, dwFlags, pwzReferenceIdentity) {
        pwzReferenceIdentity := pwzReferenceIdentity is String ? StrPtr(pwzReferenceIdentity) : pwzReferenceIdentity

        result := ComCall(8, this, "uint", dwMachineType, "uint", dwFlags, "ptr", pwzReferenceIdentity, "ptr*", &ppProbingAssemblyEnum := 0, "HRESULT")
        return ICLRProbingAssemblyEnum(ppProbingAssemblyEnum)
    }

    /**
     * 
     * @param {PWSTR} pwzAssemblyIdentity 
     * @returns {BOOL} 
     */
    IsStronglyNamed(pwzAssemblyIdentity) {
        pwzAssemblyIdentity := pwzAssemblyIdentity is String ? StrPtr(pwzAssemblyIdentity) : pwzAssemblyIdentity

        result := ComCall(9, this, "ptr", pwzAssemblyIdentity, BOOL.Ptr, &pbIsStronglyNamed := 0, "HRESULT")
        return pbIsStronglyNamed
    }

    Query(iid) {
        if (ICLRAssemblyIdentityManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCLRAssemblyReferenceList := CallbackCreate(GetMethod(implObj, "GetCLRAssemblyReferenceList"), flags, 4)
        this.vtbl.GetBindingIdentityFromFile := CallbackCreate(GetMethod(implObj, "GetBindingIdentityFromFile"), flags, 5)
        this.vtbl.GetBindingIdentityFromStream := CallbackCreate(GetMethod(implObj, "GetBindingIdentityFromStream"), flags, 5)
        this.vtbl.GetReferencedAssembliesFromFile := CallbackCreate(GetMethod(implObj, "GetReferencedAssembliesFromFile"), flags, 5)
        this.vtbl.GetReferencedAssembliesFromStream := CallbackCreate(GetMethod(implObj, "GetReferencedAssembliesFromStream"), flags, 5)
        this.vtbl.GetProbingAssembliesFromReference := CallbackCreate(GetMethod(implObj, "GetProbingAssembliesFromReference"), flags, 5)
        this.vtbl.IsStronglyNamed := CallbackCreate(GetMethod(implObj, "IsStronglyNamed"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCLRAssemblyReferenceList)
        CallbackFree(this.vtbl.GetBindingIdentityFromFile)
        CallbackFree(this.vtbl.GetBindingIdentityFromStream)
        CallbackFree(this.vtbl.GetReferencedAssembliesFromFile)
        CallbackFree(this.vtbl.GetReferencedAssembliesFromStream)
        CallbackFree(this.vtbl.GetProbingAssembliesFromReference)
        CallbackFree(this.vtbl.IsStronglyNamed)
    }
}
