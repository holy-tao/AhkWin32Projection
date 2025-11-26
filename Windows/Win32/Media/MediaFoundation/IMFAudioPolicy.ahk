#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Configures the audio session that is associated with the streaming audio renderer (SAR).
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfaudiopolicy
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfaudiopolicy-setgroupingparam
     */
    SetGroupingParam(rguidClass) {
        result := ComCall(3, this, "ptr", rguidClass, "HRESULT")
        return result
    }

    /**
     * Retrieves the group of sessions to which this audio session belongs.
     * @returns {Guid} Receives a GUID that identifies the session group.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfaudiopolicy-getgroupingparam
     */
    GetGroupingParam() {
        pguidClass := Guid()
        result := ComCall(4, this, "ptr", pguidClass, "HRESULT")
        return pguidClass
    }

    /**
     * Sets the display name of the audio session. The Windows volume control displays this name.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfaudiopolicy-setdisplayname
     */
    SetDisplayName(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * Retrieves the display name of the audio session. The Windows volume control displays this name.
     * @returns {PWSTR} Receives a pointer to the display name string. The caller must free the memory allocated for the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfaudiopolicy-getdisplayname
     */
    GetDisplayName() {
        result := ComCall(6, this, "ptr*", &pszName := 0, "HRESULT")
        return pszName
    }

    /**
     * Sets the icon resource for the audio session. The Windows volume control displays this icon.
     * @param {PWSTR} pszPath A wide-character string that specifies the icon. See Remarks.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfaudiopolicy-seticonpath
     */
    SetIconPath(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(7, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * Retrieves the icon resource for the audio session. The Windows volume control displays this icon.
     * @returns {PWSTR} Receives a pointer to a wide-character string that specifies a shell resource. The format of the string is described in the topic <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfaudiopolicy-seticonpath">IMFAudioPolicy::SetIconPath</a>. The caller must free the memory allocated for the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfaudiopolicy-geticonpath
     */
    GetIconPath() {
        result := ComCall(8, this, "ptr*", &pszPath := 0, "HRESULT")
        return pszPath
    }
}
