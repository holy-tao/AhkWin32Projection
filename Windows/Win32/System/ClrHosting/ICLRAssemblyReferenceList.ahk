#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRAssemblyReferenceList extends IUnknown{
    /**
     * The interface identifier for ICLRAssemblyReferenceList
     * @type {Guid}
     */
    static IID => Guid("{1b2c9750-2e66-4bda-8b44-0a642c5cd733}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pwzAssemblyName 
     * @returns {HRESULT} 
     */
    IsStringAssemblyReferenceInList(pwzAssemblyName) {
        pwzAssemblyName := pwzAssemblyName is String ? StrPtr(pwzAssemblyName) : pwzAssemblyName

        result := ComCall(3, this, "ptr", pwzAssemblyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pName 
     * @returns {HRESULT} 
     */
    IsAssemblyReferenceInList(pName) {
        result := ComCall(4, this, "ptr", pName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
