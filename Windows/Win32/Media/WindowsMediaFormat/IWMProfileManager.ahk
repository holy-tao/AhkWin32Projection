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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateEmptyProfile", "LoadProfileByID", "LoadProfileByData", "SaveProfile", "GetSystemProfileCount", "LoadSystemProfile"]

    /**
     * 
     * @param {Integer} dwVersion 
     * @param {Pointer<IWMProfile>} ppProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanager-createemptyprofile
     */
    CreateEmptyProfile(dwVersion, ppProfile) {
        result := ComCall(3, this, "int", dwVersion, "ptr*", ppProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidProfile 
     * @param {Pointer<IWMProfile>} ppProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanager-loadprofilebyid
     */
    LoadProfileByID(guidProfile, ppProfile) {
        result := ComCall(4, this, "ptr", guidProfile, "ptr*", ppProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProfile 
     * @param {Pointer<IWMProfile>} ppProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanager-loadprofilebydata
     */
    LoadProfileByData(pwszProfile, ppProfile) {
        pwszProfile := pwszProfile is String ? StrPtr(pwszProfile) : pwszProfile

        result := ComCall(5, this, "ptr", pwszProfile, "ptr*", ppProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMProfile} pIWMProfile 
     * @param {PWSTR} pwszProfile 
     * @param {Pointer<Integer>} pdwLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanager-saveprofile
     */
    SaveProfile(pIWMProfile, pwszProfile, pdwLength) {
        pwszProfile := pwszProfile is String ? StrPtr(pwszProfile) : pwszProfile

        result := ComCall(6, this, "ptr", pIWMProfile, "ptr", pwszProfile, "uint*", pdwLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcProfiles 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanager-getsystemprofilecount
     */
    GetSystemProfileCount(pcProfiles) {
        result := ComCall(7, this, "uint*", pcProfiles, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwProfileIndex 
     * @param {Pointer<IWMProfile>} ppProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanager-loadsystemprofile
     */
    LoadSystemProfile(dwProfileIndex, ppProfile) {
        result := ComCall(8, this, "uint", dwProfileIndex, "ptr*", ppProfile, "HRESULT")
        return result
    }
}
