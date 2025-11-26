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
     * The MapPID method maps one or more PIDs to the pin.
     * @param {Integer} culPID The number of elements in the <i>pulPID</i> array.
     * @param {Pointer<Integer>} pulPID Pointer to an array of size <i>culPID</i>, allocated by the caller. Each element in the array contains a PID to be mapped.
     * @param {Integer} MediaSampleContent Variable of type <a href="https://docs.microsoft.com/windows/desktop/DirectShow/media-sample-content">MEDIA_SAMPLE_CONTENT</a> that specifies the contents of the stream.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-impeg2pidmap-mappid
     */
    MapPID(culPID, pulPID, MediaSampleContent) {
        pulPIDMarshal := pulPID is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", culPID, pulPIDMarshal, pulPID, "int", MediaSampleContent, "HRESULT")
        return result
    }

    /**
     * The UnmapPID method unmaps one or more PIDs.
     * @param {Integer} culPID The number of elements in the <i>pulPID</i> array.
     * @param {Pointer<Integer>} pulPID Pointer to an array of size <i>culPID</i>, allocated by the caller. Each element in the array contains a PID to be unmapped
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-impeg2pidmap-unmappid
     */
    UnmapPID(culPID, pulPID) {
        pulPIDMarshal := pulPID is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", culPID, pulPIDMarshal, pulPID, "HRESULT")
        return result
    }

    /**
     * The EnumPIDMap method returns a collection of all the currently mapped PIDs on this pin.
     * @returns {IEnumPIDMap} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nn-bdaiface-ienumpidmap">IEnumPIDMap</a> pointer. Use this interface to enumerate the mapped PIDs. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-impeg2pidmap-enumpidmap
     */
    EnumPIDMap() {
        result := ComCall(5, this, "ptr*", &pIEnumPIDMap := 0, "HRESULT")
        return IEnumPIDMap(pIEnumPIDMap)
    }
}
