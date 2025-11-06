#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IEnumGUID.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IEnumTfLanguageProfiles.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfInputProcessorProfiles interface is implemented by the TSF manager and used by an application or text service to manipulate the language profile of one or more text services.
 * @remarks
 * 
  * To obtain a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> with CLSID_TF_InputProcessorProfiles.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfinputprocessorprofiles
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfInputProcessorProfiles extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfInputProcessorProfiles
     * @type {Guid}
     */
    static IID => Guid("{1f02b6c5-7842-4ee6-8a0b-9a24183a95ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Register", "Unregister", "AddLanguageProfile", "RemoveLanguageProfile", "EnumInputProcessorInfo", "GetDefaultLanguageProfile", "SetDefaultLanguageProfile", "ActivateLanguageProfile", "GetActiveLanguageProfile", "GetLanguageProfileDescription", "GetCurrentLanguage", "ChangeCurrentLanguage", "GetLanguageList", "EnumLanguageProfiles", "EnableLanguageProfile", "IsEnabledLanguageProfile", "EnableLanguageProfileByDefault", "SubstituteKeyboardLayout"]

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-register
     */
    Register(rclsid) {
        result := ComCall(3, this, "ptr", rclsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-unregister
     */
    Unregister(rclsid) {
        result := ComCall(4, this, "ptr", rclsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} guidProfile 
     * @param {PWSTR} pchDesc 
     * @param {Integer} cchDesc 
     * @param {PWSTR} pchIconFile 
     * @param {Integer} cchFile 
     * @param {Integer} uIconIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-addlanguageprofile
     */
    AddLanguageProfile(rclsid, langid, guidProfile, pchDesc, cchDesc, pchIconFile, cchFile, uIconIndex) {
        pchDesc := pchDesc is String ? StrPtr(pchDesc) : pchDesc
        pchIconFile := pchIconFile is String ? StrPtr(pchIconFile) : pchIconFile

        result := ComCall(5, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfile, "ptr", pchDesc, "uint", cchDesc, "ptr", pchIconFile, "uint", cchFile, "uint", uIconIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} guidProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-removelanguageprofile
     */
    RemoveLanguageProfile(rclsid, langid, guidProfile) {
        result := ComCall(6, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumGUID} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-enuminputprocessorinfo
     */
    EnumInputProcessorInfo() {
        result := ComCall(7, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumGUID(ppEnum)
    }

    /**
     * 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} catid 
     * @param {Pointer<Guid>} pclsid 
     * @param {Pointer<Guid>} pguidProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-getdefaultlanguageprofile
     */
    GetDefaultLanguageProfile(langid, catid, pclsid, pguidProfile) {
        result := ComCall(8, this, "ushort", langid, "ptr", catid, "ptr", pclsid, "ptr", pguidProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} guidProfiles 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-setdefaultlanguageprofile
     */
    SetDefaultLanguageProfile(langid, rclsid, guidProfiles) {
        result := ComCall(9, this, "ushort", langid, "ptr", rclsid, "ptr", guidProfiles, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} guidProfiles 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-activatelanguageprofile
     */
    ActivateLanguageProfile(rclsid, langid, guidProfiles) {
        result := ComCall(10, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfiles, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Integer>} plangid 
     * @param {Pointer<Guid>} pguidProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-getactivelanguageprofile
     */
    GetActiveLanguageProfile(rclsid, plangid, pguidProfile) {
        plangidMarshal := plangid is VarRef ? "ushort*" : "ptr"

        result := ComCall(11, this, "ptr", rclsid, plangidMarshal, plangid, "ptr", pguidProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} guidProfile 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-getlanguageprofiledescription
     */
    GetLanguageProfileDescription(rclsid, langid, guidProfile) {
        pbstrProfile := BSTR()
        result := ComCall(12, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfile, "ptr", pbstrProfile, "HRESULT")
        return pbstrProfile
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-getcurrentlanguage
     */
    GetCurrentLanguage() {
        result := ComCall(13, this, "ushort*", &plangid := 0, "HRESULT")
        return plangid
    }

    /**
     * 
     * @param {Integer} langid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-changecurrentlanguage
     */
    ChangeCurrentLanguage(langid) {
        result := ComCall(14, this, "ushort", langid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppLangId 
     * @param {Pointer<Integer>} pulCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-getlanguagelist
     */
    GetLanguageList(ppLangId, pulCount) {
        ppLangIdMarshal := ppLangId is VarRef ? "ptr*" : "ptr"
        pulCountMarshal := pulCount is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, ppLangIdMarshal, ppLangId, pulCountMarshal, pulCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} langid 
     * @returns {IEnumTfLanguageProfiles} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-enumlanguageprofiles
     */
    EnumLanguageProfiles(langid) {
        result := ComCall(16, this, "ushort", langid, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfLanguageProfiles(ppEnum)
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} guidProfile 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-enablelanguageprofile
     */
    EnableLanguageProfile(rclsid, langid, guidProfile, fEnable) {
        result := ComCall(17, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfile, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} guidProfile 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-isenabledlanguageprofile
     */
    IsEnabledLanguageProfile(rclsid, langid, guidProfile) {
        result := ComCall(18, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfile, "int*", &pfEnable := 0, "HRESULT")
        return pfEnable
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} guidProfile 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-enablelanguageprofilebydefault
     */
    EnableLanguageProfileByDefault(rclsid, langid, guidProfile, fEnable) {
        result := ComCall(19, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfile, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} guidProfile 
     * @param {HKL} hKL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofiles-substitutekeyboardlayout
     */
    SubstituteKeyboardLayout(rclsid, langid, guidProfile, hKL) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL

        result := ComCall(20, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfile, "ptr", hKL, "HRESULT")
        return result
    }
}
