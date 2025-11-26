#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumTfLanguageProfiles.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumTfLanguageProfiles interface is implemented by the TSF manager to provide an enumeration of language profiles.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-ienumtflanguageprofiles
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IEnumTfLanguageProfiles extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumTfLanguageProfiles
     * @type {Guid}
     */
    static IID => Guid("{3d61bf11-ac5f-42c8-a4cb-931bcc28c744}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Clone", "Next", "Reset", "Skip"]

    /**
     * IEnumTfLanguageProfiles::Clone method
     * @returns {IEnumTfLanguageProfiles} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumtflanguageprofiles">IEnumTfLanguageProfiles</a> interface pointer that receives the new enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-ienumtflanguageprofiles-clone
     */
    Clone() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfLanguageProfiles(ppEnum)
    }

    /**
     * IEnumTfLanguageProfiles::Next method
     * @param {Integer} ulCount Specifies the number of elements to obtain.
     * @param {Pointer<TF_LANGUAGEPROFILE>} pProfile Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_languageprofile">TF_LANGUAGEPROFILE</a> structures that receives the requested data. This array must be at least <i>ulCount</i> elements in size.
     * @param {Pointer<Integer>} pcFetch Pointer to a ULONG value that receives the number of elements obtained. This value can be less than the number of items requested. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method reached the end of the enumeration before the specified number of elements could be obtained.
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
     * <i>pProfile</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-ienumtflanguageprofiles-next
     */
    Next(ulCount, pProfile, pcFetch) {
        pcFetchMarshal := pcFetch is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", ulCount, "ptr", pProfile, pcFetchMarshal, pcFetch, "HRESULT")
        return result
    }

    /**
     * IEnumTfLanguageProfiles::Reset method
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-ienumtflanguageprofiles-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * IEnumTfLanguageProfiles::Skip method
     * @param {Integer} ulCount Contains the number of elements to skip.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method reached the end of the enumeration before the specified number of elements could be skipped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-ienumtflanguageprofiles-skip
     */
    Skip(ulCount) {
        result := ComCall(6, this, "uint", ulCount, "HRESULT")
        return result
    }
}
