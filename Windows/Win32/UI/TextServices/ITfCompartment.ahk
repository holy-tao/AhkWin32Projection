#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfCompartment interface is implemented by the TSF manager and is used by clients (applications and text services) to obtain and set data in a TSF compartment.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcompartment
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfCompartment extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfCompartment
     * @type {Guid}
     */
    static IID => Guid("{bb08f7a9-607a-4384-8623-056892b64371}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetValue", "GetValue"]

    /**
     * ITfCompartment::SetValue method
     * @param {Integer} tid Contains a <a href="https://docs.microsoft.com/windows/desktop/TSF/tfclientid">TfClientId</a> value that identifies the client.
     * @param {Pointer<VARIANT>} pvarValue Pointer to a VARIANT structure that contains the data to be set. Only VT_I4, VT_UNKNOWN and VT_BSTR data types are allowed.
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
     * <i>pvarValue</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The compartment was cleared by a call to <a href="/windows/desktop/api/msctf/nf-msctf-itfcompartmentmgr-clearcompartment">ITfCompartmentMgr::ClearCompartment</a>, this method was called during a <a href="/windows/desktop/api/msctf/nf-msctf-itfcompartmenteventsink-onchange">ITfCompartmentEventSink::OnChange</a> notification or only the owner can clear this compartment.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcompartment-setvalue
     */
    SetValue(tid, pvarValue) {
        result := ComCall(3, this, "uint", tid, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * ITfCompartment::GetValue method
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> structure that receives the data. This receives VT_EMPTY if the compartment has no value. The caller must free this data when it is no longer required by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcompartment-getvalue
     */
    GetValue() {
        pvarValue := VARIANT()
        result := ComCall(4, this, "ptr", pvarValue, "HRESULT")
        return pvarValue
    }
}
