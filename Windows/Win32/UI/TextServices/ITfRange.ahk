#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDataObject.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\ITfRange.ahk
#Include .\ITfContext.ahk

/**
 * The ITfRange interface is used by text services and applications to reference and manipulate text within a given context. The interface ID is IID_ITfRange.
 * @remarks
 * 
 * The TSF manager implements this interface. For more information about ranges, anchors, embedded objects, and other text properties used by TSF, see <a href="https://docs.microsoft.com/windows/desktop/TSF/ranges">Ranges</a>, <a href="https://docs.microsoft.com/windows/desktop/TSF/embedded-objects">Embedded Objects</a>, and other topics within <a href="https://docs.microsoft.com/windows/desktop/TSF/using-text-services-framework">Using Text Services Framework</a>.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfrange
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfRange extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfRange
     * @type {Guid}
     */
    static IID => Guid("{aa80e7ff-2021-11d2-93e0-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetText", "SetText", "GetFormattedText", "GetEmbedded", "InsertEmbedded", "ShiftStart", "ShiftEnd", "ShiftStartToRange", "ShiftEndToRange", "ShiftStartRegion", "ShiftEndRegion", "IsEmpty", "Collapse", "IsEqualStart", "IsEqualEnd", "CompareStart", "CompareEnd", "AdjustForInsert", "GetGravity", "SetGravity", "Clone", "GetContext"]

    /**
     * The ITfRange::GetText method obtains the content covered by this range of text.
     * @param {Integer} ec Edit cookie that identifies the edit context obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {Integer} dwFlags Bit fields that specify optional behavior.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TF_MOVESTART"></a><a id="tf_tf_movestart"></a><dl>
     * <dt><b>TF_TF_MOVESTART</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Start anchor of the range is advanced to the position after the last character returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TF_IGNOREEND"></a><a id="tf_tf_ignoreend"></a><dl>
     * <dt><b>TF_TF_IGNOREEND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method attempts to fill <i>pchText</i> with the maximum number of characters, instead of halting the copy at the position occupied by the end anchor of the range.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} pchText Pointer to a buffer to receive the text in the range.
     * @param {Integer} cchMax Maximum size of the text buffer.
     * @returns {Integer} Pointer to a ULONG representing the number of characters written to the <i>pchText</i> text buffer.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrange-gettext
     */
    GetText(ec, dwFlags, pchText, cchMax) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(3, this, "uint", ec, "uint", dwFlags, "ptr", pchText, "uint", cchMax, "uint*", &pcch := 0, "HRESULT")
        return pcch
    }

    /**
     * The ITfRange::SetText method replaces the content covered by the range of text.
     * @param {Integer} ec Identifies the edit context obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {Integer} dwFlags Specifies optional behavior for correction of content. If set to the value of <a href="https://docs.microsoft.com/windows/desktop/TSF/miscellaneous-framework-constants">TF_ST_CORRECTION</a>, then the operation is a correction of the existing content, not a creation of new content, and original text properties are preserved.
     * @param {PWSTR} pchText Pointer to a buffer that contains the text to replace the range contents.
     * @param {Integer} cch Contains the number of characters in <i>pchText</i>.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_COMPOSITION_REJECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context owner rejected a default composition.
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
     * The value of the <i>ec</i> parameter is an invalid cookie, or the caller does not have a read/write lock.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_RANGE_NOT_COVERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The range is not within the active composition of the caller.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrange-settext
     */
    SetText(ec, dwFlags, pchText, cch) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(4, this, "uint", ec, "uint", dwFlags, "ptr", pchText, "int", cch, "HRESULT")
        return result
    }

    /**
     * The ITfRange::GetFormattedText method obtains formatted content contained within a range of text. The content is packaged in an object that supports the IDataObject interface.
     * @param {Integer} ec Edit cookie obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @returns {IDataObject} Pointer to an <b>IDataObject</b> pointer that receives an object that contains the formatted content. The formatted content is obtained using a STGMEDIUM global memory handle.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrange-getformattedtext
     */
    GetFormattedText(ec) {
        result := ComCall(5, this, "uint", ec, "ptr*", &ppDataObject := 0, "HRESULT")
        return IDataObject(ppDataObject)
    }

    /**
     * The ITfRange::GetEmbedded method obtains content that corresponds to a TS_CHAR_EMBEDDED character in the text stream. The start anchor of the range of text is positioned just before the character of interest.
     * @param {Integer} ec Edit cookie obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {Pointer<Guid>} rguidService Identifier that specifies how the embedded content is obtained.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_TS_SERVICE_ACCESSIBLE"></a><a id="guid_ts_service_accessible"></a><dl>
     * <dt><b>GUID_TS_SERVICE_ACCESSIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Output should be an <a href="https://docs.microsoft.com/windows/desktop/WinAuto/accessible-objects">Accessible object</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_TS_SERVICE_ACTIVEX"></a><a id="guid_ts_service_activex"></a><dl>
     * <dt><b>GUID_TS_SERVICE_ACTIVEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Caller requires a direct pointer to the object that supports the interface specified by <i>riid</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_TS_SERVICE_DATAOBJECT"></a><a id="guid_ts_service_dataobject"></a><dl>
     * <dt><b>GUID_TS_SERVICE_DATAOBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Content should be obtained as an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> data transfer object, with <i>riid</i> being IID_IDataObject. Clients should specify this option when a copy of the content is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Caller-defined"></a><a id="caller-defined"></a><a id="CALLER-DEFINED"></a><dl>
     * <dt><b>Caller-defined</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Text services and context owners can define custom GUIDs.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Guid>} riid UUID of the interface of the requested object.
     * @returns {IUnknown} Pointer to the object. It can be cast to match <i>riid</i>.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrange-getembedded
     */
    GetEmbedded(ec, rguidService, riid) {
        result := ComCall(6, this, "uint", ec, "ptr", rguidService, "ptr", riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * The ITfRange::InsertEmbedded method inserts an object at the location of the start anchor of the range of text.
     * @param {Integer} ec Edit cookie obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {Integer} dwFlags Bit fields that specify how insertion should occur. If <a href="https://docs.microsoft.com/windows/desktop/TSF/miscellaneous-framework-constants">TF_IE_CORRECTION</a> is set, the operation is a correction, so that other text services can preserve data associated with the original text.
     * @param {IDataObject} pDataObject Pointer to the data transfer object to be inserted.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The implementing application does not expose embedded objects in its stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_COMPOSITION_REJECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context owner rejected a default composition.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context owner cannot handle the specified object type.
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
     * The value of the <i>ec</i> parameter is an invalid cookie, or the caller does not have a read-only lock.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_RANGE_NOT_COVERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller already has an active composition, but the range is positioned over text not covered by the composition.
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
     * The document or the location of the range cannot be modified.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrange-insertembedded
     */
    InsertEmbedded(ec, dwFlags, pDataObject) {
        result := ComCall(7, this, "uint", ec, "uint", dwFlags, "ptr", pDataObject, "HRESULT")
        return result
    }

    /**
     * ITfRange::ShiftStart method
     * @param {Integer} ec Contains an edit cookie that identifies the edit context. This is obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {Integer} cchReq Contains the number of characters the start anchor is shifted. A negative value causes the anchor to move backward and a positive value causes the anchor to move forward.
     * @param {Pointer<TF_HALTCOND>} pHalt Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_haltcond">TF_HALTCOND</a> structure that contains conditions about the shift. This parameter is optional and can be <b>NULL</b>.
     * @returns {Integer} Pointer to a <b>LONG</b> value that receives the number of characters the anchor was shifted.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrange-shiftstart
     */
    ShiftStart(ec, cchReq, pHalt) {
        result := ComCall(8, this, "uint", ec, "int", cchReq, "int*", &pcch := 0, "ptr", pHalt, "HRESULT")
        return pcch
    }

    /**
     * ITfRange::ShiftEnd method
     * @param {Integer} ec Contains an edit cookie that identifies the edit context. This is obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {Integer} cchReq Contains the number of characters that the end anchor is shifted. A negative value causes the anchor to move backward and a positive value causes the anchor to move forward.
     * @param {Pointer<TF_HALTCOND>} pHalt Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_haltcond">TF_HALTCOND</a> structure that contains conditions on the shift. This parameter is optional and can be <b>NULL</b>.
     * @returns {Integer} Pointer to a <b>LONG</b> value that receives the number of characters the anchor shifted.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrange-shiftend
     */
    ShiftEnd(ec, cchReq, pHalt) {
        result := ComCall(9, this, "uint", ec, "int", cchReq, "int*", &pcch := 0, "ptr", pHalt, "HRESULT")
        return pcch
    }

    /**
     * ITfRange::ShiftStartToRange method
     * @param {Integer} ec Contains an edit cookie that identifies the edit context obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface that contains the anchor that the start anchor is moved to.
     * @param {Integer} aPos Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/msctf/ne-msctf-tfanchor">TfAnchor</a> values that specifies which anchor of <i>pRange</i> the start anchor is moved to.
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
     * The edit context identified by <i>ec</i> does not have a read-only lock.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrange-shiftstarttorange
     */
    ShiftStartToRange(ec, pRange, aPos) {
        result := ComCall(10, this, "uint", ec, "ptr", pRange, "int", aPos, "HRESULT")
        return result
    }

    /**
     * ITfRange::ShiftEndToRange method
     * @param {Integer} ec Contains an edit cookie that identifies the edit context obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface that contains the anchor that the end anchor is moved to.
     * @param {Integer} aPos Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/msctf/ne-msctf-tfanchor">TfAnchor</a> values that specify which anchor of <i>pRange</i> the end anchor will get moved to.
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
     * The edit context identified by <i>ec</i> does not have a read-only lock.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrange-shiftendtorange
     */
    ShiftEndToRange(ec, pRange, aPos) {
        result := ComCall(11, this, "uint", ec, "ptr", pRange, "int", aPos, "HRESULT")
        return result
    }

    /**
     * ITfRange::ShiftStartRegion method
     * @param {Integer} ec Contains an edit cookie that identifies the edit context obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {Integer} dir Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/msctf/ne-msctf-tfshiftdir">TfShiftDir</a> values that specifies which adjacent region the start anchor is moved to.
     * @returns {BOOL} Pointer to a <b>BOOL</b> that receives a flag that indicates if the anchor is positioned adjacent to another region. Receives a nonzero value if the anchor is not adjacent to another region or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrange-shiftstartregion
     */
    ShiftStartRegion(ec, dir) {
        result := ComCall(12, this, "uint", ec, "int", dir, "int*", &pfNoRegion := 0, "HRESULT")
        return pfNoRegion
    }

    /**
     * ITfRange::ShiftEndRegion method
     * @param {Integer} ec Contains an edit cookie that identifies the edit context obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {Integer} dir Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/msctf/ne-msctf-tfshiftdir">TfShiftDir</a> values that specify which adjacent region the end anchor is moved to.
     * @returns {BOOL} Pointer to a <b>BOOL</b> value that receives a flag that indicates if the anchor is positioned adjacent to another region. Receives a nonzero value if the anchor is not adjacent to another region or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrange-shiftendregion
     */
    ShiftEndRegion(ec, dir) {
        result := ComCall(13, this, "uint", ec, "int", dir, "int*", &pfNoRegion := 0, "HRESULT")
        return pfNoRegion
    }

    /**
     * The ITfRange::IsEmpty method verifies that the range of text is empty because the start and end anchors occupy the same position.
     * @param {Integer} ec Edit cookie that identifies the edit context. It is obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @returns {BOOL} Pointer to a Boolean value. <b>TRUE</b> indicates the range is empty; <b>FALSE</b> indicates the range is not empty.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrange-isempty
     */
    IsEmpty(ec) {
        result := ComCall(14, this, "uint", ec, "int*", &pfEmpty := 0, "HRESULT")
        return pfEmpty
    }

    /**
     * The ITfRange::Collapse method clears the range of text by moving its start anchor and end anchor to the same position.
     * @param {Integer} ec Edit cookie obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {Integer} aPos <a href="https://docs.microsoft.com/windows/win32/api/msctf/ne-msctf-tfanchor">TfAnchor
     *             </a> enumeration that describes how to collapse the range.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_ANCHOR_START"></a><a id="tf_anchor_start"></a><dl>
     * <dt><b>TF_ANCHOR_START</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The end anchor is moved to the location of the start anchor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_ANCHOR_END"></a><a id="tf_anchor_end"></a><dl>
     * <dt><b>TF_ANCHOR_END</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The start anchor is moved to the location of the end anchor.
     * 
     * </td>
     * </tr>
     * </table>
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
     * The object does not support the interface, or a new range cannot be created.
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
     * <i>aPos</i> is invalid.
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
     * The cookie in <i>ec</i> is invalid, or the caller does not have a read-only lock.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrange-collapse
     */
    Collapse(ec, aPos) {
        result := ComCall(15, this, "uint", ec, "int", aPos, "HRESULT")
        return result
    }

    /**
     * The ITfRange::IsEqualStart method verifies that the start anchor of this range of text matches an anchor of another specified range.
     * @param {Integer} ec Edit cookie obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pWith Pointer to a specified range in which an anchor is to be compared to this range start anchor.
     * @param {Integer} aPos Enumeration element that indicates which anchor of the specified <i>pWith</i> range to compare to this range start anchor.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_ANCHOR_START"></a><a id="tf_anchor_start"></a><dl>
     * <dt><b>TF_ANCHOR_START</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Compares this range start anchor with the specified range start anchor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_ANCHOR_END"></a><a id="tf_anchor_end"></a><dl>
     * <dt><b>TF_ANCHOR_END</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Compares this range start anchor with the specified range end anchor.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} Pointer to a Boolean value. Upon return, <b>TRUE</b> indicates that the specified <i>pWith</i> range anchor matches this range start anchor. <b>FALSE</b> indicates otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrange-isequalstart
     */
    IsEqualStart(ec, pWith, aPos) {
        result := ComCall(16, this, "uint", ec, "ptr", pWith, "int", aPos, "int*", &pfEqual := 0, "HRESULT")
        return pfEqual
    }

    /**
     * The ITfRange::IsEqualStart method verifies that the end anchor of this range of text matches an anchor of another specified range.
     * @param {Integer} ec Edit cookie obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pWith Pointer to a specified range in which an anchor is to be compared to this range end anchor.
     * @param {Integer} aPos Enumeration element that indicates which anchor of the specified <i>pWith</i> range to compare with this range end anchor.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_ANCHOR_START"></a><a id="tf_anchor_start"></a><dl>
     * <dt><b>TF_ANCHOR_START</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Compares this range end anchor with the specified range start anchor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_ANCHOR_END"></a><a id="tf_anchor_end"></a><dl>
     * <dt><b>TF_ANCHOR_END</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Compares this range end anchor with the specified range end anchor.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} Pointer to a Boolean value. Upon return, <b>TRUE</b> indicates that the specified <i>pWith</i> range anchor matches this range end anchor. <b>FALSE</b> indicates otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrange-isequalend
     */
    IsEqualEnd(ec, pWith, aPos) {
        result := ComCall(17, this, "uint", ec, "ptr", pWith, "int", aPos, "int*", &pfEqual := 0, "HRESULT")
        return pfEqual
    }

    /**
     * The ITfRange::CompareStart method compares the start anchor position of this range of text to an anchor in another range.
     * @param {Integer} ec Edit cookie obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pWith Pointer to a specified range in which an anchor is to be compared to this range start anchor.
     * @param {Integer} aPos Enumeration element that indicates which anchor of the specified <i>pWith</i> range to compare to this range start anchor.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_ANCHOR_START"></a><a id="tf_anchor_start"></a><dl>
     * <dt><b>TF_ANCHOR_START</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Compare this range start anchor with the specified range start anchor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_ANCHOR_END"></a><a id="tf_anchor_end"></a><dl>
     * <dt><b>TF_ANCHOR_END</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Compare this range start anchor with the specified range end anchor.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} Pointer to the result of the comparison between this range start anchor and the specified <i>pWith</i> range anchor.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="-1"></a><dl>
     * <dt><b>-1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This start anchor is behind the anchor of the specified range (position of this start anchor &lt; position of the anchor of the specified range).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="0"></a><dl>
     * <dt><b>0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This start anchor is at the same position as the anchor of the specified range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="_1"></a><dl>
     * <dt><b>+1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This start anchor is ahead of the anchor of the specified range (position of this start anchor &gt; position of the anchor of the specified range).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrange-comparestart
     */
    CompareStart(ec, pWith, aPos) {
        result := ComCall(18, this, "uint", ec, "ptr", pWith, "int", aPos, "int*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * The ITfRange::CompareEnd method compares the end anchor position of this range of text to an anchor in another range.
     * @param {Integer} ec Edit cookie obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pWith Pointer to a specified range in which an anchor is to be compared with this range end anchor.
     * @param {Integer} aPos Enumeration element that indicates which anchor of the specified <i>pWith</i> range to compare with this range end anchor.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_ANCHOR_START"></a><a id="tf_anchor_start"></a><dl>
     * <dt><b>TF_ANCHOR_START</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Compare this range end anchor with the specified range start anchor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_ANCHOR_END"></a><a id="tf_anchor_end"></a><dl>
     * <dt><b>TF_ANCHOR_END</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Compare this range end anchor with the specified range end anchor.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} Pointer to the result of the comparison between this range end anchor and the anchor of the specified <i>pWith</i> range.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="-1"></a><dl>
     * <dt><b>-1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This end anchor is behind the anchor of the specified range (position of this end anchor &lt; position of the anchor of the specified range).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="0"></a><dl>
     * <dt><b>0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This end anchor is at the same position as the anchor of the specified range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="_1"></a><dl>
     * <dt><b>+1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This end anchor is ahead of the anchor of the specified range (position of this end anchor &gt; position of the anchor of the specified range).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrange-compareend
     */
    CompareEnd(ec, pWith, aPos) {
        result := ComCall(19, this, "uint", ec, "ptr", pWith, "int", aPos, "int*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * The ITfRange::AdjustForInsert method expands or contracts a range of text to adjust for text insertion.
     * @param {Integer} ec Edit cookie obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {Integer} cchInsert Character count of the inserted text. This count is used in a futurecall to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfrange-settext">ITfRange::SetText</a>. If the character count is unknown, 0 can be used.
     * @returns {BOOL} Pointer to a flag that indicates whether the context owner will accept (<b>TRUE</b>) or reject (<b>FALSE</b>) the insertion.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrange-adjustforinsert
     */
    AdjustForInsert(ec, cchInsert) {
        result := ComCall(20, this, "uint", ec, "uint", cchInsert, "int*", &pfInsertOk := 0, "HRESULT")
        return pfInsertOk
    }

    /**
     * ITfRange::GetGravity method
     * @param {Pointer<Integer>} pgStart Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/msctf/ne-msctf-tfgravity">TfGravity</a> value that receives the gravity of the start anchor.
     * @param {Pointer<Integer>} pgEnd Pointer to a <b>TfGravity</b> value that receives the gravity of the end anchor.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrange-getgravity
     */
    GetGravity(pgStart, pgEnd) {
        pgStartMarshal := pgStart is VarRef ? "int*" : "ptr"
        pgEndMarshal := pgEnd is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, pgStartMarshal, pgStart, pgEndMarshal, pgEnd, "HRESULT")
        return result
    }

    /**
     * ITfRange::SetGravity method
     * @param {Integer} ec Contains an edit cookie that identifies the edit context obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {Integer} gStart Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/msctf/ne-msctf-tfgravity">TfGravity</a> values that specifies the gravity of the start anchor.
     * @param {Integer} gEnd Contains one of the <b>TfGravity</b> values that specifies the gravity of the end anchor.
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
     * <dt><b>TF_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cookie in <i>ec</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrange-setgravity
     */
    SetGravity(ec, gStart, gEnd) {
        result := ComCall(22, this, "uint", ec, "int", gStart, "int", gEnd, "HRESULT")
        return result
    }

    /**
     * The ITfRange::Clone method duplicates this range of text.
     * @returns {ITfRange} Pointer to a new range object that references this range.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrange-clone
     */
    Clone() {
        result := ComCall(23, this, "ptr*", &ppClone := 0, "HRESULT")
        return ITfRange(ppClone)
    }

    /**
     * ITfRange::GetContext method
     * @returns {ITfContext} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> interface pointer that receives the context object that the range belongs to.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfrange-getcontext
     */
    GetContext() {
        result := ComCall(24, this, "ptr*", &ppContext := 0, "HRESULT")
        return ITfContext(ppContext)
    }
}
