#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRAssemblyIdentityManager extends IUnknown{
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
     * 
     * @param {Pointer<PWSTR>} ppwzAssemblyReferences 
     * @param {Integer} dwNumOfReferences 
     * @param {Pointer<ICLRAssemblyReferenceList>} ppReferenceList 
     * @returns {HRESULT} 
     */
    GetCLRAssemblyReferenceList(ppwzAssemblyReferences, dwNumOfReferences, ppReferenceList) {
        result := ComCall(3, this, "ptr", ppwzAssemblyReferences, "uint", dwNumOfReferences, "ptr", ppReferenceList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFilePath 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pwzBuffer 
     * @param {Pointer<UInt32>} pcchBufferSize 
     * @returns {HRESULT} 
     */
    GetBindingIdentityFromFile(pwzFilePath, dwFlags, pwzBuffer, pcchBufferSize) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath
        pwzBuffer := pwzBuffer is String ? StrPtr(pwzBuffer) : pwzBuffer

        result := ComCall(4, this, "ptr", pwzFilePath, "uint", dwFlags, "ptr", pwzBuffer, "uint*", pcchBufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pStream 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pwzBuffer 
     * @param {Pointer<UInt32>} pcchBufferSize 
     * @returns {HRESULT} 
     */
    GetBindingIdentityFromStream(pStream, dwFlags, pwzBuffer, pcchBufferSize) {
        pwzBuffer := pwzBuffer is String ? StrPtr(pwzBuffer) : pwzBuffer

        result := ComCall(5, this, "ptr", pStream, "uint", dwFlags, "ptr", pwzBuffer, "uint*", pcchBufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFilePath 
     * @param {Integer} dwFlags 
     * @param {Pointer<ICLRAssemblyReferenceList>} pExcludeAssembliesList 
     * @param {Pointer<ICLRReferenceAssemblyEnum>} ppReferenceEnum 
     * @returns {HRESULT} 
     */
    GetReferencedAssembliesFromFile(pwzFilePath, dwFlags, pExcludeAssembliesList, ppReferenceEnum) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        result := ComCall(6, this, "ptr", pwzFilePath, "uint", dwFlags, "ptr", pExcludeAssembliesList, "ptr", ppReferenceEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pStream 
     * @param {Integer} dwFlags 
     * @param {Pointer<ICLRAssemblyReferenceList>} pExcludeAssembliesList 
     * @param {Pointer<ICLRReferenceAssemblyEnum>} ppReferenceEnum 
     * @returns {HRESULT} 
     */
    GetReferencedAssembliesFromStream(pStream, dwFlags, pExcludeAssembliesList, ppReferenceEnum) {
        result := ComCall(7, this, "ptr", pStream, "uint", dwFlags, "ptr", pExcludeAssembliesList, "ptr", ppReferenceEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMachineType 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pwzReferenceIdentity 
     * @param {Pointer<ICLRProbingAssemblyEnum>} ppProbingAssemblyEnum 
     * @returns {HRESULT} 
     */
    GetProbingAssembliesFromReference(dwMachineType, dwFlags, pwzReferenceIdentity, ppProbingAssemblyEnum) {
        pwzReferenceIdentity := pwzReferenceIdentity is String ? StrPtr(pwzReferenceIdentity) : pwzReferenceIdentity

        result := ComCall(8, this, "uint", dwMachineType, "uint", dwFlags, "ptr", pwzReferenceIdentity, "ptr", ppProbingAssemblyEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzAssemblyIdentity 
     * @param {Pointer<BOOL>} pbIsStronglyNamed 
     * @returns {HRESULT} 
     */
    IsStronglyNamed(pwzAssemblyIdentity, pbIsStronglyNamed) {
        pwzAssemblyIdentity := pwzAssemblyIdentity is String ? StrPtr(pwzAssemblyIdentity) : pwzAssemblyIdentity

        result := ComCall(9, this, "ptr", pwzAssemblyIdentity, "ptr", pbIsStronglyNamed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
