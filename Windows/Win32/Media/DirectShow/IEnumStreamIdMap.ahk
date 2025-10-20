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
     * 
     * @param {Integer} cRequest 
     * @param {Pointer<STREAM_ID_MAP>} pStreamIdMap 
     * @param {Pointer<UInt32>} pcReceived 
     * @returns {HRESULT} 
     */
    Next(cRequest, pStreamIdMap, pcReceived) {
        result := ComCall(3, this, "uint", cRequest, "ptr", pStreamIdMap, "uint*", pcReceived, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cRecords 
     * @returns {HRESULT} 
     */
    Skip(cRecords) {
        result := ComCall(4, this, "uint", cRecords, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumStreamIdMap>} ppIEnumStreamIdMap 
     * @returns {HRESULT} 
     */
    Clone(ppIEnumStreamIdMap) {
        result := ComCall(6, this, "ptr", ppIEnumStreamIdMap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
