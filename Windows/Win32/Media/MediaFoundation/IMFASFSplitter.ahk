#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to read data from an Advanced Systems Format (ASF) file.
 * @remarks
 * 
  * The ASF splitter accepts ASF packets and extracts the samples for individual streams from them. As with the other ASF base components, the ASF splitter object must be initialized with data from an ASF ContentInfo object before use.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nn-wmcontainer-imfasfsplitter
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFASFSplitter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFASFSplitter
     * @type {Guid}
     */
    static IID => Guid("{12558295-e399-11d5-bc2a-00b0d0f3f4ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "SetFlags", "GetFlags", "SelectStreams", "GetSelectedStreams", "ParseData", "GetNextSample", "Flush", "GetLastSendTime"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IMFASFContentInfo} pIContentInfo 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pIContentInfo) {
        result := ComCall(3, this, "ptr", pIContentInfo, "HRESULT")
        return result
    }

    /**
     * Specifies how the recognizer interprets the ink and determines the result string.Call this function before processing the ink for the first time. Therefore, call the SetFlags function before calling the Process function.
     * @param {Integer} dwFlags The following table lists the flags that you may set to specify how the recognizer interprets the ink and determines the result string. Use the <b>OR</b> operator (|) to combine flags as appropriate.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Bit flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RECOFLAG_AUTOSPACE"></a><a id="recoflag_autospace"></a><dl>
     * <dt><b>RECOFLAG_AUTOSPACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Recognizer uses smart spacing based on language model rules.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RECOFLAG_COERCE"></a><a id="recoflag_coerce"></a><dl>
     * <dt><b>RECOFLAG_COERCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Recognizer coerces the result based on the factoid you specify for the context. For example, if you specify a phone number factoid and the user enters the word "hello", the recognizer may return a random phone number or an empty string. If you do not specify this flag, the recognizer returns "hello" as the result.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RECOFLAG_PREFIXOK"></a><a id="recoflag_prefixok"></a><dl>
     * <dt><b>RECOFLAG_PREFIXOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Recognizer supports the recognition of any prefix part of the strings that are defined in the default or specified (factoid) language model.
     * 
     * For example, without this flag, the user writes "handw" and the recognizer returns suggestions (such as "hander" or "handed") that are words that exist in the recognizer lexicon. With the flag, the recognizer may return "handw" as one of the suggestions since it is a valid prefix of the word "handwriting" that exists in the recognizer lexicon.
     * 
     * The Tablet PC Input Panel sets this flag in most cases, except when the input scope is IS_DEFAULT (or no input scope) or when there is no user word list or regular expression.
     * 
     * Recognizers of East Asian characters should return E_INVALIDARG when a caller passes in this flag.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RECOFLAG_LINEMODE"></a><a id="recoflag_linemode"></a><dl>
     * <dt><b>RECOFLAG_LINEMODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer does not split lines but must still do character and word separation. This is the same as lined mode, except that there is no guide, and all ink is assumed to be in a single line. When this flag is set, a guide, if set, is ignored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RECOFLAG_SINGLESEG"></a><a id="recoflag_singleseg"></a><dl>
     * <dt><b>RECOFLAG_SINGLESEG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disables multiple segmentation. By default, the recognizer returns multiple segmentations (alternates) for the ink.
     * 
     * For example, if you write "together" as separate strokes, the recognizer may segment the ink as "to get her", "to gather", or "together". Set this flag if you do not need multiple segmentations of the ink when you query for alternates. This improves performance and reduces memory usage.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RECOFLAG_WORDMODE"></a><a id="recoflag_wordmode"></a><dl>
     * <dt><b>RECOFLAG_WORDMODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Recognizer treats the ink as a single word. For example, if the context contains "to get her", the recognizer returns "together".
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>HRESULT value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
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
     * The flag is invalid.
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
     * The recognizer does not support this function.
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
     * Unable to allocate memory to complete the operation.
     * 
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is invalid or one of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-setflags
     */
    SetFlags(dwFlags) {
        result := ComCall(4, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfsplitter-getflags
     */
    GetFlags(pdwFlags) {
        result := ComCall(5, this, "uint*", pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwStreamNumbers 
     * @param {Integer} wNumStreams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfsplitter-selectstreams
     */
    SelectStreams(pwStreamNumbers, wNumStreams) {
        result := ComCall(6, this, "ushort*", pwStreamNumbers, "ushort", wNumStreams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwStreamNumbers 
     * @param {Pointer<Integer>} pwNumStreams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfsplitter-getselectedstreams
     */
    GetSelectedStreams(pwStreamNumbers, pwNumStreams) {
        result := ComCall(7, this, "ushort*", pwStreamNumbers, "ushort*", pwNumStreams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFMediaBuffer} pIBuffer 
     * @param {Integer} cbBufferOffset 
     * @param {Integer} cbLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfsplitter-parsedata
     */
    ParseData(pIBuffer, cbBufferOffset, cbLength) {
        result := ComCall(8, this, "ptr", pIBuffer, "uint", cbBufferOffset, "uint", cbLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwStatusFlags 
     * @param {Pointer<Integer>} pwStreamNumber 
     * @param {Pointer<IMFSample>} ppISample 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfsplitter-getnextsample
     */
    GetNextSample(pdwStatusFlags, pwStreamNumber, ppISample) {
        result := ComCall(9, this, "int*", pdwStatusFlags, "ushort*", pwStreamNumber, "ptr*", ppISample, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfsplitter-flush
     */
    Flush() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwLastSendTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfsplitter-getlastsendtime
     */
    GetLastSendTime(pdwLastSendTime) {
        result := ComCall(11, this, "uint*", pdwLastSendTime, "HRESULT")
        return result
    }
}
