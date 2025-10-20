#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMProfileManager interface is used to create profiles, load existing profiles, and save profiles.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmprofilemanager
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMProfileManager extends IUnknown{
    /**
     * The interface identifier for IWMProfileManager
     * @type {Guid}
     */
    static IID => Guid("{d16679f2-6ca0-472d-8d31-2f5d55aee155}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwVersion 
     * @param {Pointer<IWMProfile>} ppProfile 
     * @returns {HRESULT} 
     */
    CreateEmptyProfile(dwVersion, ppProfile) {
        result := ComCall(3, this, "int", dwVersion, "ptr", ppProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidProfile 
     * @param {Pointer<IWMProfile>} ppProfile 
     * @returns {HRESULT} 
     */
    LoadProfileByID(guidProfile, ppProfile) {
        result := ComCall(4, this, "ptr", guidProfile, "ptr", ppProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProfile 
     * @param {Pointer<IWMProfile>} ppProfile 
     * @returns {HRESULT} 
     */
    LoadProfileByData(pwszProfile, ppProfile) {
        pwszProfile := pwszProfile is String ? StrPtr(pwszProfile) : pwszProfile

        result := ComCall(5, this, "ptr", pwszProfile, "ptr", ppProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMProfile>} pIWMProfile 
     * @param {PWSTR} pwszProfile 
     * @param {Pointer<UInt32>} pdwLength 
     * @returns {HRESULT} 
     */
    SaveProfile(pIWMProfile, pwszProfile, pdwLength) {
        pwszProfile := pwszProfile is String ? StrPtr(pwszProfile) : pwszProfile

        result := ComCall(6, this, "ptr", pIWMProfile, "ptr", pwszProfile, "uint*", pdwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcProfiles 
     * @returns {HRESULT} 
     */
    GetSystemProfileCount(pcProfiles) {
        result := ComCall(7, this, "uint*", pcProfiles, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwProfileIndex 
     * @param {Pointer<IWMProfile>} ppProfile 
     * @returns {HRESULT} 
     */
    LoadSystemProfile(dwProfileIndex, ppProfile) {
        result := ComCall(8, this, "uint", dwProfileIndex, "ptr", ppProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
