#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\TS_STATUS.ahk
#Include ..\..\System\Com\IDataObject.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IAnchor.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * The ITextStoreAnchor interface is implemented by a Microsoft Active Accessibility client and is used by the TSF manager to manipulate text streams.
 * @see https://docs.microsoft.com/windows/win32/api//textstor/nn-textstor-itextstoreanchor
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITextStoreAnchor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextStoreAnchor
     * @type {Guid}
     */
    static IID => Guid("{9b2077b0-5f18-4dec-bee9-3cc722f5dfe0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AdviseSink", "UnadviseSink", "RequestLock", "GetStatus", "QueryInsert", "GetSelection", "SetSelection", "GetText", "SetText", "GetFormattedText", "GetEmbedded", "InsertEmbedded", "RequestSupportedAttrs", "RequestAttrsAtPosition", "RequestAttrsTransitioningAtPosition", "FindNextAttrTransition", "RetrieveRequestedAttrs", "GetStart", "GetEnd", "GetActiveView", "GetAnchorFromPoint", "GetTextExt", "GetScreenExt", "GetWnd", "QueryInsertEmbedded", "InsertTextAtSelection", "InsertEmbeddedAtSelection"]

    /**
     * The ITextStoreAnchor::AdviseSink method installs a new advise sink from the ITextStoreAnchorSink interface or modifies an existing advise sink.
     * @param {Pointer<Guid>} riid Specifies the sink interface. The only supported value is IID_ITextStoreAnchorSink.
     * @param {IUnknown} punk Pointer to the sink interface to advise. Cannot be <b>NULL</b>.
     * @param {Integer} dwMask Specifies the events that notify the advise sink. For more information about possible parameter values, see <a href="https://docs.microsoft.com/windows/desktop/TSF/ts-as--constants">TS_AS_* Constants</a>.
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
     * The specified sink interface <i>riid</i> could not be obtained.
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
     * The specified sink interface is unsupported.
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
     * The specified sink object could not be obtained.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-advisesink
     */
    AdviseSink(riid, punk, dwMask) {
        result := ComCall(3, this, "ptr", riid, "ptr", punk, "uint", dwMask, "HRESULT")
        return result
    }

    /**
     * ITextStoreAnchor::UnadviseSink method
     * @param {IUnknown} punk Pointer to a sink object. Cannot be <b>NULL</b>.
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
     * <dt><b>CONNECT_E_NOCONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no active sink object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-unadvisesink
     */
    UnadviseSink(punk) {
        result := ComCall(4, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * ITextStoreAnchor::RequestLock method
     * @param {Integer} dwLockFlags Specifies the type of lock requested.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TS_LF_READ"></a><a id="ts_lf_read"></a><dl>
     * <dt><b>TS_LF_READ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The document has a read-only lock and cannot be modified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TS_LF_READWRITE"></a><a id="ts_lf_readwrite"></a><dl>
     * <dt><b>TS_LF_READWRITE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The document has a read/write lock and can be modified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TS_LF_SYNC"></a><a id="ts_lf_sync"></a><dl>
     * <dt><b>TS_LF_SYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The document has a synchronous-lock if this flag is combined with other flags.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} If the lock request is synchronous, receives an HRESULT value from the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-itextstoreanchorsink-onlockgranted">ITextStoreAnchorSink::OnLockGranted</a> method that specifies the result of the lock request.
     * 
     * If the lock request is asynchronous and the result is <a href="https://docs.microsoft.com/windows/desktop/TSF/text-store-return-values">TS_S_ASYNC</a>, the document receives an asynchronous lock. If the lock request is asynchronous and the result is TS_E_SYNCHRONOUS, the document cannot be locked synchronously.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-requestlock
     */
    RequestLock(dwLockFlags) {
        result := ComCall(5, this, "uint", dwLockFlags, "int*", &phrSession := 0, "HRESULT")
        return phrSession
    }

    /**
     * The ITextStoreAnchor::GetStatus method obtains the document status. The document status is returned through the TS_STATUS structure.
     * @returns {TS_STATUS} Receives the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_status">TS_STATUS</a> structure that contains the document status. Cannot be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-getstatus
     */
    GetStatus() {
        pdcs := TS_STATUS()
        result := ComCall(6, this, "ptr", pdcs, "HRESULT")
        return pdcs
    }

    /**
     * The ITextStoreAnchor::QueryInsert method determines whether the specified start and end anchors are valid. Use this method to adjust an edit to a document before you execute the edit. The method must not return values outside the range of the document.
     * @param {IAnchor} paTestStart Receives a pointer to a start anchor for the inserted text.
     * @param {IAnchor} paTestEnd Receives a pointer to an end anchor for the inserted text. This is the same as <i>paTestStart</i> if the text is inserted at a point instead of replacing selected text.
     * @param {Integer} cch Length of replacement text.
     * @param {Pointer<IAnchor>} ppaResultStart Pointer to the new anchor object at the starting location for the inserted text. If the value of this parameter is <b>NULL</b>, then text cannot be inserted at the specified position. This anchor cannot be outside the document.
     * @param {Pointer<IAnchor>} ppaResultEnd Pointer to the new anchor object at the ending location for the inserted text. If the value of this parameter is <b>NULL</b>, then text cannot be inserted at the specified position. This anchor cannot be outside the document.
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
     * The <i>paTestStart</i> or <i>paTestEnd</i> parameters are invalid.
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
     * The attempt to instantiate the <i>ppaResultStart</i> and/or <i>ppaResultEnd</i> anchors failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-queryinsert
     */
    QueryInsert(paTestStart, paTestEnd, cch, ppaResultStart, ppaResultEnd) {
        result := ComCall(7, this, "ptr", paTestStart, "ptr", paTestEnd, "uint", cch, "ptr*", ppaResultStart, "ptr*", ppaResultEnd, "HRESULT")
        return result
    }

    /**
     * The ITextStoreAnchor::GetSelection method returns the offset of a text selection in a text stream. This method supports multiple text selections. The caller must have a read-only lock on the document before calling this method.
     * @param {Integer} ulIndex Specifies the text selections that start the process. If the <a href="https://docs.microsoft.com/windows/desktop/TSF/miscellaneous-framework-constants">TF_DEFAULT_SELECTION</a> constant is specified for this parameter, the input selection starts the process, and only a single selection (the one appropriate for input operations) will be returned.
     * @param {Integer} ulCount Specifies the maximum number of selections to return.
     * @param {Pointer<TS_SELECTION_ANCHOR>} pSelection Receives the style, start, and end character positions of the selected text. These values are put into the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_selection_anchor">TS_SELECTION_ANCHOR</a> structure.
     * @param {Pointer<Integer>} pcFetched Receives the number of <i>pSelection</i> structures returned.
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
     * The method was unable to load the start or end anchor into the <b>TS_SELECTION_ANCHOR</b> structure.
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
     * The method was unable to allocate memory for the selection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TS_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have a read-only lock on the document.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TS_E_NOSELECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The document has no selection.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-getselection
     */
    GetSelection(ulIndex, ulCount, pSelection, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", ulIndex, "uint", ulCount, "ptr", pSelection, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * ITextStoreAnchor::SetSelection method
     * @param {Integer} ulCount Specifies the number of text selections in <i>pSelection</i>.
     * @param {Pointer<TS_SELECTION_ANCHOR>} pSelection Specifies the style, start, and end character positions of the text selected through the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_selection_anchor">TS_SELECTION_ANCHOR</a> structure. The start anchor member <b>paStart</b> of the structure must never follow the end anchor member <b>paEnd</b>, although they might be at the same location.
     * 
     * When <b>paStart</b> = <b>paEnd</b>, the method places a caret at the anchor location. There can be only one caret at a time in the text stream.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to allocate sufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_INVALIDPOS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The anchor locations specified are beyond the text in the document.
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
     * The caller does not have a read/write lock.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-setselection
     */
    SetSelection(ulCount, pSelection) {
        result := ComCall(9, this, "uint", ulCount, "ptr", pSelection, "HRESULT")
        return result
    }

    /**
     * The ITextStoreAnchor::GetText method returns information about text at a specified anchor position. This method returns the visible and hidden text and indicates if embedded data is attached to the text.
     * @param {Integer} dwFlags Not used; should be zero.
     * @param {IAnchor} paStart Specifies the starting anchor position.
     * @param {IAnchor} paEnd Specifies the ending anchor position. If <b>NULL</b>, it is treated as if it were an anchor positioned at the very end of the text stream.
     * @param {PWSTR} pchText Specifies the buffer to receive the text. May be <b>NULL</b> only when <i>cchReq</i> = 0.
     * @param {Integer} cchReq Specifies the <i>pchText</i> buffer size in characters.
     * @param {BOOL} fUpdateAnchor If <b>TRUE</b>, <i>paStart</i> will be repositioned just past the last character copied to <i>pchText</i>.
     * @returns {Integer} Receives the number of characters copied into the <i>pchText</i> buffer.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-gettext
     */
    GetText(dwFlags, paStart, paEnd, pchText, cchReq, fUpdateAnchor) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(10, this, "uint", dwFlags, "ptr", paStart, "ptr", paEnd, "ptr", pchText, "uint", cchReq, "uint*", &pcch := 0, "int", fUpdateAnchor, "HRESULT")
        return pcch
    }

    /**
     * The ITextStoreAnchor::SetText method sets the text selection between two supplied anchor locations.
     * @param {Integer} dwFlags If set to the value of TS_ST_CORRECTION, the text is a transform (correction) of existing content, and any special text markup information (metadata) is retained, such as .wav file data or a language identifier. The client defines the type of markup information to be retained.
     * @param {IAnchor} paStart Pointer to the anchor at the start of the range of text to replace.
     * @param {IAnchor} paEnd Pointer to the anchor at the end of the range of text to replace. Must always follow or be at the same position as <i>paStart</i>.
     * @param {PWSTR} pchText Pointer to the replacement text. The text string does not have to be <b>NULL</b> terminated, because the text character count is specified in the <i>cch</i> parameter.
     * @param {Integer} cch Specifies the number of characters in the replacement text.
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
     * The method could not instantiate one of the anchors <i>paStart</i> or <i>paEnd</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TS_E_INVALIDPOS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The location of <i>paStart</i> or <i>paEnd</i> is outside of the document text.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TS_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have a read/write lock.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TS_E_READONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The document is read-only. Content cannot be modified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TS_E_REGION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An attempt was made to modify text across a region boundary.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-settext
     */
    SetText(dwFlags, paStart, paEnd, pchText, cch) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(11, this, "uint", dwFlags, "ptr", paStart, "ptr", paEnd, "ptr", pchText, "uint", cch, "HRESULT")
        return result
    }

    /**
     * The ITextStoreAnchor::GetFormattedText method returns formatted text information from a text stream.
     * @param {IAnchor} paStart Anchor position at which to start retrieval of formatted text.
     * @param {IAnchor} paEnd Anchor position at which to end retrieval of formatted text.
     * @returns {IDataObject} Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> object that contains the formatted text.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-getformattedtext
     */
    GetFormattedText(paStart, paEnd) {
        result := ComCall(12, this, "ptr", paStart, "ptr", paEnd, "ptr*", &ppDataObject := 0, "HRESULT")
        return IDataObject(ppDataObject)
    }

    /**
     * The ITextStoreAnchor::GetEmbedded method obtains an embedded object from a text stream.
     * @param {Integer} dwFlags Bit fields that specify how the method deals with hidden text. If set to TS_GEA_HIDDEN, an embedded object can be located within hidden text. Otherwise hidden text is skipped over.
     * @param {IAnchor} paPos Pointer to an anchor positioned immediately in front of the embedded object, as denoted by a TS_CHAR_EMBEDDED character.
     * @param {Pointer<Guid>} rguidService 
     * @param {Pointer<Guid>} riid Specifies the interface type requested.
     * @returns {IUnknown} Pointer to an <b>IUnknown</b> pointer that receives the requested interface.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-getembedded
     */
    GetEmbedded(dwFlags, paPos, rguidService, riid) {
        result := ComCall(13, this, "uint", dwFlags, "ptr", paPos, "ptr", rguidService, "ptr", riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * ITextStoreAnchor::InsertEmbedded method
     * @param {Integer} dwFlags Must be TS_IE_CORRECTION.
     * @param {IAnchor} paStart Pointer to the anchor at the start of the object to be inserted.
     * @param {IAnchor} paEnd Pointer to the anchor at the end of the object to be inserted.
     * @param {IDataObject} pDataObject Pointer to an <b>IDataObject</b> data object.
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
     * The method was unable to obtain a valid interface pointer to the start and/or end anchors.
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
     * One or more input parameters are invalid.
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
     * The application does not support embedded objects.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TS_E_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application does not support the data type contained in <i>pDataObject</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TS_E_INVALIDPOS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>paStart</i> and/or <i>paEnd</i> are not within the document.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TS_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have a read/write lock.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-insertembedded
     */
    InsertEmbedded(dwFlags, paStart, paEnd, pDataObject) {
        result := ComCall(14, this, "uint", dwFlags, "ptr", paStart, "ptr", paEnd, "ptr", pDataObject, "HRESULT")
        return result
    }

    /**
     * ITextStoreAnchor::RequestSupportedAttrs method
     * @param {Integer} dwFlags Specifies whether a subsequent call to the <b>ITextStoreAnchor::RetrieveRequestedAttrs</b> method will contain the supported attributes. If the TS_ATTR_FIND_WANT_VALUE flag is specified, the default attribute values will be those in the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_attrval">TS_ATTRVAL</a> structure after the subsequent call to <b>ITextStoreAnchor::RetrieveRequestedAttrs</b>. If any other flag is specified for this parameter, the method only verifies that the attribute is supported and that the <b>varValue</b> member of the <b>TS_ATTRVAL</b> structure is set to VT_EMPTY.
     * @param {Integer} cFilterAttrs Specifies the number of supported attributes to obtain.
     * @param {Pointer<Guid>} paFilterAttrs Pointer to the <a href="https://docs.microsoft.com/windows/desktop/TSF/ts-attrid">TS_ATTRID</a> data type that specifies the attribute to verify. The method returns only the attributes specified by <b>TS_ATTRID</b>, even though other attributes might be supported.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to allocate sufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-requestsupportedattrs
     */
    RequestSupportedAttrs(dwFlags, cFilterAttrs, paFilterAttrs) {
        result := ComCall(15, this, "uint", dwFlags, "uint", cFilterAttrs, "ptr", paFilterAttrs, "HRESULT")
        return result
    }

    /**
     * ITextStoreAnchor::RequestAttrsAtPosition method
     * @param {IAnchor} paPos Pointer to the anchor.
     * @param {Integer} cFilterAttrs Specifies the number of attributes to obtain.
     * @param {Pointer<Guid>} paFilterAttrs Pointer to the <a href="https://docs.microsoft.com/windows/desktop/TSF/ts-attrid">TS_ATTRID</a> data type that specifies the attribute to verify.
     * @param {Integer} dwFlags Must be zero.
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
     * The <i>paPos</i> anchor is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-requestattrsatposition
     */
    RequestAttrsAtPosition(paPos, cFilterAttrs, paFilterAttrs, dwFlags) {
        result := ComCall(16, this, "ptr", paPos, "uint", cFilterAttrs, "ptr", paFilterAttrs, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * ITextStoreAnchor::RequestAttrsTransitioningAtPosition method
     * @param {IAnchor} paPos Pointer to the anchor.
     * @param {Integer} cFilterAttrs Specifies the number of attributes to obtain.
     * @param {Pointer<Guid>} paFilterAttrs Pointer to the <a href="https://docs.microsoft.com/windows/desktop/TSF/ts-attrid">TS_ATTRID</a> data type that specifies the attribute to verify.
     * @param {Integer} dwFlags Specifies attributes for the call to the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-itextstoreanchor-retrieverequestedattrs">ITextStoreAnchor::RetrieveRequestedAttrs</a> method. If this parameter is not set, the method returns the attributes that start at the specified anchor location. Other possible values for this parameter are the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TS_ATTR_FIND_WANT_END"></a><a id="ts_attr_find_want_end"></a><dl>
     * <dt><b>TS_ATTR_FIND_WANT_END</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Obtains the attributes that end at the specified anchor location.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TS_ATTR_FIND_WANT_VALUE"></a><a id="ts_attr_find_want_value"></a><dl>
     * <dt><b>TS_ATTR_FIND_WANT_VALUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Obtains the value of the attribute in addition to the attribute. The attribute value is put into the <b>varValue</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_attrval">TS_ATTRVAL</a> structure during the <b>ITextStoreAnchor::RetrieveRequestedAttrs</b> method call.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>paPos</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-requestattrstransitioningatposition
     */
    RequestAttrsTransitioningAtPosition(paPos, cFilterAttrs, paFilterAttrs, dwFlags) {
        result := ComCall(17, this, "ptr", paPos, "uint", cFilterAttrs, "ptr", paFilterAttrs, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The ITextStoreAnchor::FindNextAttrTransition method finds the location in the text stream where a transition occurs in an attribute value. The specified attribute to check is application-dependent.
     * @param {IAnchor} paStart Pointer to the anchor position at the start of a range to search for an attribute transition.
     * @param {IAnchor} paHalt Pointer to the anchor position at the end of a range to search for an attribute transition.
     * @param {Integer} cFilterAttrs Specifies the number of attributes to check.
     * @param {Pointer<Guid>} paFilterAttrs Pointer to the <a href="https://docs.microsoft.com/windows/desktop/TSF/ts-attrid">TS_ATTRID</a> data type that specifies the attribute to check. Pre-defined attributes are given in tsattrs.h.
     * @param {Integer} dwFlags Specifies the direction to search for an attribute transition. By default, the method searches forward.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TS_ATTR_FIND_BACKWARDS"></a><a id="ts_attr_find_backwards"></a><dl>
     * <dt><b>TS_ATTR_FIND_BACKWARDS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method searches backward in the text stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TS_ATTR_FIND_UPDATESTART"></a><a id="ts_attr_find_updatestart"></a><dl>
     * <dt><b>TS_ATTR_FIND_UPDATESTART</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method positions the input anchor <i>paStart</i> at the next attribute transition, if one is found. Otherwise the input anchor is not modified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TS_ATTR_FIND_WANT_OFFSET"></a><a id="ts_attr_find_want_offset"></a><dl>
     * <dt><b>TS_ATTR_FIND_WANT_OFFSET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>plFoundOffset</i> parameter receives the character offset of the attribute transition from <i>paStart</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<BOOL>} pfFound Receives a Boolean value of <b>TRUE</b> if an attribute transition was found, otherwise <b>FALSE</b> is returned.
     * @param {Pointer<Integer>} plFoundOffset Receives the character offset of the attribute transition from the start anchor <i>paStart</i>.
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
     * <i>paStart</i> and/or <i>paHalt</i> are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TS_E_INVALIDPOS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The character positions specified are beyond the text in the document.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-findnextattrtransition
     */
    FindNextAttrTransition(paStart, paHalt, cFilterAttrs, paFilterAttrs, dwFlags, pfFound, plFoundOffset) {
        pfFoundMarshal := pfFound is VarRef ? "int*" : "ptr"
        plFoundOffsetMarshal := plFoundOffset is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, "ptr", paStart, "ptr", paHalt, "uint", cFilterAttrs, "ptr", paFilterAttrs, "uint", dwFlags, pfFoundMarshal, pfFound, plFoundOffsetMarshal, plFoundOffset, "HRESULT")
        return result
    }

    /**
     * ITextStoreAnchor::RetrieveRequestedAttrs method
     * @param {Integer} ulCount Specifies the number of supported attributes to obtain.
     * @param {Pointer<TS_ATTRVAL>} paAttrVals Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_attrval">TS_ATTRVAL</a> structure that receives the supported attributes. The members of this structure depend upon the <i>dwFlags</i> parameter of the calling method.
     * @param {Pointer<Integer>} pcFetched Receives the number of supported attributes.
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
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-retrieverequestedattrs
     */
    RetrieveRequestedAttrs(ulCount, paAttrVals, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, "uint", ulCount, "ptr", paAttrVals, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * The ITextStoreAnchor::GetStart method returns an anchor positioned at the start of the text stream.
     * @returns {IAnchor} Pointer to an anchor object located at the start of the text stream.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-getstart
     */
    GetStart() {
        result := ComCall(20, this, "ptr*", &ppaStart := 0, "HRESULT")
        return IAnchor(ppaStart)
    }

    /**
     * The ITextStoreAnchor::GetEnd method returns an anchor positioned at the end of the text stream.
     * @returns {IAnchor} Pointer to an anchor object located at the very end of the text stream.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-getend
     */
    GetEnd() {
        result := ComCall(21, this, "ptr*", &ppaEnd := 0, "HRESULT")
        return IAnchor(ppaEnd)
    }

    /**
     * The ITextStoreAnchor::GetActiveView method returns a TsViewCookie data type that specifies the current active view. TSF supports only a single active view, so a given text store should always return the same TsViewCookie data type.
     * @returns {Integer} Receives the <b>TsViewCookie</b> data type that specifies the current active view.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-getactiveview
     */
    GetActiveView() {
        result := ComCall(22, this, "uint*", &pvcView := 0, "HRESULT")
        return pvcView
    }

    /**
     * The ITextStoreAnchor::GetAnchorFromPoint method converts a point in screen coordinates to an anchor positioned at a corresponding location.
     * @param {Integer} vcView Specifies the context view.
     * @param {Pointer<POINT>} ptScreen Pointer to the <b>POINT</b> structure with the screen coordinates of the point.
     * @param {Integer} dwFlags Specifies the anchor position to return based upon the screen coordinates of the point relative to a character bounding box. By default, the anchor position returned is the character bounding box containing the screen coordinates of the point. If the point is outside a character bounding box, the method returns <b>NULL</b> or <a href="https://docs.microsoft.com/windows/desktop/TSF/manager-return-values">TF_E_INVALIDPOINT</a>. Other bit flags for this parameter are as follows.
     * 
     * The bit flags can be combined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GXFPF_ROUND_NEAREST"></a><a id="gxfpf_round_nearest"></a><dl>
     * <dt><b>GXFPF_ROUND_NEAREST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the screen coordinates of the point are contained in a character bounding box, an anchor is returned at the bounding edge closest to the screen coordinates of the point.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GXFPF_NEAREST"></a><a id="gxfpf_nearest"></a><dl>
     * <dt><b>GXFPF_NEAREST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the screen coordinates of the point are not contained in a character bounding box, an anchor at the closest character position is returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {IAnchor} Pointer to an anchor object at a location corresponding to the screen coordinates <i>ptScreen</i>.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-getanchorfrompoint
     */
    GetAnchorFromPoint(vcView, ptScreen, dwFlags) {
        result := ComCall(23, this, "uint", vcView, "ptr", ptScreen, "uint", dwFlags, "ptr*", &ppaSite := 0, "HRESULT")
        return IAnchor(ppaSite)
    }

    /**
     * The ITextStoreAnchor::GetTextExt method returns the bounding box, in screen coordinates, of a range of text. The caller must have a read-only lock on the document before calling this method.
     * @param {Integer} vcView Specifies the context view.
     * @param {IAnchor} paStart Specifies the anchor positioned at the start of the range.
     * @param {IAnchor} paEnd Specifies the anchor positioned at the end of the range.
     * @param {Pointer<RECT>} prc Receives the bounding box of the text range in screen coordinates.
     * @param {Pointer<BOOL>} pfClipped Receives a Boolean value that specifies if the text in the bounding box has been clipped. If <b>TRUE</b>, the bounding box contains clipped text and does not include the entire requested text range. The bounding box is clipped because the requested range is not visible.
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
     * The method was unable to obtain a valid interface pointer to the start and/or end anchors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TS_E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the input parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TS_E_INVALIDPOS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The range specified by the <i>paStart</i> and <i>paEnd</i> parameters extends past the beginning or end of the document.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TS_E_NOLAYOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application has not calculated a text layout. Any further calls will not succeed until the application calls <a href="/windows/desktop/api/textstor/nf-textstor-itextstoreanchorsink-onlayoutchange">ITextStoreAnchorSink::OnLayoutChange</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TS_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have a read-only lock on the document.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-gettextext
     */
    GetTextExt(vcView, paStart, paEnd, prc, pfClipped) {
        pfClippedMarshal := pfClipped is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, "uint", vcView, "ptr", paStart, "ptr", paEnd, "ptr", prc, pfClippedMarshal, pfClipped, "HRESULT")
        return result
    }

    /**
     * The ITextStoreAnchor::GetScreenExt method returns the bounding box screen coordinates of the display surface where the text stream is rendered.
     * @param {Integer} vcView Specifies the context view.
     * @returns {RECT} Receives the bounding box screen coordinates of the display surface of the document.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-getscreenext
     */
    GetScreenExt(vcView) {
        prc := RECT()
        result := ComCall(25, this, "uint", vcView, "ptr", prc, "HRESULT")
        return prc
    }

    /**
     * The ITextStoreAnchor::GetWnd method returns the handle to a window that corresponds to the current text stream.
     * @param {Integer} vcView Specifies the <a href="https://docs.microsoft.com/windows/desktop/TSF/tsviewcookie">TsViewCookie</a> data type that corresponds to the current document.
     * @returns {HWND} Receives a pointer to the handle of the window that corresponds to the current document. This parameter can be <b>NULL</b> if the document does not have the corresponding handle to the window.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-getwnd
     */
    GetWnd(vcView) {
        phwnd := HWND()
        result := ComCall(26, this, "uint", vcView, "ptr", phwnd, "HRESULT")
        return phwnd
    }

    /**
     * ITextStoreAnchor::QueryInsertEmbedded method
     * @param {Pointer<Guid>} pguidService Pointer to the object type. If <b>NULL</b>, <i>pFormatEtc</i> should be used.
     * @param {Pointer<FORMATETC>} pFormatEtc Pointer to the <a href="https://docs.microsoft.com/windows/desktop/com/the-formatetc-structure">FORMATETC</a> structure that contains format data of the object. This parameter cannot be <b>NULL</b> if the <i>pguidService</i> parameter is <b>NULL</b>.
     * @returns {BOOL} Receives <b>TRUE</b> if the object type can be inserted into the document or <b>FALSE</b> if the object type cannot be inserted into the document.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-queryinsertembedded
     */
    QueryInsertEmbedded(pguidService, pFormatEtc) {
        result := ComCall(27, this, "ptr", pguidService, "ptr", pFormatEtc, "int*", &pfInsertable := 0, "HRESULT")
        return pfInsertable
    }

    /**
     * ITextStoreAnchor::InsertTextAtSelection method
     * @param {Integer} dwFlags Specifies whether the <i>paStart</i> and <i>paEnd</i> parameters will contain the results of the text insertion.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/TSF/tf-ias--constants">TF_IAS_NOQUERY</a> and TF_IAS_QUERYONLY flags cannot be combined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_IAS_NOQUERY"></a><a id="tf_ias_noquery"></a><dl>
     * <dt><b>TF_IAS_NOQUERY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Text is inserted, and the values of the <i>ppaStart</i> and <i>ppaEnd</i> parameters can be <b>NULL</b>. Use this flag if the results of the text insertion are not required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_IAS_QUERYONLY"></a><a id="tf_ias_queryonly"></a><dl>
     * <dt><b>TF_IAS_QUERYONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Text is not inserted, and the <i>ppaStart</i> and <i>ppaEnd</i> anchors contain the results of the text insertion. The values of these parameters depend on how the application implements text insertion into a document. Use this flag to view the results of the text insertion without actually inserting the text. Zero-length text can be inserted.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} pchText Pointer to the string to insert in the document. The string can be <b>NULL</b> terminated.
     * @param {Integer} cch Specifies the text length.
     * @param {Pointer<IAnchor>} ppaStart Pointer to the anchor object at the start of the text insertion.
     * @param {Pointer<IAnchor>} ppaEnd Pointer to the anchor object at the end of the text insertion. For an insertion point, this parameter value will be the same as the value of the <i>ppaStart</i> parameter.
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
     * The method could not instantiate one of the anchors <i>paStart</i> or <i>paEnd</i>.
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
     * The <i>pchText</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TS_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have a lock on the document.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-inserttextatselection
     */
    InsertTextAtSelection(dwFlags, pchText, cch, ppaStart, ppaEnd) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(28, this, "uint", dwFlags, "ptr", pchText, "uint", cch, "ptr*", ppaStart, "ptr*", ppaEnd, "HRESULT")
        return result
    }

    /**
     * The ITextStoreAnchor::InsertEmbeddedAtSelection method inserts an IDataObject object at the insertion point or selection. The client that calls this method must have a read/write lock before inserting an IDataObject into the text stream.
     * @param {Integer} dwFlags Specifies whether the <i>paStart</i> and <i>paEnd</i> parameters will contain the results of the object insertion.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/TSF/tf-ias--constants">TF_IAS_NOQUERY</a> and TF_IAS_QUERYONLY flags cannot be combined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_IAS_NOQUERY"></a><a id="tf_ias_noquery"></a><dl>
     * <dt><b>TF_IAS_NOQUERY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Text is inserted, and the values of the <i>ppaStart</i> and <i>ppaEnd</i> parameters can be <b>NULL</b>. Use this flag if the results of the text insertion are not required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_IAS_QUERYONLY"></a><a id="tf_ias_queryonly"></a><dl>
     * <dt><b>TF_IAS_QUERYONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Text is not inserted, and the <i>ppaStart</i> and <i>ppaEnd</i> anchors contain the results of the text insertion. The values of these parameters depend on how the application implements text insertion into a document.
     * 
     * Use this flag to view the results of the text insertion without actually inserting the text, for example, to predict the results of collapsing or otherwise adjusting a selection.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {IDataObject} pDataObject Pointer to the <b>IDataObject</b> object to be inserted.
     * @param {Pointer<IAnchor>} ppaStart Pointer to the anchor object at the start of the object insertion.
     * @param {Pointer<IAnchor>} ppaEnd Pointer to the anchor object at the end of the object insertion. For an insertion point, this parameter value will be the same as the value of the <i>ppaStart</i> parameter.
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
     * The method could not instantiate one of the anchors <i>paStart</i> or <i>paEnd</i>.
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
     * The <i>pchText</i> parameter is invalid.
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
     * The method could not instantiate one of the anchors <i>paStart</i> or <i>paEnd</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TS_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have a lock on the document.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreanchor-insertembeddedatselection
     */
    InsertEmbeddedAtSelection(dwFlags, pDataObject, ppaStart, ppaEnd) {
        result := ComCall(29, this, "uint", dwFlags, "ptr", pDataObject, "ptr*", ppaStart, "ptr*", ppaEnd, "HRESULT")
        return result
    }
}
