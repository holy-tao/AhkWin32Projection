#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Configures the audio session that is associated with the streaming audio renderer (SAR).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfaudiopolicy
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFAudioPolicy extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFAudioPolicy
     * @type {Guid}
     */
    static IID => Guid("{a0638c2b-6465-4395-9ae7-a321a9fd2856}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetGroupingParam", "GetGroupingParam", "SetDisplayName", "GetDisplayName", "SetIconPath", "GetIconPath"]

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
        result := ComCall(3, this, "ptr", rguidClass, "HRESULT")
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
        result := ComCall(4, this, "ptr", pguidClass, "HRESULT")
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
        result := ComCall(6, this, "ptr*", &pszName := 0, "HRESULT")
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
        result := ComCall(8, this, "ptr*", &pszPath := 0, "HRESULT")
        return pszPath
    }
}
