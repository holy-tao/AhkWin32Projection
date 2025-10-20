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
     * 
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     */
    GetName(ppszName) {
        result := ComCall(3, this, "ptr", ppszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    GetValueType(pType) {
        result := ComCall(4, this, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarValue 
     * @param {Integer} dwScope 
     * @returns {HRESULT} 
     */
    GetPreference(pvarValue, dwScope) {
        result := ComCall(5, this, "ptr", pvarValue, "uint", dwScope, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwScope 
     * @returns {HRESULT} 
     */
    GetPreferenceScope(pdwScope) {
        result := ComCall(6, this, "uint*", pdwScope, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarValue 
     * @param {Integer} dwScope 
     * @returns {HRESULT} 
     */
    SetPreference(pvarValue, dwScope) {
        result := ComCall(7, this, "ptr", pvarValue, "uint", dwScope, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwScope 
     * @returns {HRESULT} 
     */
    DeletePreference(dwScope) {
        result := ComCall(8, this, "uint", dwScope, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarValue 
     * @param {Integer} dwScope 
     * @returns {HRESULT} 
     */
    GetPolicy(pvarValue, dwScope) {
        result := ComCall(9, this, "ptr", pvarValue, "uint", dwScope, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwScope 
     * @returns {HRESULT} 
     */
    GetPolicyScope(pdwScope) {
        result := ComCall(10, this, "uint*", pdwScope, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarValue 
     * @param {Pointer<BOOL>} pbSetByPolicy 
     * @returns {HRESULT} 
     */
    GetValue(pvarValue, pbSetByPolicy) {
        result := ComCall(11, this, "ptr", pvarValue, "ptr", pbSetByPolicy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
