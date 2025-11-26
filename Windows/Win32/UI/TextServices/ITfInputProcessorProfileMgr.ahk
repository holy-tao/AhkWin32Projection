#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\TF_INPUTPROCESSORPROFILE.ahk
#Include .\IEnumTfInputProcessorProfiles.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfInputProcessorProfileMgr interface is implemented by the TSF manager and used by an application or text service to manipulate the language profile of one or more text services.
 * @remarks
 * 
 * Unlike <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfinputprocessorprofiles">ITfInputProcessorProfiles</a>, ITfInputProcessorProfileMgr
 *  can manage both keyboard layout and text services seamlessly. In Windows Vista, it is recommended to use this interface instead of using the following methods:
 * 
 * <ul>
 * <li>ITfInputProcessorProfiles::Register</li>
 * <li>ITfInputProcessorProfiles::Unregister</li>
 * <li>ITfInputProcessorProfiles::AddLanguageProfile</li>
 * <li>ITfInputProcessorProfiles::RemoveLanguageProfile</li>
 * <li>ITfInputProcessorProfiles::EnumInputProcessorInfo</li>
 * <li>ITfInputProcessorProfiles::ActivateLanguageProfile</li>
 * <li>ITfInputProcessorProfiles::GetActiveLanguageProfile</li>
 * <li>ITfInputProcessorProfiles::EnumLanguageProfiles</li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfinputprocessorprofilemgr
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfInputProcessorProfileMgr extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfInputProcessorProfileMgr
     * @type {Guid}
     */
    static IID => Guid("{71c6e74c-0f28-11d8-a82a-00065b84435c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ActivateProfile", "DeactivateProfile", "GetProfile", "EnumProfiles", "ReleaseInputProcessor", "RegisterProfile", "UnregisterProfile", "GetActiveProfile"]

    /**
     * The ITfInputProcessorProfileMgr::ActivateProfile method activates the specified text service's profile or keyboard layout.
     * @param {Integer} dwProfileType [in] The type of this profile. This is one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_PROFILETYPE_INPUTPROCESSOR"></a><a id="tf_profiletype_inputprocessor"></a><dl>
     * <dt><b>TF_PROFILETYPE_INPUTPROCESSOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This is a text service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_PROFILETYPE_KEYBOARDLAYOUT"></a><a id="tf_profiletype_keyboardlayout"></a><dl>
     * <dt><b>TF_PROFILETYPE_KEYBOARDLAYOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This is a keyboard layout.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} langid [in] The language id of the profile to be activated.
     * @param {Pointer<Guid>} clsid [in] The CLSID of the text service of the profile to be activated. This must be CLSID_NULL if <i>dwProfileType</i> is TF_PROFILETYPE_KEYBOARDLAYOUT.
     * @param {Pointer<Guid>} guidProfile [in] The guidProfile of the profile to be activated. This must be GUID_NULL if <i>dwProfileType</i> is TF_PROFILETYPE_KEYBOARDLAYOUT.
     * @param {HKL} hkl [in] The handle of the keyboard layout. This must be <b>NULL</b> if dwProfileType is TF_PROFILETYPE_INPUTPROCESSOR.
     * @param {Integer} dwFlags The combination of the following bits:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_IPPMF_FORPROCESS"></a><a id="tf_ippmf_forprocess"></a><dl>
     * <dt><b>TF_IPPMF_FORPROCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activate this profile for all threads in the process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_IPPMF_FORSESSION"></a><a id="tf_ippmf_forsession"></a><dl>
     * <dt><b>TF_IPPMF_FORSESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activate this profile for all threads in the current desktop.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_IPPMF_ENABLEPROFILE"></a><a id="tf_ippmf_enableprofile"></a><dl>
     * <dt><b>TF_IPPMF_ENABLEPROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Update the registry to enable this profile for this user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_IPPMF_DISABLEPROFILE"></a><a id="tf_ippmf_disableprofile"></a><dl>
     * <dt><b>TF_IPPMF_DISABLEPROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_IPPMF_DONTCARECURRENTINPUTLANGUAGE"></a><a id="tf_ippmf_dontcarecurrentinputlanguage"></a><dl>
     * <dt><b>TF_IPPMF_DONTCARECURRENTINPUTLANGUAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the current input language does not match with the requested profile's language, TSF marks this profile to be activated when the requested input language is switched. If this flag is off and the current input language is not matched, this method fails.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The language profile is not enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfinputprocessorprofilemgr-activateprofile
     */
    ActivateProfile(dwProfileType, langid, clsid, guidProfile, hkl, dwFlags) {
        hkl := hkl is Win32Handle ? NumGet(hkl, "ptr") : hkl

        result := ComCall(3, this, "uint", dwProfileType, "ushort", langid, "ptr", clsid, "ptr", guidProfile, "ptr", hkl, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The ITfInputProcessorProfileMgr::DeactivateProfile method deactivates the specified text service's profile or keyboard layout.
     * @param {Integer} dwProfileType [in] The type of this profile. This is one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_PROFILETYPE_INPUTPROCESSOR"></a><a id="tf_profiletype_inputprocessor"></a><dl>
     * <dt><b>TF_PROFILETYPE_INPUTPROCESSOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This is a text service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_PROFILETYPE_KEYBOARDLAYOUT"></a><a id="tf_profiletype_keyboardlayout"></a><dl>
     * <dt><b>TF_PROFILETYPE_KEYBOARDLAYOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This is a keyboard layout.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} langid [in] The language id of the profile to be activated.
     * @param {Pointer<Guid>} clsid [in] The CLSID of the text service of the profile to be activated. This must be CLSID_NULL if <i>dwProfileType</i> is TF_PROFILETYPE_KEYBOARDLAYOUT.
     * @param {Pointer<Guid>} guidProfile [in] The guidProfile of the profile to be activated. This must be GUID_NULL if <i>dwProfileType</i> is TF_PROFILETYPE_KEYBOARDLAYOUT.
     * @param {HKL} hkl [in] The handle of the keyboard layout. This must be <b>NULL</b> if <i>dwProfileType</i> is TF_PROFILETYPE_INPUTPROCESSOR.
     * @param {Integer} dwFlags The combination of the following bits:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_IPPMF_FORPROCESS"></a><a id="tf_ippmf_forprocess"></a><dl>
     * <dt><b>TF_IPPMF_FORPROCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Deactivate this profile for all threads in the process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_IPPMF_FORSESSION"></a><a id="tf_ippmf_forsession"></a><dl>
     * <dt><b>TF_IPPMF_FORSESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Deactivate this profile for all threads in the current desktop.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_IPPMF_DISABLEPROFILE"></a><a id="tf_ippmf_disableprofile"></a><dl>
     * <dt><b>TF_IPPMF_DISABLEPROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfinputprocessorprofilemgr-deactivateprofile
     */
    DeactivateProfile(dwProfileType, langid, clsid, guidProfile, hkl, dwFlags) {
        hkl := hkl is Win32Handle ? NumGet(hkl, "ptr") : hkl

        result := ComCall(4, this, "uint", dwProfileType, "ushort", langid, "ptr", clsid, "ptr", guidProfile, "ptr", hkl, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The ITfInputProcessorProfileMgr::GetProfile method returns the information of the specified text service's profile or keyboard layout in TF_INPUTPROCESSORPROFILE structure.
     * @param {Integer} dwProfileType [in] The type of this profile. This is one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_PROFILETYPE_INPUTPROCESSOR"></a><a id="tf_profiletype_inputprocessor"></a><dl>
     * <dt><b>TF_PROFILETYPE_INPUTPROCESSOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This is a text service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_PROFILETYPE_KEYBOARDLAYOUT"></a><a id="tf_profiletype_keyboardlayout"></a><dl>
     * <dt><b>TF_PROFILETYPE_KEYBOARDLAYOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This is a keyboard layout.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} langid [in] The language id of the profile to be activated.
     * @param {Pointer<Guid>} clsid [in] The CLSID of the text service of the profile to be activated. This must be CLSID_NULL if <i>dwProfileType</i> is TF_PROFILETYPE_KEYBOARDLAYOUT.
     * @param {Pointer<Guid>} guidProfile [in] The guidProfile of the profile to be activated. This must be GUID_NULL if <i>dwProfileType</i> is TF_PROFILETYPE_KEYBOARDLAYOUT.
     * @param {HKL} hkl [in] The handle of the keyboard layout. This must be <b>NULL</b> if <i>dwProfileType</i> is TF_PROFILETYPE_INPUTPROCESSOR.
     * @returns {TF_INPUTPROCESSORPROFILE} [out] The buffer to receive <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_inputprocessorprofile">TF_INPUTPROCESSORPROFILE</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfinputprocessorprofilemgr-getprofile
     */
    GetProfile(dwProfileType, langid, clsid, guidProfile, hkl) {
        hkl := hkl is Win32Handle ? NumGet(hkl, "ptr") : hkl

        pProfile := TF_INPUTPROCESSORPROFILE()
        result := ComCall(5, this, "uint", dwProfileType, "ushort", langid, "ptr", clsid, "ptr", guidProfile, "ptr", hkl, "ptr", pProfile, "HRESULT")
        return pProfile
    }

    /**
     * The ITfInputProcessorProfileMgr::EnumProfiles method returns profiles to be enumerated.
     * @param {Integer} langid [in] langid of the profiles to be enumerated. If langid is 0, all profiles will be enumerated.
     * @returns {IEnumTfInputProcessorProfiles} [out] The pointer to receive a pointer of <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumtfinputprocessorprofiles">IEnumTfInputProcessorProfiles</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfinputprocessorprofilemgr-enumprofiles
     */
    EnumProfiles(langid) {
        result := ComCall(6, this, "ushort", langid, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfInputProcessorProfiles(ppEnum)
    }

    /**
     * The ITfInputProcessorProfileMgr::ReleaseInputProcessor method deactivates the profiles belonging to the text services of the specified CLSID and releases the instance of ITfTextInputProcessorEx interface.
     * @param {Pointer<Guid>} rclsid [in] CLSID of the textservice to be released.
     * @param {Integer} dwFlags [in]
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_RIP_FLAG_FREEUNUSEDLIBRARIES"></a><a id="tf_rip_flag_freeunusedlibraries"></a><dl>
     * <dt><b>TF_RIP_FLAG_FREEUNUSEDLIBRARIES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this bit is on, this method calls CoFreeUnusedLibrariesEx() so the text services DLL might be freed if it does not have any more COM/DLL reference. Warning: This flag could cause some other unrelated COM/DLL free.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfinputprocessorprofilemgr-releaseinputprocessor
     */
    ReleaseInputProcessor(rclsid, dwFlags) {
        result := ComCall(7, this, "ptr", rclsid, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The ITfInputProcessorProfileMgr::RegisterProfile method registers the text service and the profile.
     * @param {Pointer<Guid>} rclsid [in] CLSID of the text service.
     * @param {Integer} langid [in] The language id of the profile.
     * @param {Pointer<Guid>} guidProfile [in] The GUID to identify the profile.
     * @param {PWSTR} pchDesc [in, size_is(cchDesc)] The description of the profile.
     * @param {Integer} cchDesc [in] The length of pchDesc.
     * @param {PWSTR} pchIconFile [in, size_is(cchFile] The full path of the icon file.
     * @param {Integer} cchFile [in] The length of pchIconFile.
     * @param {Integer} uIconIndex [in] The icon index of the icon file for this profile.
     * @param {HKL} hklsubstitute [in] The substitute hkl of this profile.
     * @param {Integer} dwPreferredLayout [in] Unused. this must be 0.
     * @param {BOOL} bEnabledByDefault [in] True if this profile is enabled by default.
     * @param {Integer} dwFlags [in] The combination of the following bits:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_RP_HIDDENINSETTINGUI"></a><a id="tf_rp_hiddeninsettingui"></a><dl>
     * <dt><b>TF_RP_HIDDENINSETTINGUI</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This profile will not appear in the setting UI.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_RP_LOCALPROCESS"></a><a id="tf_rp_localprocess"></a><dl>
     * <dt><b>TF_RP_LOCALPROCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This profile is available only on the local process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_RP_LOCALTHREAD"></a><a id="tf_rp_localthread"></a><dl>
     * <dt><b>TF_RP_LOCALTHREAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This profile is available only on the local thread.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfinputprocessorprofilemgr-registerprofile
     */
    RegisterProfile(rclsid, langid, guidProfile, pchDesc, cchDesc, pchIconFile, cchFile, uIconIndex, hklsubstitute, dwPreferredLayout, bEnabledByDefault, dwFlags) {
        pchDesc := pchDesc is String ? StrPtr(pchDesc) : pchDesc
        pchIconFile := pchIconFile is String ? StrPtr(pchIconFile) : pchIconFile
        hklsubstitute := hklsubstitute is Win32Handle ? NumGet(hklsubstitute, "ptr") : hklsubstitute

        result := ComCall(8, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfile, "ptr", pchDesc, "uint", cchDesc, "ptr", pchIconFile, "uint", cchFile, "uint", uIconIndex, "ptr", hklsubstitute, "uint", dwPreferredLayout, "int", bEnabledByDefault, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The ITfInputProcessorProfileMgr::UnregisterProfile method unregisters the text service and the profile.
     * @param {Pointer<Guid>} rclsid [in] CLSID of the text service.
     * @param {Integer} langid [in] The language id of the profile.
     * @param {Pointer<Guid>} guidProfile [in] The GUID to identify the profile.
     * @param {Integer} dwFlags [in] The combination of the following bits:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_URP_ALLPROFILES"></a><a id="tf_urp_allprofiles"></a><dl>
     * <dt><b>TF_URP_ALLPROFILES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this bit is on, <b>UnregistrProfile</b> unregisters all profiles of the <i>rclsid</i> parameter. The <i>langid</i> and <i>guidProfile</i> parameters are ignored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_URP_LOCALPROCESS"></a><a id="tf_urp_localprocess"></a><dl>
     * <dt><b>TF_URP_LOCALPROCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile was registered on the local process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_URP_LOCALTHREAD"></a><a id="tf_urp_localthread"></a><dl>
     * <dt><b>TF_URP_LOCALTHREAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile was registered on the local thread.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfinputprocessorprofilemgr-unregisterprofile
     */
    UnregisterProfile(rclsid, langid, guidProfile, dwFlags) {
        result := ComCall(9, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfile, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * This method returns the current active profile.
     * @param {Pointer<Guid>} catid [in] The category id for the profile. This must be GUID_TFCAT_TIP_KEYBOARD. Only GUID_TFCAT_TIP_KEYBOARD is supported.
     * @returns {TF_INPUTPROCESSORPROFILE} [out] The buffer to receive the profile information.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfinputprocessorprofilemgr-getactiveprofile
     */
    GetActiveProfile(catid) {
        pProfile := TF_INPUTPROCESSORPROFILE()
        result := ComCall(10, this, "ptr", catid, "ptr", pProfile, "HRESULT")
        return pProfile
    }
}
