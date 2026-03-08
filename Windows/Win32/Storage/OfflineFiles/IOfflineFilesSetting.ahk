#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a setting that controls the behavior the Offline Files service.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilessetting
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
     * Retrieves a name associated with a particular Offline Files setting.
     * @returns {PWSTR} Address of pointer variable that receives the address of a string containing the name of the Offline Files setting.  Upon successful return, the caller must free this memory block by using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessetting-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * Retrieves the data type of a particular Offline Files setting.
     * @returns {Integer} Receives a value from the <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_setting_value_type">OFFLINEFILES_SETTING_VALUE_TYPE</a> enumeration that describes the data type of the setting value.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessetting-getvaluetype
     */
    GetValueType() {
        result := ComCall(4, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * Retrieves a per-machine or per-user preference associated with a particular Offline Files setting.
     * @param {Integer} dwScope Indicates which preference is to be retrieved.  Must be one of the following.
     * @returns {VARIANT} If the preference supports one or more values, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> object contains those values.  If the preference does not support values, the type of the returned <b>VARIANT</b> is <b>VT_EMPTY</b>.
     * 
     * The method initializes the <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> prior to storing the preference value in it.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessetting-getpreference
     */
    GetPreference(dwScope) {
        pvarValue := VARIANT()
        result := ComCall(5, this, "ptr", pvarValue, "uint", dwScope, "HRESULT")
        return pvarValue
    }

    /**
     * Indicates the scope of the preference associated with this setting.
     * @remarks
     * Note that this is an indication of the supported scopes, not of the applied scopes.  For example, a setting may recognize both per-user and per-machine preference yet only the per-user preference has been applied.  In this scenario, this method would return both OFFLINEFILES_SETTING_SCOPE_USER and OFFLINEFILES_SETTING_SCOPE_COMPUTER.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessetting-getpreferencescope
     */
    GetPreferenceScope() {
        result := ComCall(6, this, "uint*", &pdwScope := 0, "HRESULT")
        return pdwScope
    }

    /**
     * Sets a per-computer or per-user preference associated with an Offline Files setting.
     * @remarks
     * This method requires system administrator privileges if the preference is a per-machine preference.
     * 
     * It is important to note that policy cannot be set through the Offline Files API.  Policy can be set only through the Group Policy mechanism.
     * @param {Pointer<VARIANT>} pvarValue Specifies the value associated with the preference.
     * 
     * If multiple values are associated with the preference, the <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> type includes <b>VT_ARRAY</b> and the values are stored in a <b>SAFEARRAY</b>.
     * @param {Integer} dwScope Indicates if the preference to be set is per-user or per-machine.  Must be one of the following.
     * @returns {HRESULT} <b>S_OK</b> if the preference is set successfully or an error value otherwise.
     * 
     * Returns <c>HRESULT_FROM_WIN32(ERROR_INVALID_PARAMETER)</c> if one or more data values specified via <i>pvtValue</i> are not valid.
     * 
     * Returns <c>HRESULT_FROM_WIN32(ERROR_ACCESS_DENIED)</c> if the caller is trying to set a per-machine preference and is not a local administrator.
     * 
     * Returns <c>HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)</c> if a scope is specified that is not supported by the preference.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessetting-setpreference
     */
    SetPreference(pvarValue, dwScope) {
        result := ComCall(7, this, "ptr", pvarValue, "uint", dwScope, "HRESULT")
        return result
    }

    /**
     * Removes a preference setting.
     * @remarks
     * This method requires system administrator privilege if the preference is a per-machine preference.
     * @param {Integer} dwScope Indicates which preference setting is to be deleted.  Must be one of the following.
     * @returns {HRESULT} <b>S_OK</b> if the preference is removed successfully or an error value otherwise.
     * 
     * Returns <c>HRESULT_FROM_WIN32(ERROR_FILE_NOT_FOUND)</c> if the requested preference setting is not currently configured.
     * 
     * Returns <c>HRESULT_FROM_WIN32(ERROR_ACCESS_DENIED)</c> if the caller is trying to remove a per-machine preference and is not a local administrator.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessetting-deletepreference
     */
    DeletePreference(dwScope) {
        result := ComCall(8, this, "uint", dwScope, "HRESULT")
        return result
    }

    /**
     * Retrieves a policy associated with a particular Offline Files setting.
     * @remarks
     * It is important to note that policy cannot be set through the Offline Files API.  Policy can be set only through the Group Policy mechanism.  The Offline Files API only supports querying policy values.
     * @param {Integer} dwScope Indicates which policy is to be retrieved.  Must be one of the following.
     * 
     * <div class="alert"><b>Note</b>  Note that not all settings have an associated policy and those that do might not support both per-machine and per-user policy.</div>
     * <div> </div>
     * @returns {VARIANT} If the policy supports one or more values, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> object contains those values.  If the policy does not support values, the type of the returned <b>VARIANT</b> is <b>VT_EMPTY</b>.
     * 
     * The method initializes the <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> prior to storing the policy value in it.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessetting-getpolicy
     */
    GetPolicy(dwScope) {
        pvarValue := VARIANT()
        result := ComCall(9, this, "ptr", pvarValue, "uint", dwScope, "HRESULT")
        return pvarValue
    }

    /**
     * Retrieves the scope of the policy associated with this setting.
     * @remarks
     * Note that this is an indication of the supported scopes, not of the applied scopes.  For example, a setting may recognize both per-user and per-machine policy yet only the per-user policy has been applied.  In this scenario, this API would return both OFFLINEFILES_SETTING_SCOPE_USER and OFFLINEFILES_SETTING_SCOPE_COMPUTER.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessetting-getpolicyscope
     */
    GetPolicyScope() {
        result := ComCall(10, this, "uint*", &pdwScope := 0, "HRESULT")
        return pdwScope
    }

    /**
     * Retrieves the value of a particular Offline Files setting.
     * @remarks
     * The value returned in the <i>pvarValue</i> parameter is determined as follows:
     * 
     * <ol>
     * <li>If machine policy exists, use it.</li>
     * <li>Otherwise, if user policy exists, use it.</li>
     * <li>Otherwise, if machine preference exists, use it.</li>
     * <li>Otherwise, if user preference exists, use it.</li>
     * <li>Otherwise, use the system default value.</li>
     * </ol>
     * The primary intent of the <i>pbSetByPolicy</i> parameter is to allow the caller to disable UI associated with a setting when the setting has been configured through Group Policy.
     * 
     * It is important to note that policy cannot be set through the Offline Files API.  Policy can be set only through the Group Policy mechanism.  The Offline Files API only supports querying policy values.
     * @param {Pointer<VARIANT>} pvarValue Receives the value associated with the setting.  This value is determined based on system policy, preferences and system defaults.
     * 
     * The method initializes the <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> prior to storing the setting value in it.
     * @param {Pointer<BOOL>} pbSetByPolicy Receives <b>TRUE</b> if the value was set by policy, <b>FALSE</b> if the value was determined by preference or default.
     * @returns {HRESULT} <b>S_OK</b> if the value query is successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessetting-getvalue
     */
    GetValue(pvarValue, pbSetByPolicy) {
        pbSetByPolicyMarshal := pbSetByPolicy is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "ptr", pvarValue, pbSetByPolicyMarshal, pbSetByPolicy, "HRESULT")
        return result
    }
}
