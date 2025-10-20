#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IWbemDecoupledRegistrar interface associates decoupled providers with WMI. This interface allows a process-hosted provider to define the interoperability lifetime of the interface and to coexist with other providers.
 * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nn-wbemprov-iwbemdecoupledregistrar
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemDecoupledRegistrar extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemDecoupledRegistrar
     * @type {Guid}
     */
    static IID => Guid("{1005cbcf-e64f-4646-bcd3-3a089d8a84b4}")

    /**
     * The class identifier for WbemDecoupledRegistrar
     * @type {Guid}
     */
    static CLSID => Guid("{4cfc7932-0f9d-4bef-9c32-8ea2a6b56fcb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Register", "UnRegister"]

    /**
     * 
     * @param {Integer} a_Flags 
     * @param {IWbemContext} a_Context 
     * @param {PWSTR} a_User 
     * @param {PWSTR} a_Locale 
     * @param {PWSTR} a_Scope 
     * @param {PWSTR} a_Registration 
     * @param {IUnknown} pIUnknown 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbemdecoupledregistrar-register
     */
    Register(a_Flags, a_Context, a_User, a_Locale, a_Scope, a_Registration, pIUnknown) {
        a_User := a_User is String ? StrPtr(a_User) : a_User
        a_Locale := a_Locale is String ? StrPtr(a_Locale) : a_Locale
        a_Scope := a_Scope is String ? StrPtr(a_Scope) : a_Scope
        a_Registration := a_Registration is String ? StrPtr(a_Registration) : a_Registration

        result := ComCall(3, this, "int", a_Flags, "ptr", a_Context, "ptr", a_User, "ptr", a_Locale, "ptr", a_Scope, "ptr", a_Registration, "ptr", pIUnknown, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbemdecoupledregistrar-unregister
     */
    UnRegister() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
