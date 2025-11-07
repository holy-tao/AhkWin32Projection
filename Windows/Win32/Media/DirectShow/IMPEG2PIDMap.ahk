#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumPIDMap.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is implemented on each output pin of the MPEG-2 Demultiplexer filter (Demux) and is used in transport stream mode only.
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-impeg2pidmap
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMPEG2PIDMap extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MapPID", "UnmapPID", "EnumPIDMap"]

    /**
     * 
     * @param {Integer} culPID 
     * @param {Pointer<Integer>} pulPID 
     * @param {Integer} MediaSampleContent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-impeg2pidmap-mappid
     */
    MapPID(culPID, pulPID, MediaSampleContent) {
        pulPIDMarshal := pulPID is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", culPID, pulPIDMarshal, pulPID, "int", MediaSampleContent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} culPID 
     * @param {Pointer<Integer>} pulPID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-impeg2pidmap-unmappid
     */
    UnmapPID(culPID, pulPID) {
        pulPIDMarshal := pulPID is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", culPID, pulPIDMarshal, pulPID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumPIDMap} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-impeg2pidmap-enumpidmap
     */
    EnumPIDMap() {
        result := ComCall(5, this, "ptr*", &pIEnumPIDMap := 0, "HRESULT")
        return IEnumPIDMap(pIEnumPIDMap)
    }
}
