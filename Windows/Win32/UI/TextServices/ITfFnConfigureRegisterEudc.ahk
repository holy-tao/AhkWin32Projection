#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITfFunction.ahk

/**
 * The ITfFnConfigureRegisterEudc interface is implemented by a text service to provide the UI to register the key sequence for the given EUDC.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itffnconfigureregistereudc
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnConfigureRegisterEudc extends ITfFunction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfFnConfigureRegisterEudc
     * @type {Guid}
     */
    static IID => Guid("{b5e26ff5-d7ad-4304-913f-21a2ed95a1b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Show"]

    /**
     * The ITfFnConfigureRegisterEudc::Show method shows the EUDC key sequence register UI.
     * @param {HWND} hwndParent [in] Handle of the parent window. The text service typically uses this as the parent or owner window when creating a dialog box.
     * @param {Integer} langid [in] Contains a LANGID value that specifies the identifier of the language.
     * @param {Pointer<Guid>} rguidProfile [in] Contains a GUID value that specifies the language profile identifier that the text service is under.
     * @param {BSTR} bstrRegistered [in, unique] Contains a BSTR that contains the EUDC to be registered with the text service. This is optional and can be <b>NULL</b>. If <b>NULL</b>, the text service should display a default register EUDC dialog box.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itffnconfigureregistereudc-show
     */
    Show(hwndParent, langid, rguidProfile, bstrRegistered) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        bstrRegistered := bstrRegistered is String ? BSTR.Alloc(bstrRegistered).Value : bstrRegistered

        result := ComCall(4, this, "ptr", hwndParent, "ushort", langid, "ptr", rguidProfile, "ptr", bstrRegistered, "HRESULT")
        return result
    }
}
