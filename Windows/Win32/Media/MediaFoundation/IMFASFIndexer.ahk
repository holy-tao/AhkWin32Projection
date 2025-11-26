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
     * Sets indexer options.
     * @param {Integer} dwFlags Bitwise OR of zero or more flags from the [MFASF_INDEXER_FLAGS](./ne-wmcontainer-mfasf_indexer_flags.md) enumeration specifying the indexer options to use.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The indexer object was  initialized before setting flags for it.  For more information, see Remarks.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfindexer-setflags
     */
    SetFlags(dwFlags) {
        result := ComCall(3, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Retrieves the flags that indicate the selected indexer options.
     * @returns {Integer} Receives a bitwise OR of zero or more flags from the [MFASF_INDEXER_FLAGS](./ne-wmcontainer-mfasf_indexer_flags.md) enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfindexer-getflags
     */
    GetFlags() {
        result := ComCall(4, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * Initializes the indexer object.
     * @param {IMFASFContentInfo} pIContentInfo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfcontentinfo">IMFASFContentInfo</a> interface of the ContentInfo object describing the content with which to use the indexer.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_ASF_INVALIDDATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid ASF data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfindexer-initialize
     */
    Initialize(pIContentInfo) {
        result := ComCall(5, this, "ptr", pIContentInfo, "HRESULT")
        return result
    }

    /**
     * Retrieves the offset of the index object from the start of the content.
     * @param {IMFASFContentInfo} pIContentInfo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfcontentinfo">IMFASFContentInfo</a> interface of the ContentInfo object that describes the content.
     * @returns {Integer} Receives the offset of the index relative to the beginning of the content described by the ContentInfo object. This is the position relative to the beginning of the ASF file.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfindexer-getindexposition
     */
    GetIndexPosition(pIContentInfo) {
        result := ComCall(6, this, "ptr", pIContentInfo, "uint*", &pcbIndexOffset := 0, "HRESULT")
        return pcbIndexOffset
    }

    /**
     * Adds byte streams to be indexed.
     * @param {Pointer<IMFByteStream>} ppIByteStreams An array of <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface pointers. To get the byte stream, call <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-mfcreateasfindexerbytestream">MFCreateASFIndexerByteStream</a>.
     * @param {Integer} cByteStreams The number of pointers in the <i>ppIByteStreams</i> array.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_ALREADY_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The indexer object has already been initialized and it  has packets which have been indexed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfindexer-setindexbytestreams
     */
    SetIndexByteStreams(ppIByteStreams, cByteStreams) {
        result := ComCall(7, this, "ptr*", ppIByteStreams, "uint", cByteStreams, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of byte streams that are in use by the indexer object.
     * @returns {Integer} Receives the number of byte streams that are  in use by the indexer object.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfindexer-getindexbytestreamcount
     */
    GetIndexByteStreamCount() {
        result := ComCall(8, this, "uint*", &pcByteStreams := 0, "HRESULT")
        return pcByteStreams
    }

    /**
     * Retrieves the index settings for a specified stream and index type.
     * @param {Pointer<ASF_INDEX_IDENTIFIER>} pIndexIdentifier Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/ns-wmcontainer-asf_index_identifier">ASF_INDEX_IDENTIFIER</a> structure that contains the stream number and index type for which to get the status.
     * @param {Pointer<BOOL>} pfIsIndexed A variable that retrieves a Boolean value specifying whether the index described by <i>pIndexIdentifier</i> has been created.
     * @param {Pointer<Integer>} pbIndexDescriptor A buffer that receives the index descriptor. The index descriptor consists of an <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/ns-wmcontainer-asf_index_descriptor">ASF_INDEX_DESCRIPTOR</a> structure, optionally followed by index-specific data.
     * @param {Pointer<Integer>} pcbIndexDescriptor On input, specifies the size, in bytes, of the buffer that <i>pbIndexDescriptor</i> points to. The value can be zero if <i>pbIndexDescriptor</i> is <b>NULL</b>. On output, receives the size of the index descriptor, in bytes.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer size specified in <i>pcbIndexDescriptor</i> is too small.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfindexer-getindexstatus
     */
    GetIndexStatus(pIndexIdentifier, pfIsIndexed, pbIndexDescriptor, pcbIndexDescriptor) {
        pfIsIndexedMarshal := pfIsIndexed is VarRef ? "int*" : "ptr"
        pbIndexDescriptorMarshal := pbIndexDescriptor is VarRef ? "char*" : "ptr"
        pcbIndexDescriptorMarshal := pcbIndexDescriptor is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", pIndexIdentifier, pfIsIndexedMarshal, pfIsIndexed, pbIndexDescriptorMarshal, pbIndexDescriptor, pcbIndexDescriptorMarshal, pcbIndexDescriptor, "HRESULT")
        return result
    }

    /**
     * Configures the index for a stream.
     * @param {Pointer<Integer>} pbIndexDescriptor The index descriptor to set. The index descriptor is an <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/ns-wmcontainer-asf_index_descriptor">ASF_INDEX_DESCRIPTOR</a> structure, optionally followed by index-specific data.
     * @param {Integer} cbIndexDescriptor The size, in bytes, of the index descriptor.
     * @param {BOOL} fGenerateIndex A Boolean value. Set to <b>TRUE</b> to have the indexer create an index of the type specified for the stream specified in the index descriptor.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At attempt was made to change the index status in a seek-only scenario. For more information, see Remarks.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfindexer-setindexstatus
     */
    SetIndexStatus(pbIndexDescriptor, cbIndexDescriptor, fGenerateIndex) {
        pbIndexDescriptorMarshal := pbIndexDescriptor is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, pbIndexDescriptorMarshal, pbIndexDescriptor, "uint", cbIndexDescriptor, "int", fGenerateIndex, "HRESULT")
        return result
    }

    /**
     * Given a desired seek time, gets the offset from which the client should start reading data.
     * @param {Pointer<PROPVARIANT>} pvarValue The value of the index entry for which to get the position. The format of this value varies depending on the type of index, which is specified in the index identifier. For time-based indexing, the variant type is <b>VT_I8</b> and the value is the desired seek time, in 100-nanosecond units.
     * @param {Pointer<ASF_INDEX_IDENTIFIER>} pIndexIdentifier Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/ns-wmcontainer-asf_index_identifier">ASF_INDEX_IDENTIFIER</a> structure that identifies the stream number and index type.
     * @param {Pointer<Integer>} phnsApproxTime Receives the approximate time stamp of the data that is located at the offset returned in the <i>pcbOffsetWithinData</i> parameter. The accuracy of this value is equal to the indexing interval of the ASF index, typically about 1 second.
     *           
     * 
     * <ul>
     * <li>If the index type specified in <i>pIndexIdentifier</i> is <b>GUID_NULL</b> (time indexing), this parameter can be <b>NULL</b>.
     *               </li>
     * <li>For all other index types, this parameter must be <b>NULL</b>.
     *               </li>
     * </ul>
     * If the approximate time stamp cannot be determined, this parameter receives the value <b>MFASFINDEXER_APPROX_SEEK_TIME_UNKNOWN</b>.
     * @param {Pointer<Integer>} pdwPayloadNumberOfStreamWithinPacket Receives the payload number of the payload that contains the information for the specified stream. Packets can contain multiple payloads, each containing data for a different stream. This parameter can be <b>NULL</b>.
     * @returns {Integer} Receives the offset within the data segment of the ASF Data Object. The offset is in bytes, and is relative to the start of packet 0. The offset gives the starting location from which the client should begin reading from the stream. This location might not correspond exactly to the requested seek time.
     *           
     * 
     * For reverse playback, if no key frame exists after the desired seek position, this parameter receives the value <b>MFASFINDEXER_READ_FOR_REVERSEPLAYBACK_OUTOFDATASEGMENT</b>. In that case, the seek position should be 1 byte pass the end of the data segment.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfindexer-getseekpositionforvalue
     */
    GetSeekPositionForValue(pvarValue, pIndexIdentifier, phnsApproxTime, pdwPayloadNumberOfStreamWithinPacket) {
        phnsApproxTimeMarshal := phnsApproxTime is VarRef ? "int64*" : "ptr"
        pdwPayloadNumberOfStreamWithinPacketMarshal := pdwPayloadNumberOfStreamWithinPacket is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "ptr", pvarValue, "ptr", pIndexIdentifier, "uint*", &pcbOffsetWithinData := 0, phnsApproxTimeMarshal, phnsApproxTime, pdwPayloadNumberOfStreamWithinPacketMarshal, pdwPayloadNumberOfStreamWithinPacket, "HRESULT")
        return pcbOffsetWithinData
    }

    /**
     * Accepts an ASF packet for the file and creates index entries for them.
     * @param {IMFSample} pIASFPacketSample Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface of a media sample that contains the ASF packet.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
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
     * The argument passed in is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The indexer is not initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfindexer-generateindexentries
     */
    GenerateIndexEntries(pIASFPacketSample) {
        result := ComCall(12, this, "ptr", pIASFPacketSample, "HRESULT")
        return result
    }

    /**
     * Adds information about a new index to the ContentInfo object associated with ASF content. You must call this method before copying the index to the content so that the index will be readable by the indexer later.
     * @param {IMFASFContentInfo} pIContentInfo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfcontentinfo">IMFASFContentInfo</a> interface of the ContentInfo object that describes the content.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller made an invalid request. For more information, see Remarks.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfindexer-commitindex
     */
    CommitIndex(pIContentInfo) {
        result := ComCall(13, this, "ptr", pIContentInfo, "HRESULT")
        return result
    }

    /**
     * Retrieves the size, in bytes, of the buffer required to store the completed index.
     * @returns {Integer} Receives the size of the index, in bytes
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfindexer-getindexwritespace
     */
    GetIndexWriteSpace() {
        result := ComCall(14, this, "uint*", &pcbIndexWriteSpace := 0, "HRESULT")
        return pcbIndexWriteSpace
    }

    /**
     * Retrieves the completed index from the ASF indexer object.
     * @param {IMFMediaBuffer} pIIndexBuffer Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface of a media buffer that receives the index data.
     * @param {Integer} cbOffsetWithinIndex The offset of the data to be retrieved, in bytes from the start of the index data. Set to 0 for the first call. If subsequent calls are needed (the buffer is not large enough to hold the entire index), set to the byte following the last one retrieved.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INDEX_NOT_COMMITTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The index was not committed before attempting to get the completed index. For more information, see Remarks.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfindexer-getcompletedindex
     */
    GetCompletedIndex(pIIndexBuffer, cbOffsetWithinIndex) {
        result := ComCall(15, this, "ptr", pIIndexBuffer, "uint", cbOffsetWithinIndex, "HRESULT")
        return result
    }
}
