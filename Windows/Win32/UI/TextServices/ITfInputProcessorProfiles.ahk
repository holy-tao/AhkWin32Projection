#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Guid>} rclsid 
     * @returns {HRESULT} 
     */
    Register(rclsid) {
        result := ComCall(3, this, "ptr", rclsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @returns {HRESULT} 
     */
    Unregister(rclsid) {
        result := ComCall(4, this, "ptr", rclsid, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    AddLanguageProfile(rclsid, langid, guidProfile, pchDesc, cchDesc, pchIconFile, cchFile, uIconIndex) {
        pchDesc := pchDesc is String ? StrPtr(pchDesc) : pchDesc
        pchIconFile := pchIconFile is String ? StrPtr(pchIconFile) : pchIconFile

        result := ComCall(5, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfile, "ptr", pchDesc, "uint", cchDesc, "ptr", pchIconFile, "uint", cchFile, "uint", uIconIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} guidProfile 
     * @returns {HRESULT} 
     */
    RemoveLanguageProfile(rclsid, langid, guidProfile) {
        result := ComCall(6, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumGUID>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumInputProcessorInfo(ppEnum) {
        result := ComCall(7, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} catid 
     * @param {Pointer<Guid>} pclsid 
     * @param {Pointer<Guid>} pguidProfile 
     * @returns {HRESULT} 
     */
    GetDefaultLanguageProfile(langid, catid, pclsid, pguidProfile) {
        result := ComCall(8, this, "ushort", langid, "ptr", catid, "ptr", pclsid, "ptr", pguidProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} guidProfiles 
     * @returns {HRESULT} 
     */
    SetDefaultLanguageProfile(langid, rclsid, guidProfiles) {
        result := ComCall(9, this, "ushort", langid, "ptr", rclsid, "ptr", guidProfiles, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} guidProfiles 
     * @returns {HRESULT} 
     */
    ActivateLanguageProfile(rclsid, langid, guidProfiles) {
        result := ComCall(10, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfiles, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<UInt16>} plangid 
     * @param {Pointer<Guid>} pguidProfile 
     * @returns {HRESULT} 
     */
    GetActiveLanguageProfile(rclsid, plangid, pguidProfile) {
        result := ComCall(11, this, "ptr", rclsid, "ushort*", plangid, "ptr", pguidProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} guidProfile 
     * @param {Pointer<BSTR>} pbstrProfile 
     * @returns {HRESULT} 
     */
    GetLanguageProfileDescription(rclsid, langid, guidProfile, pbstrProfile) {
        result := ComCall(12, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfile, "ptr", pbstrProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} plangid 
     * @returns {HRESULT} 
     */
    GetCurrentLanguage(plangid) {
        result := ComCall(13, this, "ushort*", plangid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} langid 
     * @returns {HRESULT} 
     */
    ChangeCurrentLanguage(langid) {
        result := ComCall(14, this, "ushort", langid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} ppLangId 
     * @param {Pointer<UInt32>} pulCount 
     * @returns {HRESULT} 
     */
    GetLanguageList(ppLangId, pulCount) {
        result := ComCall(15, this, "ushort*", ppLangId, "uint*", pulCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} langid 
     * @param {Pointer<IEnumTfLanguageProfiles>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumLanguageProfiles(langid, ppEnum) {
        result := ComCall(16, this, "ushort", langid, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} guidProfile 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    EnableLanguageProfile(rclsid, langid, guidProfile, fEnable) {
        result := ComCall(17, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfile, "int", fEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} guidProfile 
     * @param {Pointer<BOOL>} pfEnable 
     * @returns {HRESULT} 
     */
    IsEnabledLanguageProfile(rclsid, langid, guidProfile, pfEnable) {
        result := ComCall(18, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfile, "ptr", pfEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} guidProfile 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    EnableLanguageProfileByDefault(rclsid, langid, guidProfile, fEnable) {
        result := ComCall(19, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfile, "int", fEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} guidProfile 
     * @param {HKL} hKL 
     * @returns {HRESULT} 
     */
    SubstituteKeyboardLayout(rclsid, langid, guidProfile, hKL) {
        hKL := hKL is Win32Handle ? NumGet(hKL, "ptr") : hKL

        result := ComCall(20, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfile, "ptr", hKL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
