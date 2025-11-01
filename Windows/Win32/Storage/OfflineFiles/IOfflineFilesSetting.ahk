#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a setting that controls the behavior the Offline Files service.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilessetting
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesSetting extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesSetting
     * @type {Guid}
     */
    static IID => Guid("{d871d3f7-f613-48a1-827e-7a34e560fff6}")

    /**
     * The class identifier for OfflineFilesSetting
     * @type {Guid}
     */
    static CLSID => Guid("{fd3659e9-a920-4123-ad64-7fc76c7aacdf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetValueType", "GetPreference", "GetPreferenceScope", "SetPreference", "DeletePreference", "GetPolicy", "GetPolicyScope", "GetValue"]

    /**
     * 
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessetting-getname
     */
    GetName(ppszName) {
        result := ComCall(3, this, "ptr", ppszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessetting-getvaluetype
     */
    GetValueType(pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarValue 
     * @param {Integer} dwScope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessetting-getpreference
     */
    GetPreference(pvarValue, dwScope) {
        result := ComCall(5, this, "ptr", pvarValue, "uint", dwScope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwScope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessetting-getpreferencescope
     */
    GetPreferenceScope(pdwScope) {
        pdwScopeMarshal := pdwScope is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwScopeMarshal, pdwScope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarValue 
     * @param {Integer} dwScope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessetting-setpreference
     */
    SetPreference(pvarValue, dwScope) {
        result := ComCall(7, this, "ptr", pvarValue, "uint", dwScope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwScope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessetting-deletepreference
     */
    DeletePreference(dwScope) {
        result := ComCall(8, this, "uint", dwScope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarValue 
     * @param {Integer} dwScope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessetting-getpolicy
     */
    GetPolicy(pvarValue, dwScope) {
        result := ComCall(9, this, "ptr", pvarValue, "uint", dwScope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwScope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessetting-getpolicyscope
     */
    GetPolicyScope(pdwScope) {
        pdwScopeMarshal := pdwScope is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pdwScopeMarshal, pdwScope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarValue 
     * @param {Pointer<BOOL>} pbSetByPolicy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessetting-getvalue
     */
    GetValue(pvarValue, pbSetByPolicy) {
        result := ComCall(11, this, "ptr", pvarValue, "ptr", pbSetByPolicy, "HRESULT")
        return result
    }
}
