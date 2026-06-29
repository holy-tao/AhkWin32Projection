#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumStreamIdMap.ahk" { IEnumStreamIdMap }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface is implemented on each output pin of the MPEG-2 Demultiplexer filter (Demux) and is used in program stream mode only.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-impeg2streamidmap
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IMPEG2StreamIdMap extends IUnknown {
    /**
     * The interface identifier for IMPEG2StreamIdMap
     * @type {Guid}
     */
    static IID := Guid("{d0e04c47-25b8-4369-925a-362a01d95444}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMPEG2StreamIdMap interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        MapStreamId     : IntPtr
        UnmapStreamId   : IntPtr
        EnumStreamIdMap : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMPEG2StreamIdMap.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The MapStreamId method maps the Stream ID of an elementary stream within an MPEG-2 program stream to a media content type and substream filtering information.
     * @remarks
     * The Stream ID mapped by this method is the stream ID in the PES header. Substream filtering is most commonly used to provide multiple channels on a single audio stream.
     * @param {Integer} ulStreamId The stream ID of the PES stream.
     * @param {Integer} MediaSampleContent Specifies the contents of the stream. Currently the only value supported is MPEG2_PROGRAM_ELEMENTARY_STREAM (defined as 0x00000001 in axextend.idl).
     * @param {Integer} ulSubstreamFilterValue Specifies which substream within this elementary stream to pass on to the downstream decoder. Only the low-order byte can contain a valid filter value. If <i>iDataOffset</i> = 0, this parameter is ignored.
     * @param {Integer} iDataOffset The byte offset into the payload at which the substream begins.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, an error code is returned. If a Stream ID of MEDIA_PROGRAM_STREAM_MAP, MEDIA_PROGRAM_DIRECTORY_PES_PACKET or MEDIA_PROGRAM_PACK_HEADER is attempted, this method returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-impeg2streamidmap-mapstreamid
     */
    MapStreamId(ulStreamId, MediaSampleContent, ulSubstreamFilterValue, iDataOffset) {
        result := ComCall(3, this, "uint", ulStreamId, "uint", MediaSampleContent, "uint", ulSubstreamFilterValue, "int", iDataOffset, "HRESULT")
        return result
    }

    /**
     * The UnmapStreamId method unmaps the Stream ID mapping created in a previous call to MapStreamId.
     * @remarks
     * There is typically only one stream ID mapped to a given pin, therefore <i>pulStreamID</i> will typically contain a single element.
     * @param {Integer} culStreamId The number of elements in the <i>pulStreamID</i> array.
     * @param {Pointer<Integer>} pulStreamId Array of Stream IDs mapped for this pin.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-impeg2streamidmap-unmapstreamid
     */
    UnmapStreamId(culStreamId, pulStreamId) {
        pulStreamIdMarshal := pulStreamId is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", culStreamId, pulStreamIdMarshal, pulStreamId, "HRESULT")
        return result
    }

    /**
     * The EnumStreamIdMap method returns a collection of all the mapped Stream IDs on this pin.
     * @remarks
     * Currently, there is only one stream ID mapped to a given pin, therefore this collection will contain a single item.
     * @returns {IEnumStreamIdMap} <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ienumstreamidmap">IEnumStreamIdMap</a> interface pointer that will be set to the returned collection.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-impeg2streamidmap-enumstreamidmap
     */
    EnumStreamIdMap() {
        result := ComCall(5, this, "ptr*", &ppIEnumStreamIdMap := 0, "HRESULT")
        return IEnumStreamIdMap(ppIEnumStreamIdMap)
    }

    Query(iid) {
        if (IMPEG2StreamIdMap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MapStreamId := CallbackCreate(GetMethod(implObj, "MapStreamId"), flags, 5)
        this.vtbl.UnmapStreamId := CallbackCreate(GetMethod(implObj, "UnmapStreamId"), flags, 3)
        this.vtbl.EnumStreamIdMap := CallbackCreate(GetMethod(implObj, "EnumStreamIdMap"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MapStreamId)
        CallbackFree(this.vtbl.UnmapStreamId)
        CallbackFree(this.vtbl.EnumStreamIdMap)
    }
}
