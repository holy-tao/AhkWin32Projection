#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICLRAssemblyReferenceList.ahk
#Include .\ICLRReferenceAssemblyEnum.ahk
#Include .\ICLRProbingAssemblyEnum.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRAssemblyIdentityManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRAssemblyIdentityManager
     * @type {Guid}
     */
    static IID => Guid("{15f0a9da-3ff6-4393-9da9-fdfd284e6972}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCLRAssemblyReferenceList", "GetBindingIdentityFromFile", "GetBindingIdentityFromStream", "GetReferencedAssembliesFromFile", "GetReferencedAssembliesFromStream", "GetProbingAssembliesFromReference", "IsStronglyNamed"]

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

        result := ComCall(9, this, "ptr", pwzAssemblyIdentity, "int*", &pbIsStronglyNamed := 0, "HRESULT")
        return pbIsStronglyNamed
    }
}
