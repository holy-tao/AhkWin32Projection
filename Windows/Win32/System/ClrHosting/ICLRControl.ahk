#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRControl extends IUnknown{
    /**
     * The interface identifier for ICLRControl
     * @type {Guid}
     */
    static IID => Guid("{9065597e-d1a1-4fb2-b6ba-7e1fce230f61}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppObject 
     * @returns {HRESULT} 
     */
    GetCLRManager(riid, ppObject) {
        result := ComCall(3, this, "ptr", riid, "ptr", ppObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzAppDomainManagerAssembly 
     * @param {PWSTR} pwzAppDomainManagerType 
     * @returns {HRESULT} 
     */
    SetAppDomainManagerType(pwzAppDomainManagerAssembly, pwzAppDomainManagerType) {
        pwzAppDomainManagerAssembly := pwzAppDomainManagerAssembly is String ? StrPtr(pwzAppDomainManagerAssembly) : pwzAppDomainManagerAssembly
        pwzAppDomainManagerType := pwzAppDomainManagerType is String ? StrPtr(pwzAppDomainManagerType) : pwzAppDomainManagerType

        result := ComCall(4, this, "ptr", pwzAppDomainManagerAssembly, "ptr", pwzAppDomainManagerType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
