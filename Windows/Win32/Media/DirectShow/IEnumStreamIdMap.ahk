#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} cRequest 
     * @param {Pointer<STREAM_ID_MAP>} pStreamIdMap 
     * @param {Pointer<Integer>} pcReceived 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumstreamidmap-next
     */
    Next(cRequest, pStreamIdMap, pcReceived) {
        pcReceivedMarshal := pcReceived is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cRequest, "ptr", pStreamIdMap, pcReceivedMarshal, pcReceived, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cRecords 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumstreamidmap-skip
     */
    Skip(cRecords) {
        result := ComCall(4, this, "uint", cRecords, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumstreamidmap-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumStreamIdMap>} ppIEnumStreamIdMap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumstreamidmap-clone
     */
    Clone(ppIEnumStreamIdMap) {
        result := ComCall(6, this, "ptr*", ppIEnumStreamIdMap, "HRESULT")
        return result
    }
}
