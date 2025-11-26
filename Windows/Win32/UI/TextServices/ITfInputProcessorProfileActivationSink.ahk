#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfInputProcessorProfileActivationSink interface is implemented by an application to receive notifications when the profile changes.
 * @remarks
 * 
 * To install this advise sink, obtain an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfsource">ITfSource</a> object from an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfthreadmgr">ITfThreadMgr</a> object by calling <b>ITfThreadMgr::QueryInterface</b> with <b>IID_ ITfSource</b>. Then call <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfsource-advisesink">ITfSource::AdviseSink</a> with <b>IID_ITfInputProcessorProfileActivationSink</b>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfinputprocessorprofileactivationsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfInputProcessorProfileActivationSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfInputProcessorProfileActivationSink
     * @type {Guid}
     */
    static IID => Guid("{71c6e74e-0f28-11d8-a82a-00065b84435c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnActivated"]

    /**
     * The ITfInputProcessorProfileActivationSink::OnActivated method is a callback that is called when an input processor profile is activated or deactivated.
     * @param {Integer} dwProfileType [in] The type of this profile. This is one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_PROFILETYPE_INPUTPROCESSOR"></a><a id="tf_profiletype_inputprocessor"></a><dl>
     * <dt><b>TF_PROFILETYPE_INPUTPROCESSOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This is a text service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_PROFILETYPE_KEYBOARDLAYOUT"></a><a id="tf_profiletype_keyboardlayout"></a><dl>
     * <dt><b>TF_PROFILETYPE_KEYBOARDLAYOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This is a keyboard layout.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} langid [in] Specifies the language id of the profile.
     * @param {Pointer<Guid>} clsid [in] Specifies the CLSID of the text service. If <i>dwProfileType</i> is TF_PROFILETYPE_KEYBOARDLAYOUT, this is CLSID_NULL.
     * @param {Pointer<Guid>} catid [in] Specifies the category of this text service. This category is GUID_TFCAT_TIP_KEYBOARD, GUID_TFCAT_TIP_SPEECH, GUID_TFCAT_TIP_HANDWRITING or something in GUID_TFCAT_CATEGORY_OF_TIP. If <i>dwProfileType</i> is TF_PROFILETYPE_KEYBOARDLAYOUT, this is GUID_NULL.
     * @param {Pointer<Guid>} guidProfile [in] Specifies the GUID to identify the profile. If <i>dwProfileType</i> is TF_PROFILETYPE_KEYBOARDLAYOUT, this is GUID_NULL.
     * @param {HKL} hkl [in] Specifies the keyboard layout handle of this profile. If <i>dwProfileType</i> is TF_PROFILETYPE_ INPUTPROCESSOR, this is <b>NULL</b>.
     * @param {Integer} dwFlags [in]
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_IPSINK_FLAG_ACTIVE"></a><a id="tf_ipsink_flag_active"></a><dl>
     * <dt><b>TF_IPSINK_FLAG_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This is on if this profile is activated.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The TSF manager ignores the return value of this method.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfinputprocessorprofileactivationsink-onactivated
     */
    OnActivated(dwProfileType, langid, clsid, catid, guidProfile, hkl, dwFlags) {
        hkl := hkl is Win32Handle ? NumGet(hkl, "ptr") : hkl

        result := ComCall(3, this, "uint", dwProfileType, "ushort", langid, "ptr", clsid, "ptr", catid, "ptr", guidProfile, "ptr", hkl, "uint", dwFlags, "HRESULT")
        return result
    }
}
