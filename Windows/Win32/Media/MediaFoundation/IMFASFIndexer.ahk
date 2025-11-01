#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to work with indexes in Systems Format (ASF) files.
 * @remarks
 * 
  * You can use the indexer object to read an existing ASF index or write a new index. The index object has two mutually exclusive modes: read mode and write mode. To set the mode, call <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfindexer-setflags">SetFlags</a>. 
  * 
  * Use the following methods to configure the indexer object  (both modes):
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfindexer-initialize">Initialize</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfindexer-setflags">SetFlags</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfindexer-setindexbytestreams">SetIndexByteStreams</a>
  * </li>
  * </ul>
  * Use the following methods to read an existing index:
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfindexer-getflags">GetFlags</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfindexer-getindexbytestreamcount">GetIndexByteStreamCount</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfindexer-getindexposition">GetIndexPosition</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfindexer-getindexstatus">GetIndexStatus</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfindexer-getseekpositionforvalue">GetSeekPositionForValue</a>
  * </li>
  * </ul>
  * Use the following methods to write an index:
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfindexer-commitindex">CommitIndex</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfindexer-generateindexentries">GenerateIndexEntries</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfindexer-getcompletedindex">GetCompletedIndex</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfindexer-getindexwritespace">GetIndexWriteSpace</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfindexer-setindexstatus">SetIndexStatus</a>
  * </li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nn-wmcontainer-imfasfindexer
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFASFIndexer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFASFIndexer
     * @type {Guid}
     */
    static IID => Guid("{53590f48-dc3b-4297-813f-787761ad7b3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFlags", "GetFlags", "Initialize", "GetIndexPosition", "SetIndexByteStreams", "GetIndexByteStreamCount", "GetIndexStatus", "SetIndexStatus", "GetSeekPositionForValue", "GenerateIndexEntries", "CommitIndex", "GetIndexWriteSpace", "GetCompletedIndex"]

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
        result := ComCall(3, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfindexer-getflags
     */
    GetFlags(pdwFlags) {
        result := ComCall(4, this, "uint*", pdwFlags, "HRESULT")
        return result
    }

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
        result := ComCall(5, this, "ptr", pIContentInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFASFContentInfo} pIContentInfo 
     * @param {Pointer<Integer>} pcbIndexOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfindexer-getindexposition
     */
    GetIndexPosition(pIContentInfo, pcbIndexOffset) {
        result := ComCall(6, this, "ptr", pIContentInfo, "uint*", pcbIndexOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFByteStream>} ppIByteStreams 
     * @param {Integer} cByteStreams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfindexer-setindexbytestreams
     */
    SetIndexByteStreams(ppIByteStreams, cByteStreams) {
        result := ComCall(7, this, "ptr*", ppIByteStreams, "uint", cByteStreams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcByteStreams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfindexer-getindexbytestreamcount
     */
    GetIndexByteStreamCount(pcByteStreams) {
        result := ComCall(8, this, "uint*", pcByteStreams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ASF_INDEX_IDENTIFIER>} pIndexIdentifier 
     * @param {Pointer<BOOL>} pfIsIndexed 
     * @param {Pointer<Integer>} pbIndexDescriptor 
     * @param {Pointer<Integer>} pcbIndexDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfindexer-getindexstatus
     */
    GetIndexStatus(pIndexIdentifier, pfIsIndexed, pbIndexDescriptor, pcbIndexDescriptor) {
        result := ComCall(9, this, "ptr", pIndexIdentifier, "ptr", pfIsIndexed, "char*", pbIndexDescriptor, "uint*", pcbIndexDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbIndexDescriptor 
     * @param {Integer} cbIndexDescriptor 
     * @param {BOOL} fGenerateIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfindexer-setindexstatus
     */
    SetIndexStatus(pbIndexDescriptor, cbIndexDescriptor, fGenerateIndex) {
        result := ComCall(10, this, "char*", pbIndexDescriptor, "uint", cbIndexDescriptor, "int", fGenerateIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} pvarValue 
     * @param {Pointer<ASF_INDEX_IDENTIFIER>} pIndexIdentifier 
     * @param {Pointer<Integer>} pcbOffsetWithinData 
     * @param {Pointer<Integer>} phnsApproxTime 
     * @param {Pointer<Integer>} pdwPayloadNumberOfStreamWithinPacket 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfindexer-getseekpositionforvalue
     */
    GetSeekPositionForValue(pvarValue, pIndexIdentifier, pcbOffsetWithinData, phnsApproxTime, pdwPayloadNumberOfStreamWithinPacket) {
        result := ComCall(11, this, "ptr", pvarValue, "ptr", pIndexIdentifier, "uint*", pcbOffsetWithinData, "int64*", phnsApproxTime, "uint*", pdwPayloadNumberOfStreamWithinPacket, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFSample} pIASFPacketSample 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfindexer-generateindexentries
     */
    GenerateIndexEntries(pIASFPacketSample) {
        result := ComCall(12, this, "ptr", pIASFPacketSample, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFASFContentInfo} pIContentInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfindexer-commitindex
     */
    CommitIndex(pIContentInfo) {
        result := ComCall(13, this, "ptr", pIContentInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbIndexWriteSpace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfindexer-getindexwritespace
     */
    GetIndexWriteSpace(pcbIndexWriteSpace) {
        result := ComCall(14, this, "uint*", pcbIndexWriteSpace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFMediaBuffer} pIIndexBuffer 
     * @param {Integer} cbOffsetWithinIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfindexer-getcompletedindex
     */
    GetCompletedIndex(pIIndexBuffer, cbOffsetWithinIndex) {
        result := ComCall(15, this, "ptr", pIIndexBuffer, "uint", cbOffsetWithinIndex, "HRESULT")
        return result
    }
}
