#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Configures the audio session that is associated with the streaming audio renderer (SAR).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfaudiopolicy
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFAudioPolicy extends IUnknown {
    /**
     * The interface identifier for IMFAudioPolicy
     * @type {Guid}
     */
    static IID := Guid("{a0638c2b-6465-4395-9ae7-a321a9fd2856}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFAudioPolicy interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetGroupingParam : IntPtr
        GetGroupingParam : IntPtr
        SetDisplayName   : IntPtr
        GetDisplayName   : IntPtr
        SetIconPath      : IntPtr
        GetIconPath      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFAudioPolicy.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Assigns the audio session to a group of sessions.
     * @remarks
     * If two or more audio sessions share the same group, the Windows volume control displays one slider control for the entire group. Otherwise, it displays a slider for each session. For more information, see <b>IAudioSessionControl::SetGroupingParam</b> in the core audio API documentation.
     * @param {Pointer<Guid>} rguidClass A <b>GUID</b> that identifies the session group. Groups are application-defined. To create a new session group, assign a new GUID.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfaudiopolicy-setgroupingparam
     */
    SetGroupingParam(rguidClass) {
        result := ComCall(3, this, Guid.Ptr, rguidClass, "HRESULT")
        return result
    }

    /**
     * Retrieves the group of sessions to which this audio session belongs.
     * @remarks
     * If two or more audio sessions share the same group, the Windows volume control displays one slider control for the entire group. Otherwise, it displays a slider for each session. For more information, see <b>IAudioSessionControl::SetGroupingParam</b> in the core audio API documentation.
     * @returns {Guid} Receives a GUID that identifies the session group.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfaudiopolicy-getgroupingparam
     */
    GetGroupingParam() {
        pguidClass := Guid()
        result := ComCall(4, this, Guid.Ptr, pguidClass, "HRESULT")
        return pguidClass
    }

    /**
     * Sets the display name of the audio session. The Windows volume control displays this name.
     * @remarks
     * If the application does not set a display name, Windows creates one.
     * @param {PWSTR} pszName A null-terminated wide-character string that contains the display name.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfaudiopolicy-setdisplayname
     */
    SetDisplayName(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * Retrieves the display name of the audio session. The Windows volume control displays this name.
     * @remarks
     * If the application does not set a display name, Windows creates one.
     * @returns {PWSTR} Receives a pointer to the display name string. The caller must free the memory allocated for the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfaudiopolicy-getdisplayname
     */
    GetDisplayName() {
        result := ComCall(6, this, PWSTR.Ptr, &pszName := 0, "HRESULT")
        return pszName
    }

    /**
     * Sets the icon resource for the audio session. The Windows volume control displays this icon.
     * @remarks
     * The icon path has the format "path,index" or "path,-id", where <i>path</i> is the fully qualified path to a DLL, executable file, or icon file; <i>index</i> is the zero-based index of the icon within the file; and <i>id</i> is a resource identifier. Note that resource identifiers are preceded by a minus sign (-) to distinguish them from indexes. The path can contain environment variables, such as "%windir%". For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-seticonpath">IAudioSessionControl::SetIconPath</a> in the Windows SDK.
     * @param {PWSTR} pszPath A wide-character string that specifies the icon. See Remarks.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfaudiopolicy-seticonpath
     */
    SetIconPath(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(7, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * Retrieves the icon resource for the audio session. The Windows volume control displays this icon.
     * @remarks
     * If the application did not set an icon path, the method returns an empty string ("").
     * 
     * For more information, see <b>IAudioSessionControl::GetIconPath</b> in the core audio API documentation.
     * @returns {PWSTR} Receives a pointer to a wide-character string that specifies a shell resource. The format of the string is described in the topic <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfaudiopolicy-seticonpath">IMFAudioPolicy::SetIconPath</a>. The caller must free the memory allocated for the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfaudiopolicy-geticonpath
     */
    GetIconPath() {
        result := ComCall(8, this, PWSTR.Ptr, &pszPath := 0, "HRESULT")
        return pszPath
    }

    Query(iid) {
        if (IMFAudioPolicy.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetGroupingParam := CallbackCreate(GetMethod(implObj, "SetGroupingParam"), flags, 2)
        this.vtbl.GetGroupingParam := CallbackCreate(GetMethod(implObj, "GetGroupingParam"), flags, 2)
        this.vtbl.SetDisplayName := CallbackCreate(GetMethod(implObj, "SetDisplayName"), flags, 2)
        this.vtbl.GetDisplayName := CallbackCreate(GetMethod(implObj, "GetDisplayName"), flags, 2)
        this.vtbl.SetIconPath := CallbackCreate(GetMethod(implObj, "SetIconPath"), flags, 2)
        this.vtbl.GetIconPath := CallbackCreate(GetMethod(implObj, "GetIconPath"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetGroupingParam)
        CallbackFree(this.vtbl.GetGroupingParam)
        CallbackFree(this.vtbl.SetDisplayName)
        CallbackFree(this.vtbl.GetDisplayName)
        CallbackFree(this.vtbl.SetIconPath)
        CallbackFree(this.vtbl.GetIconPath)
    }
}
