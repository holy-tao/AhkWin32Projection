#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumTfInputProcessorProfiles.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumTfInputProcessorProfiles interface is implemented by TSF manager and used by applications or textservices. This interface can be retrieved by ITfInputProcessorProfileMgr::EnumProfiles and enumerates the registered profiles.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-ienumtfinputprocessorprofiles
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IEnumTfInputProcessorProfiles extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumTfInputProcessorProfiles
     * @type {Guid}
     */
    static IID => Guid("{71c6e74d-0f28-11d8-a82a-00065b84435c}")

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
     * The IEnumTfInputProcessorProfiles::Clone method creates a copy of the enumerator object.
     * @returns {IEnumTfInputProcessorProfiles} [out] A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumtfinputprocessorprofiles">IEnumTfInputProcessorProfiles</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-ienumtfinputprocessorprofiles-clone
     */
    Clone() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfInputProcessorProfiles(ppEnum)
    }

    /**
     * The IEnumTfInputProcessorProfiles::Next method obtains, from the current position, the specified number of elements in the enumeration sequence.
     * @param {Integer} ulCount [in] Specifies the number of elements to obtain.
     * @param {Pointer<TF_INPUTPROCESSORPROFILE>} pProfile [out] Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_inputprocessorprofile">TF_INPUTPROCESSORPROFILE</a> structures. This array must be at least <i>ulCount</i> elements in size.
     * @param {Pointer<Integer>} pcFetch [out] Pointer to a ULONG value that receives the number of elements actually obtained. This value can be less than the number of items requested. This parameter can be <b>NULL</b>.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
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
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-ienumtfinputprocessorprofiles-next
     */
    Next(ulCount, pProfile, pcFetch) {
        pcFetchMarshal := pcFetch is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", ulCount, "ptr", pProfile, pcFetchMarshal, pcFetch, "HRESULT")
        return result
    }

    /**
     * The IEnumTfInputProcessorProfiles::Reset method resets the enumerator object by moving the current position to the beginning of the enumeration sequence.
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
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-ienumtfinputprocessorprofiles-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The IEnumTfInputProcessorProfiles::Skip method moves the current position forward in the enumeration sequence by the specified number of elements.
     * @param {Integer} ulCount [in] Contains the number of elements to skip.
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
     * <dt><b>E_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method reached the end of the enumeration before the specified number of elements could be skipped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-ienumtfinputprocessorprofiles-skip
     */
    Skip(ulCount) {
        result := ComCall(6, this, "uint", ulCount, "HRESULT")
        return result
    }
}
