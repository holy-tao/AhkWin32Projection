#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumStreamIdMap.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is implemented on each output pin of the MPEG-2 Demultiplexer filter (Demux) and is used in program stream mode only.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-impeg2streamidmap
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMPEG2StreamIdMap extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMPEG2StreamIdMap
     * @type {Guid}
     */
    static IID => Guid("{d0e04c47-25b8-4369-925a-362a01d95444}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MapStreamId", "UnmapStreamId", "EnumStreamIdMap"]

    /**
     * The MapStreamId method maps the Stream ID of an elementary stream within an MPEG-2 program stream to a media content type and substream filtering information.
     * @param {Integer} ulStreamId The stream ID of the PES stream.
     * @param {Integer} MediaSampleContent Specifies the contents of the stream. Currently the only value supported is MPEG2_PROGRAM_ELEMENTARY_STREAM (defined as 0x00000001 in axextend.idl).
     * @param {Integer} ulSubstreamFilterValue Specifies which substream within this elementary stream to pass on to the downstream decoder. Only the low-order byte can contain a valid filter value. If <i>iDataOffset</i> = 0, this parameter is ignored.
     * @param {Integer} iDataOffset The byte offset into the payload at which the substream begins.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, an error code is returned. If a Stream ID of MEDIA_PROGRAM_STREAM_MAP, MEDIA_PROGRAM_DIRECTORY_PES_PACKET or MEDIA_PROGRAM_PACK_HEADER is attempted, this method returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-impeg2streamidmap-mapstreamid
     */
    MapStreamId(ulStreamId, MediaSampleContent, ulSubstreamFilterValue, iDataOffset) {
        result := ComCall(3, this, "uint", ulStreamId, "uint", MediaSampleContent, "uint", ulSubstreamFilterValue, "int", iDataOffset, "HRESULT")
        return result
    }

    /**
     * The UnmapStreamId method unmaps the Stream ID mapping created in a previous call to MapStreamId.
     * @param {Integer} culStreamId The number of elements in the <i>pulStreamID</i> array.
     * @param {Pointer<Integer>} pulStreamId Array of Stream IDs mapped for this pin.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-impeg2streamidmap-unmapstreamid
     */
    UnmapStreamId(culStreamId, pulStreamId) {
        pulStreamIdMarshal := pulStreamId is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", culStreamId, pulStreamIdMarshal, pulStreamId, "HRESULT")
        return result
    }

    /**
     * The EnumStreamIdMap method returns a collection of all the mapped Stream IDs on this pin.
     * @returns {IEnumStreamIdMap} <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ienumstreamidmap">IEnumStreamIdMap</a> interface pointer that will be set to the returned collection.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-impeg2streamidmap-enumstreamidmap
     */
    EnumStreamIdMap() {
        result := ComCall(5, this, "ptr*", &ppIEnumStreamIdMap := 0, "HRESULT")
        return IEnumStreamIdMap(ppIEnumStreamIdMap)
    }
}
