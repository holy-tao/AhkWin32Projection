#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\TS_STATUS.ahk
#Include .\TS_TEXTCHANGE.ahk
#Include ..\..\System\Com\IDataObject.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * The ITextStoreACP2 interface is implemented by the application and is used by the TSF manager to manipulate text streams or text stores in TSF.
 * @see https://docs.microsoft.com/windows/win32/api//textstor/nn-textstor-itextstoreacp2
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITextStoreACP2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextStoreACP2
     * @type {Guid}
     */
    static IID => Guid("{f86ad89f-5fe4-4b8d-bb9f-ef3797a84f1f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AdviseSink", "UnadviseSink", "RequestLock", "GetStatus", "QueryInsert", "GetSelection", "SetSelection", "GetText", "SetText", "GetFormattedText", "GetEmbedded", "QueryInsertEmbedded", "InsertEmbedded", "InsertTextAtSelection", "InsertEmbeddedAtSelection", "RequestSupportedAttrs", "RequestAttrsAtPosition", "RequestAttrsTransitioningAtPosition", "FindNextAttrTransition", "RetrieveRequestedAttrs", "GetEndACP", "GetActiveView", "GetACPFromPoint", "GetTextExt", "GetScreenExt"]

    /**
     * Installs a new advise sink from the ITextStoreACPSink interface or modifies an existing advise sink. The sink interface is specified by the punk parameter.
     * @param {Pointer<Guid>} riid Specifies the sink interface.
     * @param {IUnknown} punk Pointer to the sink interface. Cannot be <b>NULL</b>.
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
     * <dt><b>CONNECT_E_ADVISELIMIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A sink interface pointer could not be obtained.
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
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-advisesink
     */
    AdviseSink(riid, punk, dwMask) {
        result := ComCall(3, this, "ptr", riid, "ptr", punk, "uint", dwMask, "HRESULT")
        return result
    }

    /**
     * Called by an application to indicate that it no longer requires notifications from the TSF manager. The TSF manager will release the sink interface and stop notifications.
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
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-unadvisesink
     */
    UnadviseSink(punk) {
        result := ComCall(4, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * Called by the TSF manager to provide a document lock in order to modify the document. This method calls the OnLockGranted method to create the document lock.
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
     * @returns {HRESULT} If the lock request is synchronous, receives an HRESULT value from the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-itextstoreacpsink-onlockgranted">OnLockGranted</a> method that specifies the result of the lock request.
     * 
     * If the lock request is asynchronous and the result is <a href="https://docs.microsoft.com/windows/desktop/TSF/text-store-return-values">TS_S_ASYNC</a>, the document receives an asynchronous lock. If the lock request is asynchronous and the result is TS_E_SYNCHRONOUS, the document can't be locked synchronously.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-requestlock
     */
    RequestLock(dwLockFlags) {
        result := ComCall(5, this, "uint", dwLockFlags, "int*", &phrSession := 0, "HRESULT")
        return phrSession
    }

    /**
     * Gets the document status. The document status is returned through the TS_STATUS structure.
     * @returns {TS_STATUS} Receives the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_status">TS_STATUS</a> structure that contains the document status. Cannot be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-getstatus
     */
    GetStatus() {
        pdcs := TS_STATUS()
        result := ComCall(6, this, "ptr", pdcs, "HRESULT")
        return pdcs
    }

    /**
     * Determines whether the specified start and end character positions are valid. Use this method to adjust an edit to a document before executing the edit. The method must not return values outside the range of the document.
     * @param {Integer} acpTestStart Starting application character position for inserted text.
     * @param {Integer} acpTestEnd Ending application character position for the inserted text. This value is equal to <i>acpTextStart</i> if the text is inserted at a point instead of replacing selected text.
     * @param {Integer} cch Length of replacement text.
     * @param {Pointer<Integer>} pacpResultStart Returns the new starting application character position of the inserted text. If this parameter is <b>NULL</b>, then text cannot be inserted at the specified position. This value cannot be outside the document range.
     * @param {Pointer<Integer>} pacpResultEnd Returns the new ending application character position of the inserted text. If this parameter is <b>NULL</b>, then <i>pacpResultStart</i> is set to <b>NULL</b> and text cannot be inserted at the specified position. This value cannot be outside the document range.
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
     * The <i>acpTestStart</i> or <i>acpTestEnd</i> parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-queryinsert
     */
    QueryInsert(acpTestStart, acpTestEnd, cch, pacpResultStart, pacpResultEnd) {
        pacpResultStartMarshal := pacpResultStart is VarRef ? "int*" : "ptr"
        pacpResultEndMarshal := pacpResultEnd is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "int", acpTestStart, "int", acpTestEnd, "uint", cch, pacpResultStartMarshal, pacpResultStart, pacpResultEndMarshal, pacpResultEnd, "HRESULT")
        return result
    }

    /**
     * Gets the character position of a text selection in a document. This method supports multiple text selections. The caller must have a read-only lock on the document before calling this method.
     * @param {Integer} ulIndex Specifies the text selections that start the process. If the <a href="https://docs.microsoft.com/windows/desktop/TSF/miscellaneous-framework-constants">TF_DEFAULT_SELECTION</a> constant is specified for this parameter, the input selection starts the process.
     * @param {Integer} ulCount Specifies the maximum number of selections to return.
     * @param {Pointer<TS_SELECTION_ACP>} pSelection Receives the style, start, and end character positions of the selected text. These values are put into the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_selection_acp">TS_SELECTION_ACP</a> structure.
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
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-getselection
     */
    GetSelection(ulIndex, ulCount, pSelection, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", ulIndex, "uint", ulCount, "ptr", pSelection, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * Selects text within the document. The application must have a read/write lock on the document before calling this method.
     * @param {Integer} ulCount Specifies the number of text selections in <i>pSelection</i>.
     * @param {Pointer<TS_SELECTION_ACP>} pSelection Specifies the style, start, and end character positions of the text selected through the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_selection_acp">TS_SELECTION_ACP</a> structure.
     * 
     * When the start and end character positions are equal, the method places a caret at that character position. There can be only one caret at a time in the document.
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
     * <dt><b>TF_E_INVALIDPOS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The character positions specified are beyond the text in the document.
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
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-setselection
     */
    SetSelection(ulCount, pSelection) {
        result := ComCall(9, this, "uint", ulCount, "ptr", pSelection, "HRESULT")
        return result
    }

    /**
     * Gets info about text at a specified character position. This method returns the visible and hidden text and indicates if embedded data is attached to the text.
     * @param {Integer} acpStart Specifies the starting character position.
     * @param {Integer} acpEnd Specifies the ending character position. If this parameter is 1, then return all text in the text store.
     * @param {PWSTR} pchPlain Specifies the buffer to receive the plain text data. If this parameter is <b>NULL</b>, then the <i>cchPlainReq</i> parameter must be 0.
     * @param {Integer} cchPlainReq Specifies the number of plain text characters passed to the method.
     * @param {Pointer<Integer>} pcchPlainRet Receives the number of characters copied into the plain text buffer. This parameter cannot be <b>NULL</b>. Use a parameter if values are not required.
     * @param {Pointer<TS_RUNINFO>} prgRunInfo Receives an array of <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_runinfo">TS_RUNINFO</a> structures. May be <b>NULL</b> only if <i>cRunInfoReq</i> = 0.
     * @param {Integer} cRunInfoReq Specifies the size, in characters, of the text run buffer.
     * @param {Pointer<Integer>} pcRunInfoRet Receives the number of <b>TS_RUNINFO</b> structures written to the text run buffer. This parameter cannot be <b>NULL</b>.
     * @param {Pointer<Integer>} pacpNext Receives the character position of the next unread character. Cannot be <b>NULL</b>.
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
     * <dt><b>TF_E_INVALIDPOS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>acpStart</i> or <i>acpEnd</i> parameters are outside of the document text.
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
     * The caller does not have a read-only lock on the document.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-gettext
     */
    GetText(acpStart, acpEnd, pchPlain, cchPlainReq, pcchPlainRet, prgRunInfo, cRunInfoReq, pcRunInfoRet, pacpNext) {
        pchPlain := pchPlain is String ? StrPtr(pchPlain) : pchPlain

        pcchPlainRetMarshal := pcchPlainRet is VarRef ? "uint*" : "ptr"
        pcRunInfoRetMarshal := pcRunInfoRet is VarRef ? "uint*" : "ptr"
        pacpNextMarshal := pacpNext is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "int", acpStart, "int", acpEnd, "ptr", pchPlain, "uint", cchPlainReq, pcchPlainRetMarshal, pcchPlainRet, "ptr", prgRunInfo, "uint", cRunInfoReq, pcRunInfoRetMarshal, pcRunInfoRet, pacpNextMarshal, pacpNext, "HRESULT")
        return result
    }

    /**
     * Sets the text selection to the supplied character positions.
     * @param {Integer} dwFlags If set to the value of <b>TS_ST_CORRECTION</b>, the text is a transform (correction) of existing content, and any special text markup information (metadata) is retained, such as .wav file data or a language identifier. The client defines the type of markup information to be retained.
     * @param {Integer} acpStart Specifies the starting character position of the text to replace.
     * @param {Integer} acpEnd Specifies the ending character position of the text to replace. This parameter is ignored if the value is 1.
     * @param {PWSTR} pchText Specifies the pointer to the replacement text. The text string does not have to be <b>NULL</b> terminated, because the text character count is specified in the <i>cch</i> parameter.
     * @param {Integer} cch Specifies the number of characters in the replacement text.
     * @returns {TS_TEXTCHANGE} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_textchange">TS_TEXTCHANGE</a> structure with the following data.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="acpStart"></a><a id="acpstart"></a><a id="ACPSTART"></a><dl>
     * <dt><b>acpStart</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The starting application character position before the text is inserted into the document.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="acpOldEnd"></a><a id="acpoldend"></a><a id="ACPOLDEND"></a><dl>
     * <dt><b>acpOldEnd</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ending position before the text is inserted into the document. This value is the same as <i>acpStart</i> for an insertion point. If this value is different from <i>acpStart</i>, then text was selected prior to the text insertion.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="acpNewEnd"></a><a id="acpnewend"></a><a id="ACPNEWEND"></a><dl>
     * <dt><b>acpNewEnd</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ending position after the text insertion occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-settext
     */
    SetText(dwFlags, acpStart, acpEnd, pchText, cch) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        pChange := TS_TEXTCHANGE()
        result := ComCall(11, this, "uint", dwFlags, "int", acpStart, "int", acpEnd, "ptr", pchText, "uint", cch, "ptr", pChange, "HRESULT")
        return pChange
    }

    /**
     * Gets formatted text data about a specified text string. The caller must have a read/write lock on the document before calling this method.
     * @param {Integer} acpStart Specifies the starting character position of the text to get in the document.
     * @param {Integer} acpEnd Specifies the ending character position of the text to get in the document. This parameter is ignored if the value is 1.
     * @returns {IDataObject} Receives the pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> object that contains the formatted text.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-getformattedtext
     */
    GetFormattedText(acpStart, acpEnd) {
        result := ComCall(12, this, "int", acpStart, "int", acpEnd, "ptr*", &ppDataObject := 0, "HRESULT")
        return IDataObject(ppDataObject)
    }

    /**
     * Gets an embedded document.
     * @param {Integer} acpPos Contains the character position, within the document, from where the object is obtained.
     * @param {Pointer<Guid>} rguidService 
     * @param {Pointer<Guid>} riid Specifies the interface type requested.
     * @returns {IUnknown} Pointer to an <b>IUnknown</b> pointer that receives the requested interface.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-getembedded
     */
    GetEmbedded(acpPos, rguidService, riid) {
        result := ComCall(13, this, "int", acpPos, "ptr", rguidService, "ptr", riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * Gets a value indicating whether the specified object can be inserted into the document.
     * @param {Pointer<Guid>} pguidService Pointer to the object type. Can be <b>NULL</b>.
     * @param {Pointer<FORMATETC>} pFormatEtc Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure that contains format data of the object. This parameter cannot be <b>NULL</b> if the <i>pguidService</i> parameter is <b>NULL</b>.
     * @returns {BOOL} Receives <b>TRUE</b> if the object type can be inserted into the document or <b>FALSE</b> if the object type can't be inserted into the document.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-queryinsertembedded
     */
    QueryInsertEmbedded(pguidService, pFormatEtc) {
        result := ComCall(14, this, "ptr", pguidService, "ptr", pFormatEtc, "int*", &pfInsertable := 0, "HRESULT")
        return pfInsertable
    }

    /**
     * Inserts an embedded object at the specified character.
     * @param {Integer} dwFlags Must be TS_IE_CORRECTION.
     * @param {Integer} acpStart Contains the starting character position where the object is inserted.
     * @param {Integer} acpEnd Contains the ending character position where the object is inserted.
     * @param {IDataObject} pDataObject Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface that contains data about the object inserted.
     * @returns {TS_TEXTCHANGE} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_textchange">TS_TEXTCHANGE</a> structure that receives data about the modified text.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-insertembedded
     */
    InsertEmbedded(dwFlags, acpStart, acpEnd, pDataObject) {
        pChange := TS_TEXTCHANGE()
        result := ComCall(15, this, "uint", dwFlags, "int", acpStart, "int", acpEnd, "ptr", pDataObject, "ptr", pChange, "HRESULT")
        return pChange
    }

    /**
     * Inserts text at the insertion point or selection. A caller must have a read/write lock on the document before inserting text.
     * @param {Integer} dwFlags 
     * @param {PWSTR} pchText 
     * @param {Integer} cch 
     * @param {Pointer<Integer>} pacpStart 
     * @param {Pointer<Integer>} pacpEnd 
     * @param {Pointer<TS_TEXTCHANGE>} pChange 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-inserttextatselection
     */
    InsertTextAtSelection(dwFlags, pchText, cch, pacpStart, pacpEnd, pChange) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        pacpStartMarshal := pacpStart is VarRef ? "int*" : "ptr"
        pacpEndMarshal := pacpEnd is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, "uint", dwFlags, "ptr", pchText, "uint", cch, pacpStartMarshal, pacpStart, pacpEndMarshal, pacpEnd, "ptr", pChange, "HRESULT")
        return result
    }

    /**
     * Inserts an IDataObject at the insertion point or selection. The client that calls this method must have a read/write lock before inserting an IDataObject object into the document.
     * @param {Integer} dwFlags Specifies whether the <i>pacpStart</i> and <i>pacpEnd</i> parameters and the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_textchange">TS_TEXTCHANGE</a> structure will contain the results of the object insertion.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/TSF/tf-ias--constants">TF_IAS_NOQUERY</a> and TF_IAS_QUERYONLY flags cannot be combined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="0"></a><dl>
     * <dt><b>0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Text insertion will occur, and the <i>pacpStart</i> and <i>pacpEnd</i> parameters will contain the results of the text insertion. The <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_textchange">TS_TEXTCHANGE</a> structure must be filled with this flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_IAS_NOQUERY"></a><a id="tf_ias_noquery"></a><dl>
     * <dt><b>TF_IAS_NOQUERY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Text is inserted, the values of the <i>pacpStart</i> and <i>pacpEnd</i> parameters can be <b>NULL</b>, and the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_textchange">TS_TEXTCHANGE</a> structure must be filled. Use this flag if the results of the text insertion are not required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_IAS_QUERYONLY"></a><a id="tf_ias_queryonly"></a><dl>
     * <dt><b>TF_IAS_QUERYONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Text is not inserted, and the values for the <i>pacpStart</i> and <i>pacpEnd</i> parameter contain the results of the text insertion. The values of these parameters depend on how the application implements text insertion into a document. For more information, see the Remarks section.
     * 
     * Use this flag to view the results of the text insertion without actually inserting the text, for example, to predict the results of collapsing or otherwise adjusting a selection. It is not required that you fill the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_textchange">TS_TEXTCHANGE</a> structure with this flag.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {IDataObject} pDataObject Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> object to be inserted.
     * @param {Pointer<Integer>} pacpStart Pointer to the starting application character position where the object insertion will occur.
     * @param {Pointer<Integer>} pacpEnd Pointer to the ending application character position where the object insertion will occur. This parameter value will be the same as the value of the <i>pacpStart</i> parameter for an insertion point.
     * @param {Pointer<TS_TEXTCHANGE>} pChange Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_textchange">TS_TEXTCHANGE</a> structure with the following members.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="acpStart"></a><a id="acpstart"></a><a id="ACPSTART"></a><dl>
     * <dt><b>acpStart</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The starting application character position before the object is inserted into the document.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="acpOldEnd"></a><a id="acpoldend"></a><a id="ACPOLDEND"></a><dl>
     * <dt><b>acpOldEnd</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ending application character position before the object is inserted into the document. This value is the same as <b>acpStart</b> for an insertion point. If this value is different from <b>acpStart</b>, then text was selected prior to the object insertion.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="acpNewEnd"></a><a id="acpnewend"></a><a id="ACPNEWEND"></a><dl>
     * <dt><b>acpNewEnd</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ending application character position after the object insertion took place.
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
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-insertembeddedatselection
     */
    InsertEmbeddedAtSelection(dwFlags, pDataObject, pacpStart, pacpEnd, pChange) {
        pacpStartMarshal := pacpStart is VarRef ? "int*" : "ptr"
        pacpEndMarshal := pacpEnd is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, "uint", dwFlags, "ptr", pDataObject, pacpStartMarshal, pacpStart, pacpEndMarshal, pacpEnd, "ptr", pChange, "HRESULT")
        return result
    }

    /**
     * Get the attributes that are supported in the document.
     * @param {Integer} dwFlags Specifies whether a subsequent call to the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-itextstoreacp2-retrieverequestedattrs">RetrieveRequestedAttrs</a> method will contain the supported attributes. If the <b>TS_ATTR_FIND_WANT_VALUE</b> flag is specified, the default attribute values will be those in the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_attrval">TS_ATTRVAL</a> structure after the subsequent call to <b>RetrieveRequestedAttrs</b>. If any other flag is specified for this parameter, the method only verifies that the attribute is supported and that the <b>varValue</b> member of the <b>TS_ATTRVAL</b> structure is set to <b>VT_EMPTY</b>.
     * @param {Integer} cFilterAttrs Specifies the number of supported attributes to obtain.
     * @param {Pointer<Guid>} paFilterAttrs Pointer to the <a href="https://docs.microsoft.com/windows/desktop/TSF/ts-attrid">TS_ATTRID</a> data type that specifies the attribute to verify. The method returns only the attributes specified by <b>TS_ATTRID</b>, even though other attributes can be supported.
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
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-requestsupportedattrs
     */
    RequestSupportedAttrs(dwFlags, cFilterAttrs, paFilterAttrs) {
        result := ComCall(18, this, "uint", dwFlags, "uint", cFilterAttrs, "ptr", paFilterAttrs, "HRESULT")
        return result
    }

    /**
     * Gets text attributes at the specified character position.
     * @param {Integer} acpPos Specifies the application character position in the document.
     * @param {Integer} cFilterAttrs Specifies the number of attributes to obtain.
     * @param {Pointer<Guid>} paFilterAttrs Pointer to the <a href="https://docs.microsoft.com/windows/desktop/TSF/ts-attrid">TS_ATTRID</a> data type that specifies the attribute to verify.
     * @param {Integer} dwFlags Specifies attributes for the call to the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-itextstoreacp2-retrieverequestedattrs">RetrieveRequestedAttrs</a> method. If this parameter is not set, the method returns the attributes that start at the specified position. Other possible values for this parameter are the following.
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
     * Obtains the attributes that end at the specified application character position.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TS_ATTR_FIND_WANT_VALUE"></a><a id="ts_attr_find_want_value"></a><dl>
     * <dt><b>TS_ATTR_FIND_WANT_VALUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Obtains the value of the attribute in addition to the attribute. The attribute value is put into the <b>varValue</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_attrval">TS_ATTRVAL</a> structure during the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-itextstoreacp2-retrieverequestedattrs">RetrieveRequestedAttrs</a> method call.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-requestattrsatposition
     */
    RequestAttrsAtPosition(acpPos, cFilterAttrs, paFilterAttrs, dwFlags) {
        result := ComCall(19, this, "int", acpPos, "uint", cFilterAttrs, "ptr", paFilterAttrs, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Gets text attributes transitioning at the specified character position.
     * @param {Integer} acpPos Specifies the application character position in the document.
     * @param {Integer} cFilterAttrs Specifies the number of attributes to obtain.
     * @param {Pointer<Guid>} paFilterAttrs Pointer to the <a href="https://docs.microsoft.com/windows/desktop/TSF/ts-attrid">TS_ATTRID</a> data type that specifies the attribute to verify.
     * @param {Integer} dwFlags Specifies attributes for the call to the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-itextstoreacp2-retrieverequestedattrs">RetrieveRequestedAttrs</a> method. If this parameter is not set, the method returns the attributes that start at the specified position. Other possible values for this parameter are the following.
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
     * Obtains the attributes that end at the specified application character position.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TS_ATTR_FIND_WANT_VALUE"></a><a id="ts_attr_find_want_value"></a><dl>
     * <dt><b>TS_ATTR_FIND_WANT_VALUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Obtains the value of the attribute in addition to the attribute. The attribute value is put into the <b>varValue</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_attrval">TS_ATTRVAL</a> structure during the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nf-textstor-itextstoreacp2-retrieverequestedattrs">RetrieveRequestedAttrs</a> method call.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-requestattrstransitioningatposition
     */
    RequestAttrsTransitioningAtPosition(acpPos, cFilterAttrs, paFilterAttrs, dwFlags) {
        result := ComCall(20, this, "int", acpPos, "uint", cFilterAttrs, "ptr", paFilterAttrs, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Determines the character position where a transition occurs in an attribute value. The specified attribute to check is application-dependent.
     * @param {Integer} acpStart Specifies the character position to start the search for an attribute transition.
     * @param {Integer} acpHalt Specifies the character position to end the search for an attribute transition.
     * @param {Integer} cFilterAttrs Specifies the number of attributes to check.
     * @param {Pointer<Guid>} paFilterAttrs Pointer to the <a href="https://docs.microsoft.com/windows/desktop/TSF/ts-attrid">TS_ATTRID</a> data type that specifies the attribute to check.
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
     * The method searches backward.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TS_ATTR_FIND_WANT_OFFSET"></a><a id="ts_attr_find_want_offset"></a><dl>
     * <dt><b>TS_ATTR_FIND_WANT_OFFSET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>plFoundOffset</i> parameter receives the character offset of the attribute transition from <i>acpStart</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pacpNext Receives the next character position to check for an attribute transition.
     * @param {Pointer<BOOL>} pfFound Receives a Boolean value of <b>TRUE</b> if an attribute transition was found, otherwise <b>FALSE</b> is returned.
     * @param {Pointer<Integer>} plFoundOffset Receives the character position of the attribute transition (not ACP positions). If TS_ATTR_FIND_WANT_OFFSET flag is set in <i>dwFlags</i>, receives the character offset of the attribute transition from <i>acpStart</i>.
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
     * <dt><b>TS_E_INVALIDPOS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The character positions specified are beyond the text in the document.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-findnextattrtransition
     */
    FindNextAttrTransition(acpStart, acpHalt, cFilterAttrs, paFilterAttrs, dwFlags, pacpNext, pfFound, plFoundOffset) {
        pacpNextMarshal := pacpNext is VarRef ? "int*" : "ptr"
        pfFoundMarshal := pfFound is VarRef ? "int*" : "ptr"
        plFoundOffsetMarshal := plFoundOffset is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, "int", acpStart, "int", acpHalt, "uint", cFilterAttrs, "ptr", paFilterAttrs, "uint", dwFlags, pacpNextMarshal, pacpNext, pfFoundMarshal, pfFound, plFoundOffsetMarshal, plFoundOffset, "HRESULT")
        return result
    }

    /**
     * Gets the attributes returned by a call to an attribute request method.
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
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-retrieverequestedattrs
     */
    RetrieveRequestedAttrs(ulCount, paAttrVals, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, "uint", ulCount, "ptr", paAttrVals, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * Gets the number of characters in a document.
     * @returns {Integer} Receives the character position of the last character in the document plus one.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-getendacp
     */
    GetEndACP() {
        result := ComCall(23, this, "int*", &pacp := 0, "HRESULT")
        return pacp
    }

    /**
     * Gets a TsViewCookie that represents the current active view.
     * @returns {Integer} Receives the <b>TsViewCookie</b> data type that specifies the current active view.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-getactiveview
     */
    GetActiveView() {
        result := ComCall(24, this, "uint*", &pvcView := 0, "HRESULT")
        return pvcView
    }

    /**
     * Converts a point in screen coordinates to an application character position.
     * @param {Integer} vcView Specifies the context view.
     * @param {Pointer<POINT>} ptScreen Pointer to the <b>POINT</b> structure with the screen coordinates of the point.
     * @param {Integer} dwFlags Specifies the character position to return based upon the screen coordinates of the point relative to a character bounding box. By default, the character position returned is the character bounding box containing the screen coordinates of the point. If the point is outside a character bounding box, the method returns <b>NULL</b> or <a href="https://docs.microsoft.com/windows/desktop/TSF/manager-return-values">TF_E_INVALIDPOINT</a>. Other bit flags for this parameter are as follows.
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
     * If the screen coordinates of the point are contained in a character bounding box, the character position returned is the bounding edge closest to the screen coordinates of the point.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GXFPF_NEAREST"></a><a id="gxfpf_nearest"></a><dl>
     * <dt><b>GXFPF_NEAREST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the screen coordinates of the point are not contained in a character bounding box, the closest character position is returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} Receives the character position that corresponds to the screen coordinates of the point.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-getacpfrompoint
     */
    GetACPFromPoint(vcView, ptScreen, dwFlags) {
        result := ComCall(25, this, "uint", vcView, "ptr", ptScreen, "uint", dwFlags, "int*", &pacp := 0, "HRESULT")
        return pacp
    }

    /**
     * Gets the bounding box, in screen coordinates, of the text at a specified character position. The caller must have a read-only lock on the document before calling this method.
     * @param {Integer} vcView Specifies the context view.
     * @param {Integer} acpStart Specifies the starting character position of the text to get in the document.
     * @param {Integer} acpEnd Specifies the ending character position of the text to get in the document.
     * @param {Pointer<RECT>} prc Receives the bounding box in screen coordinates of the text at the specified character positions.
     * @param {Pointer<BOOL>} pfClipped Receives a Boolean value that specifies if the text in the bounding box has been clipped. If this parameter is <b>TRUE</b>, the bounding box contains clipped text and does not include the entire requested text range. The bounding box is clipped because the requested range is not visible.
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
     * <dt><b>TS_E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified start and end character positions are equal.
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
     * The range specified by the <i>acpStart</i> and <i>acpEnd</i> parameters extends past the beginning or end of the document.
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
     * The application has not calculated a text layout.
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
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-gettextext
     */
    GetTextExt(vcView, acpStart, acpEnd, prc, pfClipped) {
        pfClippedMarshal := pfClipped is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, "uint", vcView, "int", acpStart, "int", acpEnd, "ptr", prc, pfClippedMarshal, pfClipped, "HRESULT")
        return result
    }

    /**
     * Gets the bounding box screen coordinates of the display surface where the text stream is rendered.
     * @param {Integer} vcView Specifies the context view.
     * @returns {RECT} Receives the bounding box screen coordinates of the display surface of the document.
     * @see https://docs.microsoft.com/windows/win32/api//textstor/nf-textstor-itextstoreacp2-getscreenext
     */
    GetScreenExt(vcView) {
        prc := RECT()
        result := ComCall(27, this, "uint", vcView, "ptr", prc, "HRESULT")
        return prc
    }
}
