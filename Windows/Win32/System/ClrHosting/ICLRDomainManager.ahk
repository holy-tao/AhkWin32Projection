#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRDomainManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRDomainManager
     * @type {Guid}
     */
    static IID => Guid("{270d00a2-8e15-4d0b-adeb-37bc3e47df77}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAppDomainManagerType", "SetPropertiesForDefaultAppDomain"]

    /**
     * 
     * @param {PWSTR} wszAppDomainManagerAssembly 
     * @param {PWSTR} wszAppDomainManagerType 
     * @param {Integer} dwInitializeDomainFlags 
     * @returns {HRESULT} 
     */
    SetAppDomainManagerType(wszAppDomainManagerAssembly, wszAppDomainManagerType, dwInitializeDomainFlags) {
        wszAppDomainManagerAssembly := wszAppDomainManagerAssembly is String ? StrPtr(wszAppDomainManagerAssembly) : wszAppDomainManagerAssembly
        wszAppDomainManagerType := wszAppDomainManagerType is String ? StrPtr(wszAppDomainManagerType) : wszAppDomainManagerType

        result := ComCall(3, this, "ptr", wszAppDomainManagerAssembly, "ptr", wszAppDomainManagerType, "int", dwInitializeDomainFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nProperties 
     * @param {Pointer<PWSTR>} pwszPropertyNames 
     * @param {Pointer<PWSTR>} pwszPropertyValues 
     * @returns {HRESULT} 
     */
    SetPropertiesForDefaultAppDomain(nProperties, pwszPropertyNames, pwszPropertyValues) {
        result := ComCall(4, this, "uint", nProperties, "ptr", pwszPropertyNames, "ptr", pwszPropertyValues, "HRESULT")
        return result
    }
}
