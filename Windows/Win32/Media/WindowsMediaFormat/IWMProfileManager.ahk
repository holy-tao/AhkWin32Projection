#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMProfile.ahk
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
     * The CreateEmptyProfile method creates an empty profile object. You can use the interfaces of the profile object to configure the profile. When you are done configuring the profile, you can save it to a string using IWMProfileManager::SaveProfile.
     * @param {Integer} dwVersion <b>DWORD</b> containing one member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_version">WMT_VERSION</a> enumeration type.
     * @returns {IWMProfile} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wmformat/iwmprofile">IWMProfile</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmprofilemanager-createemptyprofile
     */
    CreateEmptyProfile(dwVersion) {
        result := ComCall(3, this, "int", dwVersion, "ptr*", &ppProfile := 0, "HRESULT")
        return IWMProfile(ppProfile)
    }

    /**
     * The LoadProfileByID method loads a system profile identified by its globally unique identifier. To load a custom profile, use IWMProfileManager::LoadProfileByData.
     * @param {Pointer<Guid>} guidProfile <b>GUID</b> identifying the profile. For more information, see the table of defined constants in <a href="https://docs.microsoft.com/windows/desktop/wmformat/using-system-profiles">Using System Profiles</a>.
     * @returns {IWMProfile} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wmformat/iwmprofile">IWMProfile</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmprofilemanager-loadprofilebyid
     */
    LoadProfileByID(guidProfile) {
        result := ComCall(4, this, "ptr", guidProfile, "ptr*", &ppProfile := 0, "HRESULT")
        return IWMProfile(ppProfile)
    }

    /**
     * The LoadProfileByData method creates a profile object and populates it with data from a stored string. You must use this method to manipulate custom profiles. System profiles should be accessed using either LoadProfileByID or LoadSystemProfile.
     * @param {PWSTR} pwszProfile Pointer to a wide-character <b>null</b>-terminated string containing the profile. Profile strings are limited to 153600 wide characters.
     * @returns {IWMProfile} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wmformat/iwmprofile">IWMProfile</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmprofilemanager-loadprofilebydata
     */
    LoadProfileByData(pwszProfile) {
        pwszProfile := pwszProfile is String ? StrPtr(pwszProfile) : pwszProfile

        result := ComCall(5, this, "ptr", pwszProfile, "ptr*", &ppProfile := 0, "HRESULT")
        return IWMProfile(ppProfile)
    }

    /**
     * The SaveProfile method saves a profile into an XML-formatted string.
     * @param {IWMProfile} pIWMProfile Pointer to the <a href="https://docs.microsoft.com/windows/desktop/wmformat/iwmprofile">IWMProfile</a> interface of the object containing the profile data to be saved.
     * @param {PWSTR} pwszProfile Pointer to a wide-character <b>null</b>-terminated string containing the profile. Set this to <b>NULL</b> to retrieve the length of string required.
     * @param {Pointer<Integer>} pdwLength On input, specifies the length of the <i>pwszProfile</i> string. On output, if the method succeeds, specifies a pointer to a <b>DWORD</b> containing the number of characters, including the terminating <b>null</b> character, required to hold the profile.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
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
     * There is not enough available memory.
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
     * Either the <i>pIWMProfile</i> or <i>pdwLength</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmprofilemanager-saveprofile
     */
    SaveProfile(pIWMProfile, pwszProfile, pdwLength) {
        pwszProfile := pwszProfile is String ? StrPtr(pwszProfile) : pwszProfile

        pdwLengthMarshal := pdwLength is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pIWMProfile, "ptr", pwszProfile, pdwLengthMarshal, pdwLength, "HRESULT")
        return result
    }

    /**
     * The GetSystemProfileCount method retrieves the number of system profiles.
     * @returns {Integer} Pointer to a count of the system profiles.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmprofilemanager-getsystemprofilecount
     */
    GetSystemProfileCount() {
        result := ComCall(7, this, "uint*", &pcProfiles := 0, "HRESULT")
        return pcProfiles
    }

    /**
     * The LoadSystemProfile method loads a system profile identified by its index. If you do not know the index of the desired system profile, you must use IWMProfileManager::LoadProfileByID. To load a custom profile, use IWMProfileManager::LoadProfileByData.
     * @param {Integer} dwProfileIndex <b>DWORD</b> containing the profile index.
     * @returns {IWMProfile} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wmformat/iwmprofile">IWMProfile</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmprofilemanager-loadsystemprofile
     */
    LoadSystemProfile(dwProfileIndex) {
        result := ComCall(8, this, "uint", dwProfileIndex, "ptr*", &ppProfile := 0, "HRESULT")
        return IWMProfile(ppProfile)
    }
}
