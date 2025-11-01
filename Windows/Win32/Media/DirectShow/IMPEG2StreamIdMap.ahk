#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} ulStreamId 
     * @param {Integer} MediaSampleContent 
     * @param {Integer} ulSubstreamFilterValue 
     * @param {Integer} iDataOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-impeg2streamidmap-mapstreamid
     */
    MapStreamId(ulStreamId, MediaSampleContent, ulSubstreamFilterValue, iDataOffset) {
        result := ComCall(3, this, "uint", ulStreamId, "uint", MediaSampleContent, "uint", ulSubstreamFilterValue, "int", iDataOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} culStreamId 
     * @param {Pointer<Integer>} pulStreamId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-impeg2streamidmap-unmapstreamid
     */
    UnmapStreamId(culStreamId, pulStreamId) {
        pulStreamIdMarshal := pulStreamId is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", culStreamId, pulStreamIdMarshal, pulStreamId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumStreamIdMap>} ppIEnumStreamIdMap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-impeg2streamidmap-enumstreamidmap
     */
    EnumStreamIdMap(ppIEnumStreamIdMap) {
        result := ComCall(5, this, "ptr*", ppIEnumStreamIdMap, "HRESULT")
        return result
    }
}
