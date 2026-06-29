#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Input\KeyboardAndMouse\HKL.ahk" { HKL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IEnumGUID.ahk" { IEnumGUID }
#Import ".\IEnumTfLanguageProfiles.ahk" { IEnumTfLanguageProfiles }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfInputProcessorProfiles interface is implemented by the TSF manager and used by an application or text service to manipulate the language profile of one or more text services.
 * @remarks
 * To obtain a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> with CLSID_TF_InputProcessorProfiles.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfinputprocessorprofiles
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfInputProcessorProfiles extends IUnknown {
    /**
     * The interface identifier for ITfInputProcessorProfiles
     * @type {Guid}
     */
    static IID := Guid("{1f02b6c5-7842-4ee6-8a0b-9a24183a95ca}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfInputProcessorProfiles interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Register                       : IntPtr
        Unregister                     : IntPtr
        AddLanguageProfile             : IntPtr
        RemoveLanguageProfile          : IntPtr
        EnumInputProcessorInfo         : IntPtr
        GetDefaultLanguageProfile      : IntPtr
        SetDefaultLanguageProfile      : IntPtr
        ActivateLanguageProfile        : IntPtr
        GetActiveLanguageProfile       : IntPtr
        GetLanguageProfileDescription  : IntPtr
        GetCurrentLanguage             : IntPtr
        ChangeCurrentLanguage          : IntPtr
        GetLanguageList                : IntPtr
        EnumLanguageProfiles           : IntPtr
        EnableLanguageProfile          : IntPtr
        IsEnabledLanguageProfile       : IntPtr
        EnableLanguageProfileByDefault : IntPtr
        SubstituteKeyboardLayout       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfInputProcessorProfiles.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfInputProcessorProfiles::Register method
     * @param {Pointer<Guid>} rclsid Contains the CLSID of the text service to register.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-register
     */
    Register(rclsid) {
        result := ComCall(3, this, Guid.Ptr, rclsid, "HRESULT")
        return result
    }

    /**
     * ITfInputProcessorProfiles::Unregister method
     * @param {Pointer<Guid>} rclsid Contains the text service CLSID to unregister.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-unregister
     */
    Unregister(rclsid) {
        result := ComCall(4, this, Guid.Ptr, rclsid, "HRESULT")
        return result
    }

    /**
     * ITfInputProcessorProfiles::AddLanguageProfile method
     * @param {Pointer<Guid>} rclsid Contains the text service CLSID.
     * @param {Integer} langid Contains a <b>LANGID</b> value that specifies the language identifier of the profile that the text service is added to. If this contains -1, the text service is added to all languages.
     * @param {Pointer<Guid>} guidProfile Contains a GUID value that identifies the language profile. This is the value obtained by <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfinputprocessorprofiles-getactivelanguageprofile">ITfInputProcessorProfiles::GetActiveLanguageProfile</a> when the profile is active.
     * @param {PWSTR} pchDesc Pointer to a <b>WCHAR</b> buffer that contains the description string for the text service in the profile. This is the text service name displayed in the language bar.
     * @param {Integer} cchDesc Contains the length, in characters, of the description string in <i>pchDesc</i>. If this contains -1, <i>pchDesc</i> is assumed to be a <b>NULL</b>-terminated string.
     * @param {PWSTR} pchIconFile Pointer to a <b>WCHAR</b> buffer that contains the path and file name of the file that contains the icon to be displayed in the language bar for the text service in the profile. This file can be an executable (.exe), DLL (.dll) or icon (.ico) file.
     * 
     * This parameter is optional and can be <b>NULL</b>. In this case, a default icon is displayed for the text service.
     * @param {Integer} cchFile Contains the length, in characters, of the icon file string in <i>pchIconFile</i>. If this contains -1, <i>pchIconFile</i> is assumed to be a <b>NULL</b>-terminated string. This parameter is ignored if <i>pchIconFile</i> is <b>NULL</b>.
     * @param {Integer} uIconIndex Contains the zero-based index of the icon in <i>pchIconFile</i> to be displayed in the language bar for the text service in the profile. This parameter is ignored if <i>pchIconFile</i> is <b>NULL</b>.
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
     * <i>pszDesc</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-addlanguageprofile
     */
    AddLanguageProfile(rclsid, langid, guidProfile, pchDesc, cchDesc, pchIconFile, cchFile, uIconIndex) {
        pchDesc := pchDesc is String ? StrPtr(pchDesc) : pchDesc
        pchIconFile := pchIconFile is String ? StrPtr(pchIconFile) : pchIconFile

        result := ComCall(5, this, Guid.Ptr, rclsid, "ushort", langid, Guid.Ptr, guidProfile, "ptr", pchDesc, "uint", cchDesc, "ptr", pchIconFile, "uint", cchFile, "uint", uIconIndex, "HRESULT")
        return result
    }

    /**
     * ITfInputProcessorProfiles::RemoveLanguageProfile method
     * @param {Pointer<Guid>} rclsid Contains the text service CLSID.
     * @param {Integer} langid Contains a <b>LANGID</b> value that specifies the language identifier of the profile.
     * @param {Pointer<Guid>} guidProfile Contains a GUID value that identifies the language profile. This is the value specified in <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfinputprocessorprofiles-addlanguageprofile">ITfInputProcessorProfiles::AddLanguageProfile</a> when the profile was added.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-removelanguageprofile
     */
    RemoveLanguageProfile(rclsid, langid, guidProfile) {
        result := ComCall(6, this, Guid.Ptr, rclsid, "ushort", langid, Guid.Ptr, guidProfile, "HRESULT")
        return result
    }

    /**
     * ITfInputProcessorProfiles::EnumInputProcessorInfo method
     * @returns {IEnumGUID} Pointer to an <b>IEnumGUID</b> interface pointer that receives the enumerator object. The enumerator contains the CLSID for each registered text service. The caller must release this object when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-enuminputprocessorinfo
     */
    EnumInputProcessorInfo() {
        result := ComCall(7, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumGUID(ppEnum)
    }

    /**
     * ITfInputProcessorProfiles::GetDefaultLanguageProfile method
     * @param {Integer} langid Contains a <b>LANGID</b> value that specifies which language to obtain the default profile for.
     * @param {Pointer<Guid>} catid Contains a GUID value that identifies the category that the text service is registered under. This can be a user-defined category or one of the <a href="https://docs.microsoft.com/windows/desktop/TSF/predefined-category-values">predefined category values</a>.
     * @param {Pointer<Guid>} pclsid Pointer to a <b>CLSID</b> value that receives the class identifier of the default text service for the language.
     * @param {Pointer<Guid>} pguidProfile Pointer to a <b>GUID</b> value that receives the identifier of the default profile for the language.
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
     * No default language profile was found for the specified language and category.
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-getdefaultlanguageprofile
     */
    GetDefaultLanguageProfile(langid, catid, pclsid, pguidProfile) {
        result := ComCall(8, this, "ushort", langid, Guid.Ptr, catid, Guid.Ptr, pclsid, Guid.Ptr, pguidProfile, "HRESULT")
        return result
    }

    /**
     * ITfInputProcessorProfiles::SetDefaultLanguageProfile method
     * @param {Integer} langid Contains a LANGID value that specifies which language to set the default profile for.
     * @param {Pointer<Guid>} rclsid Contains the CLSID of the text service that will be the default for the language.
     * @param {Pointer<Guid>} guidProfiles Contains a GUID value that identifies the language profile that will be the default.
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-setdefaultlanguageprofile
     */
    SetDefaultLanguageProfile(langid, rclsid, guidProfiles) {
        result := ComCall(9, this, "ushort", langid, Guid.Ptr, rclsid, Guid.Ptr, guidProfiles, "HRESULT")
        return result
    }

    /**
     * ITfInputProcessorProfiles::ActivateLanguageProfile method
     * @param {Pointer<Guid>} rclsid Contains the CLSID of the text service to make active.
     * @param {Integer} langid Contains a <b>LANGID</b> value that specifies which language to set the default profile for. This method fails if this is not the currently active language.
     * @param {Pointer<Guid>} guidProfiles Contains a GUID value that identifies the language profile to make active.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation failure occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No thread manager has been created for the calling thread.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-activatelanguageprofile
     */
    ActivateLanguageProfile(rclsid, langid, guidProfiles) {
        result := ComCall(10, this, Guid.Ptr, rclsid, "ushort", langid, Guid.Ptr, guidProfiles, "HRESULT")
        return result
    }

    /**
     * ITfInputProcessorProfiles::GetActiveLanguageProfile method
     * @param {Pointer<Guid>} rclsid Contains the text service CLSID.
     * @param {Pointer<Integer>} plangid Pointer to a <b>LANGID</b> value that receives the active profile language identifier.
     * @param {Pointer<Guid>} pguidProfile Pointer to a <b>GUID</b> value that receives the language profile identifier. This is the value specified in <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfinputprocessorprofiles-addlanguageprofile">ITfInputProcessorProfiles::AddLanguageProfile</a> when the profile was added.
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
     * The text service identified by <i>rclsid</i> is not currently active. <i>pguidProfile</i> receives GUID_NULL.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-getactivelanguageprofile
     */
    GetActiveLanguageProfile(rclsid, plangid, pguidProfile) {
        plangidMarshal := plangid is VarRef ? "ushort*" : "ptr"

        result := ComCall(11, this, Guid.Ptr, rclsid, plangidMarshal, plangid, Guid.Ptr, pguidProfile, "HRESULT")
        return result
    }

    /**
     * ITfInputProcessorProfiles::GetLanguageProfileDescription method
     * @param {Pointer<Guid>} rclsid Contains the CLSID of the text service to obtain the profile description for.
     * @param {Integer} langid Contains a <b>LANGID</b> value that specifies which language to obtain the profile description for.
     * @param {Pointer<Guid>} guidProfile Contains a GUID value that identifies the language to obtain the profile description for.
     * @returns {BSTR} Pointer to a <b>BSTR</b> value that receives the description string. The caller is responsible for freeing this memory using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-getlanguageprofiledescription
     */
    GetLanguageProfileDescription(rclsid, langid, guidProfile) {
        pbstrProfile := BSTR.Owned()
        result := ComCall(12, this, Guid.Ptr, rclsid, "ushort", langid, Guid.Ptr, guidProfile, BSTR.Ptr, pbstrProfile, "HRESULT")
        return pbstrProfile
    }

    /**
     * ITfInputProcessorProfiles::GetCurrentLanguage method
     * @returns {Integer} Pointer to a <b>LANGID</b> value that receives the language identifier of the currently active language.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-getcurrentlanguage
     */
    GetCurrentLanguage() {
        result := ComCall(13, this, "ushort*", &plangid := 0, "HRESULT")
        return plangid
    }

    /**
     * ITfInputProcessorProfiles::ChangeCurrentLanguage method
     * @param {Integer} langid Contains the <b>LANGID</b> of the language to make active.
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
     * <i>langid</i> is an invalid language identifier.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation failure occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No thread manager was created for the calling thread.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-changecurrentlanguage
     */
    ChangeCurrentLanguage(langid) {
        result := ComCall(14, this, "ushort", langid, "HRESULT")
        return result
    }

    /**
     * ITfInputProcessorProfiles::GetLanguageList method
     * @param {Pointer<Pointer<Integer>>} ppLangId Pointer to a <b>LANGID</b> pointer that receives the array of identifiers of the currently installed languages. The number of identifiers placed in this array is supplied in <i>pulCount</i>. The array is allocated by this method. The caller must free this memory when it is no longer required using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<Integer>} pulCount Pointer to a ULONG value the receives the number of identifiers placed in the array at <i>ppLangId</i>.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation failure occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-getlanguagelist
     */
    GetLanguageList(ppLangId, pulCount) {
        ppLangIdMarshal := ppLangId is VarRef ? "ptr*" : "ptr"
        pulCountMarshal := pulCount is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, ppLangIdMarshal, ppLangId, pulCountMarshal, pulCount, "HRESULT")
        return result
    }

    /**
     * ITfInputProcessorProfiles::EnumLanguageProfiles method
     * @param {Integer} langid Contains a <b>LANGID</b> value that specifies the language to obtain an enumerator for.
     * @returns {IEnumTfLanguageProfiles} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumtflanguageprofiles">IEnumTfLanguageProfiles</a> interface pointer that receives the enumerator object.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-enumlanguageprofiles
     */
    EnumLanguageProfiles(langid) {
        result := ComCall(16, this, "ushort", langid, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfLanguageProfiles(ppEnum)
    }

    /**
     * ITfInputProcessorProfiles::EnableLanguageProfile method
     * @param {Pointer<Guid>} rclsid Contains the CLSID of the text service of the profile to be enabled or disabled.
     * @param {Integer} langid Contains a <b>LANGID</b> value that specifies the language of the profile to be enabled or disabled.
     * @param {Pointer<Guid>} guidProfile Contains a GUID value that identifies the profile to be enabled or disabled.
     * @param {BOOL} fEnable Contains a <b>BOOL</b> value that specifies if the profile will be enabled or disabled. If this contains a nonzero value, the profile will be enabled. If this contains zero, the profile will be disabled.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-enablelanguageprofile
     */
    EnableLanguageProfile(rclsid, langid, guidProfile, fEnable) {
        result := ComCall(17, this, Guid.Ptr, rclsid, "ushort", langid, Guid.Ptr, guidProfile, BOOL, fEnable, "HRESULT")
        return result
    }

    /**
     * ITfInputProcessorProfiles::IsEnabledLanguageProfile method
     * @param {Pointer<Guid>} rclsid Contains the CLSID of the text service of the profile in question.
     * @param {Integer} langid Contains a <b>LANGID</b> value that specifies the language of the profile in question.
     * @param {Pointer<Guid>} guidProfile Contains a GUID value that identifies the profile in question.
     * @returns {BOOL} Pointer to a <b>BOOL</b> value that receives a value that specifies if the profile is enabled or disabled. If this receives a nonzero value, the profile is enabled. If this receives zero, the profile is disabled.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-isenabledlanguageprofile
     */
    IsEnabledLanguageProfile(rclsid, langid, guidProfile) {
        result := ComCall(18, this, Guid.Ptr, rclsid, "ushort", langid, Guid.Ptr, guidProfile, BOOL.Ptr, &pfEnable := 0, "HRESULT")
        return pfEnable
    }

    /**
     * ITfInputProcessorProfiles::EnableLanguageProfileByDefault method
     * @param {Pointer<Guid>} rclsid Contains the CLSID of the text service of the profile to be enabled or disabled.
     * @param {Integer} langid Contains a <b>LANGID</b> value that specifies the language of the profile to be enabled or disabled.
     * @param {Pointer<Guid>} guidProfile Contains a GUID value that identifies the profile to be enabled or disabled.
     * @param {BOOL} fEnable Contains a <b>BOOL</b> value that specifies if the profile is enabled or disabled. If this contains a nonzero value, the profile is enabled. If this contains zero, the profile is disabled.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-enablelanguageprofilebydefault
     */
    EnableLanguageProfileByDefault(rclsid, langid, guidProfile, fEnable) {
        result := ComCall(19, this, Guid.Ptr, rclsid, "ushort", langid, Guid.Ptr, guidProfile, BOOL, fEnable, "HRESULT")
        return result
    }

    /**
     * ITfInputProcessorProfiles::SubstituteKeyboardLayout method
     * @param {Pointer<Guid>} rclsid Contains the CLSID of the text service of the profile in question.
     * @param {Integer} langid Contains a <b>LANGID</b> value that specifies the language of the profile in question.
     * @param {Pointer<Guid>} guidProfile Contains a GUID value that identifies the profile in question.
     * @param {HKL} _hKL Contains an <b>HKL</b> value that specifies the input locale identifier for the substitute keyboard. Obtain this value by calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadkeyboardlayouta">LoadKeyboardLayout</a>.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-substitutekeyboardlayout
     */
    SubstituteKeyboardLayout(rclsid, langid, guidProfile, _hKL) {
        result := ComCall(20, this, Guid.Ptr, rclsid, "ushort", langid, Guid.Ptr, guidProfile, HKL, _hKL, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfInputProcessorProfiles.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Register := CallbackCreate(GetMethod(implObj, "Register"), flags, 2)
        this.vtbl.Unregister := CallbackCreate(GetMethod(implObj, "Unregister"), flags, 2)
        this.vtbl.AddLanguageProfile := CallbackCreate(GetMethod(implObj, "AddLanguageProfile"), flags, 9)
        this.vtbl.RemoveLanguageProfile := CallbackCreate(GetMethod(implObj, "RemoveLanguageProfile"), flags, 4)
        this.vtbl.EnumInputProcessorInfo := CallbackCreate(GetMethod(implObj, "EnumInputProcessorInfo"), flags, 2)
        this.vtbl.GetDefaultLanguageProfile := CallbackCreate(GetMethod(implObj, "GetDefaultLanguageProfile"), flags, 5)
        this.vtbl.SetDefaultLanguageProfile := CallbackCreate(GetMethod(implObj, "SetDefaultLanguageProfile"), flags, 4)
        this.vtbl.ActivateLanguageProfile := CallbackCreate(GetMethod(implObj, "ActivateLanguageProfile"), flags, 4)
        this.vtbl.GetActiveLanguageProfile := CallbackCreate(GetMethod(implObj, "GetActiveLanguageProfile"), flags, 4)
        this.vtbl.GetLanguageProfileDescription := CallbackCreate(GetMethod(implObj, "GetLanguageProfileDescription"), flags, 5)
        this.vtbl.GetCurrentLanguage := CallbackCreate(GetMethod(implObj, "GetCurrentLanguage"), flags, 2)
        this.vtbl.ChangeCurrentLanguage := CallbackCreate(GetMethod(implObj, "ChangeCurrentLanguage"), flags, 2)
        this.vtbl.GetLanguageList := CallbackCreate(GetMethod(implObj, "GetLanguageList"), flags, 3)
        this.vtbl.EnumLanguageProfiles := CallbackCreate(GetMethod(implObj, "EnumLanguageProfiles"), flags, 3)
        this.vtbl.EnableLanguageProfile := CallbackCreate(GetMethod(implObj, "EnableLanguageProfile"), flags, 5)
        this.vtbl.IsEnabledLanguageProfile := CallbackCreate(GetMethod(implObj, "IsEnabledLanguageProfile"), flags, 5)
        this.vtbl.EnableLanguageProfileByDefault := CallbackCreate(GetMethod(implObj, "EnableLanguageProfileByDefault"), flags, 5)
        this.vtbl.SubstituteKeyboardLayout := CallbackCreate(GetMethod(implObj, "SubstituteKeyboardLayout"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Register)
        CallbackFree(this.vtbl.Unregister)
        CallbackFree(this.vtbl.AddLanguageProfile)
        CallbackFree(this.vtbl.RemoveLanguageProfile)
        CallbackFree(this.vtbl.EnumInputProcessorInfo)
        CallbackFree(this.vtbl.GetDefaultLanguageProfile)
        CallbackFree(this.vtbl.SetDefaultLanguageProfile)
        CallbackFree(this.vtbl.ActivateLanguageProfile)
        CallbackFree(this.vtbl.GetActiveLanguageProfile)
        CallbackFree(this.vtbl.GetLanguageProfileDescription)
        CallbackFree(this.vtbl.GetCurrentLanguage)
        CallbackFree(this.vtbl.ChangeCurrentLanguage)
        CallbackFree(this.vtbl.GetLanguageList)
        CallbackFree(this.vtbl.EnumLanguageProfiles)
        CallbackFree(this.vtbl.EnableLanguageProfile)
        CallbackFree(this.vtbl.IsEnabledLanguageProfile)
        CallbackFree(this.vtbl.EnableLanguageProfileByDefault)
        CallbackFree(this.vtbl.SubstituteKeyboardLayout)
    }
}
