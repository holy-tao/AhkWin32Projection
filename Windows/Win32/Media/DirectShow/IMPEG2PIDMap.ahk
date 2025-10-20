#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is implemented on each output pin of the MPEG-2 Demultiplexer filter (Demux) and is used in transport stream mode only.
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-impeg2pidmap
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMPEG2PIDMap extends IUnknown{
    /**
     * The interface identifier for IMPEG2PIDMap
     * @type {Guid}
     */
    static IID => Guid("{afb6c2a1-2c41-11d3-8a60-0000f81e0e4a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} culPID 
     * @param {Pointer<UInt32>} pulPID 
     * @param {Integer} MediaSampleContent 
     * @returns {HRESULT} 
     */
    MapPID(culPID, pulPID, MediaSampleContent) {
        result := ComCall(3, this, "uint", culPID, "uint*", pulPID, "int", MediaSampleContent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} culPID 
     * @param {Pointer<UInt32>} pulPID 
     * @returns {HRESULT} 
     */
    UnmapPID(culPID, pulPID) {
        result := ComCall(4, this, "uint", culPID, "uint*", pulPID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumPIDMap>} pIEnumPIDMap 
     * @returns {HRESULT} 
     */
    EnumPIDMap(pIEnumPIDMap) {
        result := ComCall(5, this, "ptr", pIEnumPIDMap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
