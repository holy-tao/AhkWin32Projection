#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfRange.ahk
#Include .\ITfReadOnlyProperty.ahk

/**
 * The ITfProperty interface is implemented by the TSF manager and used by a client (application or text service) to modify a property value.
 * @remarks
 * 
 * An instance of this interface is obtained in various ways, such as <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontext-getproperty">ITfContext::GetProperty</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-ienumtfproperties-next">IEnumTfProperties::Next</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfproperty
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfProperty extends ITfReadOnlyProperty{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfProperty
     * @type {Guid}
     */
    static IID => Guid("{e2449660-9542-11d2-bf46-00105a2799b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindRange", "SetValueStore", "SetValue", "Clear"]

    /**
     * ITfProperty::FindRange method
     * @param {Integer} ec Contains an edit cookie that identifies the edit context. This is obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface that contains the point to obtain the property range for. The point will either be the start anchor or end anchor of this range, based upon the value of <i>aPos</i>.
     * @param {Integer} aPos Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/msctf/ne-msctf-tfanchor">TfAnchor</a> values which specifies which anchor of <i>pRange</i> is used as the point to obtain the property range for.
     * @returns {ITfRange} Pointer to an <b>ITfRange</b> interface pointer that receives the requested range object.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfproperty-findrange
     */
    FindRange(ec, pRange, aPos) {
        result := ComCall(7, this, "uint", ec, "ptr", pRange, "ptr*", &ppRange := 0, "int", aPos, "HRESULT")
        return ITfRange(ppRange)
    }

    /**
     * ITfProperty::SetValueStore method
     * @param {Integer} ec Contains an edit cookie that identifies the edit context. This is obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface that contains the range that the property value is set for. This parameter cannot be <b>NULL</b>. This method fails if <i>pRange</i> is empty.
     * @param {ITfPropertyStore} pPropStore Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfpropertystore">ITfPropertyStore</a> interface that obtains the property data.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
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
     * <dt><b>TF_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The edit context identified by <i>ec</i> does not have a read/write lock.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfproperty-setvaluestore
     */
    SetValueStore(ec, pRange, pPropStore) {
        result := ComCall(8, this, "uint", ec, "ptr", pRange, "ptr", pPropStore, "HRESULT")
        return result
    }

    /**
     * ITfProperty::SetValue method
     * @param {Integer} ec Contains an edit cookie that identifies the edit context. This is obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface that contains the range that the property value is set for. This parameter cannot be <b>NULL</b>. This method will fail if <i>pRange</i> is empty.
     * @param {Pointer<VARIANT>} pvarValue Pointer to a <b>VARIANT</b> structure that contains the new property value. Only values of type VT_I4, VT_UNKNOWN, VT_BSTR and VT_EMPTY are supported.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
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
     * A memory allocation failure occurred.
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
     * <dt><b>TF_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The edit context identified by <i>ec</i> does not have a read/write lock.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_READONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The edit context is read-only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_NOTOWNEDRANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TSF manager does not own the range.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfproperty-setvalue
     */
    SetValue(ec, pRange, pvarValue) {
        result := ComCall(9, this, "uint", ec, "ptr", pRange, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * ITfProperty::Clear method
     * @param {Integer} ec Contains an edit cookie that identifies the edit context. This is obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface that contains the range that the property is cleared for. If this parameter is <b>NULL</b>, all values for this property over the entire edit context are cleared.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pRange</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The edit context identified by <i>ec</i> does not have a read/write lock.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_READONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The edit context is read-only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_NOTOWNEDRANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TSF manager does not own the range.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfproperty-clear
     */
    Clear(ec, pRange) {
        result := ComCall(10, this, "uint", ec, "ptr", pRange, "HRESULT")
        return result
    }
}
