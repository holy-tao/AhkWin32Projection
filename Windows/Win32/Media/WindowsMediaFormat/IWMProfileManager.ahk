#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WMT_VERSION.ahk" { WMT_VERSION }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IWMProfile.ahk" { IWMProfile }

/**
 * The IWMProfileManager interface is used to create profiles, load existing profiles, and save profiles.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmprofilemanager
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMProfileManager extends IUnknown {
    /**
     * The interface identifier for IWMProfileManager
     * @type {Guid}
     */
    static IID := Guid("{d16679f2-6ca0-472d-8d31-2f5d55aee155}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMProfileManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateEmptyProfile    : IntPtr
        LoadProfileByID       : IntPtr
        LoadProfileByData     : IntPtr
        SaveProfile           : IntPtr
        GetSystemProfileCount : IntPtr
        LoadSystemProfile     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMProfileManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The CreateEmptyProfile method creates an empty profile object. You can use the interfaces of the profile object to configure the profile. When you are done configuring the profile, you can save it to a string using IWMProfileManager::SaveProfile.
     * @remarks
     * Use this method to create any profile that uses the Windows Media® Audio and Video 9 Series codecs. For more information, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/reusing-stream-configurations">Reusing Stream Configurations</a>.
     * @param {WMT_VERSION} dwVersion <b>DWORD</b> containing one member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_version">WMT_VERSION</a> enumeration type.
     * @returns {IWMProfile} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wmformat/iwmprofile">IWMProfile</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanager-createemptyprofile
     */
    CreateEmptyProfile(dwVersion) {
        result := ComCall(3, this, WMT_VERSION, dwVersion, "ptr*", &ppProfile := 0, "HRESULT")
        return IWMProfile(ppProfile)
    }

    /**
     * The LoadProfileByID method loads a system profile identified by its globally unique identifier. To load a custom profile, use IWMProfileManager::LoadProfileByData.
     * @remarks
     * Only system profiles have IDs. Because there are no system profiles for the Windows Media 9 Series codecs, this method is primarily useful for obtaining version 8 system profiles that you will convert to custom profiles using the Windows Media 9 Series codecs. For more information, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/reusing-stream-configurations">Reusing Stream Configurations</a>.
     * @param {Pointer<Guid>} guidProfile <b>GUID</b> identifying the profile. For more information, see the table of defined constants in <a href="https://docs.microsoft.com/windows/desktop/wmformat/using-system-profiles">Using System Profiles</a>.
     * @returns {IWMProfile} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wmformat/iwmprofile">IWMProfile</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanager-loadprofilebyid
     */
    LoadProfileByID(guidProfile) {
        result := ComCall(4, this, Guid.Ptr, guidProfile, "ptr*", &ppProfile := 0, "HRESULT")
        return IWMProfile(ppProfile)
    }

    /**
     * The LoadProfileByData method creates a profile object and populates it with data from a stored string. You must use this method to manipulate custom profiles. System profiles should be accessed using either LoadProfileByID or LoadSystemProfile.
     * @remarks
     * This string must match an XML-formatted string created by <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanager-saveprofile">IWMProfileManager::SaveProfile</a>. By convention, when such strings are saved to disk they are given the ".prx" extension.
     * @param {PWSTR} pwszProfile Pointer to a wide-character <b>null</b>-terminated string containing the profile. Profile strings are limited to 153600 wide characters.
     * @returns {IWMProfile} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wmformat/iwmprofile">IWMProfile</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanager-loadprofilebydata
     */
    LoadProfileByData(pwszProfile) {
        pwszProfile := pwszProfile is String ? StrPtr(pwszProfile) : pwszProfile

        result := ComCall(5, this, "ptr", pwszProfile, "ptr*", &ppProfile := 0, "HRESULT")
        return IWMProfile(ppProfile)
    }

    /**
     * The SaveProfile method saves a profile into an XML-formatted string.
     * @remarks
     * You should make two calls to <b>SaveProfile</b>. On the first call, pass <b>NULL</b> as <i>pwszProfile</i>. On return, the value of <i>pdwLength</i> is set to the length required to hold the profile in string form. Then you can allocate the required amount of memory for the buffer and pass a pointer to it as <i>pwszProfile</i> on the second call.
     * 
     * This string contains all the profile information. It must not be displayed to users, and should not be altered. To change the settings in a saved profile, load it using the profile manager and change the settings using the profile object and related objects.
     * 
     * To save a custom profile for later use, you must save the content of the returned string in a .prx file. For more information on .prx files, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/profiles">Profiles</a>.
     * 
     * To load a saved custom profile, copy the contents of the profile from the .prx file to a string and use <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanager-loadprofilebydata">IWMProfileManager::LoadProfileByData</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanager-saveprofile
     */
    SaveProfile(pIWMProfile, pwszProfile, pdwLength) {
        pwszProfile := pwszProfile is String ? StrPtr(pwszProfile) : pwszProfile

        pdwLengthMarshal := pdwLength is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pIWMProfile, "ptr", pwszProfile, pdwLengthMarshal, pdwLength, "HRESULT")
        return result
    }

    /**
     * The GetSystemProfileCount method retrieves the number of system profiles.
     * @remarks
     * Because there are no system profiles for the Windows Media 9 Series codecs, this method is primarily useful for obtaining version 8 system profiles that you will convert to custom profiles using the Windows Media 9 Series codecs. For more information, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/reusing-stream-configurations">Reusing Stream Configurations</a>.
     * 
     * This method can be used with <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanager-loadsystemprofile">LoadSystemProfile</a> to iterate through the system profiles.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanager2-setsystemprofileversion">IWMProfileManager2::SetSystemProfileVersion</a> method determines which system files are enumerated. Most applications should set the version to WMT_VER_8_0. Setting the version to WMT_VER_9_0 will return zero profiles.
     * @returns {Integer} Pointer to a count of the system profiles.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanager-getsystemprofilecount
     */
    GetSystemProfileCount() {
        result := ComCall(7, this, "uint*", &pcProfiles := 0, "HRESULT")
        return pcProfiles
    }

    /**
     * The LoadSystemProfile method loads a system profile identified by its index. If you do not know the index of the desired system profile, you must use IWMProfileManager::LoadProfileByID. To load a custom profile, use IWMProfileManager::LoadProfileByData.
     * @remarks
     * Because there are no system profiles for the Windows Media 9 Series codecs, this method is primarily useful for obtaining version 8 system profiles that you will convert to custom profiles using the Windows Media 9 Series codecs. For more information, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/reusing-stream-configurations">Reusing Stream Configurations</a>.
     * 
     * This method can be used with <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanager-getsystemprofilecount">GetSystemProfileCount</a> to iterate through the system profiles.
     * 
     * Applications must not rely on the index of a profile (used in this call and elsewhere in the SDK) being a constant. Upgrades to the Windows Media Format components can cause these indexes to change. If an application must maintain a fixed profile, it must call <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmprofile2-getprofileid">IWMProfile2::GetProfileID</a> and <b>IWMProfileManager::LoadProfileByID</b>.
     * @param {Integer} dwProfileIndex <b>DWORD</b> containing the profile index.
     * @returns {IWMProfile} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wmformat/iwmprofile">IWMProfile</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanager-loadsystemprofile
     */
    LoadSystemProfile(dwProfileIndex) {
        result := ComCall(8, this, "uint", dwProfileIndex, "ptr*", &ppProfile := 0, "HRESULT")
        return IWMProfile(ppProfile)
    }

    Query(iid) {
        if (IWMProfileManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateEmptyProfile := CallbackCreate(GetMethod(implObj, "CreateEmptyProfile"), flags, 3)
        this.vtbl.LoadProfileByID := CallbackCreate(GetMethod(implObj, "LoadProfileByID"), flags, 3)
        this.vtbl.LoadProfileByData := CallbackCreate(GetMethod(implObj, "LoadProfileByData"), flags, 3)
        this.vtbl.SaveProfile := CallbackCreate(GetMethod(implObj, "SaveProfile"), flags, 4)
        this.vtbl.GetSystemProfileCount := CallbackCreate(GetMethod(implObj, "GetSystemProfileCount"), flags, 2)
        this.vtbl.LoadSystemProfile := CallbackCreate(GetMethod(implObj, "LoadSystemProfile"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateEmptyProfile)
        CallbackFree(this.vtbl.LoadProfileByID)
        CallbackFree(this.vtbl.LoadProfileByData)
        CallbackFree(this.vtbl.SaveProfile)
        CallbackFree(this.vtbl.GetSystemProfileCount)
        CallbackFree(this.vtbl.LoadSystemProfile)
    }
}
