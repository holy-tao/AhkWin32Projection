#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumStreamIdMap.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumStreamIdMap interface is implemented on a standard COM collection of Stream ID maps that have been created by the MPEG-2 Demultiplexer's IMPEG2StreamIdMap::MapStreamId method.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ienumstreamidmap
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IEnumStreamIdMap extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumStreamIdMap
     * @type {Guid}
     */
    static IID => Guid("{945c1566-6202-46fc-96c7-d87f289c6534}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * The Next method retrieves the next n elements in the collection.
     * @param {Integer} cRequest The number of elements to retrieve.
     * @param {Pointer<STREAM_ID_MAP>} pStreamIdMap Address of a user-allocated array containing <i>cRequest</i> elements that will receive the retrieved <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-stream_id_map">STREAM_ID_MAP</a> structures.
     * @param {Pointer<Integer>} pcReceived Receives the number of elements actually retrieved.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails,an <b>HRESULT</b> error code is returned.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ienumstreamidmap-next
     */
    Next(cRequest, pStreamIdMap, pcReceived) {
        pcReceivedMarshal := pcReceived is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cRequest, "ptr", pStreamIdMap, pcReceivedMarshal, pcReceived, "HRESULT")
        return result
    }

    /**
     * The Skip method skip the element at the specified index.
     * @param {Integer} cRecords Index of the element to skip.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, an <b>HRESULT</b> error code is returned.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ienumstreamidmap-skip
     */
    Skip(cRecords) {
        result := ComCall(4, this, "uint", cRecords, "HRESULT")
        return result
    }

    /**
     * The Reset method moves the iterator to the beginning of the collection.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails,an <b>HRESULT</b> error code is returned.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ienumstreamidmap-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Clone method copies the collection.
     * @returns {IEnumStreamIdMap} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ienumstreamidmap">IEnumStreamIdMap</a> interface of the new collection object. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ienumstreamidmap-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppIEnumStreamIdMap := 0, "HRESULT")
        return IEnumStreamIdMap(ppIEnumStreamIdMap)
    }
}
