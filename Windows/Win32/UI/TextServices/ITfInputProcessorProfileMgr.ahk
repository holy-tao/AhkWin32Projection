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
     * 
     * @param {Integer} dwProfileType 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} clsid 
     * @param {Pointer<Guid>} guidProfile 
     * @param {HKL} hkl 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofilemgr-activateprofile
     */
    ActivateProfile(dwProfileType, langid, clsid, guidProfile, hkl, dwFlags) {
        hkl := hkl is Win32Handle ? NumGet(hkl, "ptr") : hkl

        result := ComCall(3, this, "uint", dwProfileType, "ushort", langid, "ptr", clsid, "ptr", guidProfile, "ptr", hkl, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwProfileType 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} clsid 
     * @param {Pointer<Guid>} guidProfile 
     * @param {HKL} hkl 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofilemgr-deactivateprofile
     */
    DeactivateProfile(dwProfileType, langid, clsid, guidProfile, hkl, dwFlags) {
        hkl := hkl is Win32Handle ? NumGet(hkl, "ptr") : hkl

        result := ComCall(4, this, "uint", dwProfileType, "ushort", langid, "ptr", clsid, "ptr", guidProfile, "ptr", hkl, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwProfileType 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} clsid 
     * @param {Pointer<Guid>} guidProfile 
     * @param {HKL} hkl 
     * @returns {TF_INPUTPROCESSORPROFILE} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofilemgr-getprofile
     */
    GetProfile(dwProfileType, langid, clsid, guidProfile, hkl) {
        hkl := hkl is Win32Handle ? NumGet(hkl, "ptr") : hkl

        pProfile := TF_INPUTPROCESSORPROFILE()
        result := ComCall(5, this, "uint", dwProfileType, "ushort", langid, "ptr", clsid, "ptr", guidProfile, "ptr", hkl, "ptr", pProfile, "HRESULT")
        return pProfile
    }

    /**
     * 
     * @param {Integer} langid 
     * @returns {IEnumTfInputProcessorProfiles} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofilemgr-enumprofiles
     */
    EnumProfiles(langid) {
        result := ComCall(6, this, "ushort", langid, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfInputProcessorProfiles(ppEnum)
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofilemgr-releaseinputprocessor
     */
    ReleaseInputProcessor(rclsid, dwFlags) {
        result := ComCall(7, this, "ptr", rclsid, "uint", dwFlags, "HRESULT")
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
     * @param {HKL} hklsubstitute 
     * @param {Integer} dwPreferredLayout 
     * @param {BOOL} bEnabledByDefault 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofilemgr-registerprofile
     */
    RegisterProfile(rclsid, langid, guidProfile, pchDesc, cchDesc, pchIconFile, cchFile, uIconIndex, hklsubstitute, dwPreferredLayout, bEnabledByDefault, dwFlags) {
        pchDesc := pchDesc is String ? StrPtr(pchDesc) : pchDesc
        pchIconFile := pchIconFile is String ? StrPtr(pchIconFile) : pchIconFile
        hklsubstitute := hklsubstitute is Win32Handle ? NumGet(hklsubstitute, "ptr") : hklsubstitute

        result := ComCall(8, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfile, "ptr", pchDesc, "uint", cchDesc, "ptr", pchIconFile, "uint", cchFile, "uint", uIconIndex, "ptr", hklsubstitute, "uint", dwPreferredLayout, "int", bEnabledByDefault, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} guidProfile 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofilemgr-unregisterprofile
     */
    UnregisterProfile(rclsid, langid, guidProfile, dwFlags) {
        result := ComCall(9, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfile, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} catid 
     * @returns {TF_INPUTPROCESSORPROFILE} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofilemgr-getactiveprofile
     */
    GetActiveProfile(catid) {
        pProfile := TF_INPUTPROCESSORPROFILE()
        result := ComCall(10, this, "ptr", catid, "ptr", pProfile, "HRESULT")
        return pProfile
    }
}
