#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\MEDIA_SAMPLE_CONTENT.ahk" { MEDIA_SAMPLE_CONTENT }
#Import ".\IEnumPIDMap.ahk" { IEnumPIDMap }

/**
 * This interface is implemented on each output pin of the MPEG-2 Demultiplexer filter (Demux) and is used in transport stream mode only.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-impeg2pidmap
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IMPEG2PIDMap extends IUnknown {
    /**
     * The interface identifier for IMPEG2PIDMap
     * @type {Guid}
     */
    static IID := Guid("{afb6c2a1-2c41-11d3-8a60-0000f81e0e4a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMPEG2PIDMap interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        MapPID     : IntPtr
        UnmapPID   : IntPtr
        EnumPIDMap : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMPEG2PIDMap.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The MapPID method maps one or more PIDs to the pin.
     * @remarks
     * There may be no more than 255 distinct PIDs mapped at any given time. This includes the PIDs that the Demux maps internally for its own use; this number varies depending on the transport stream. This limitation should not present a problem in practice, because applications will typically map no more than a dozen PIDs on any given transport stream.
     * @param {Integer} culPID The number of elements in the <i>pulPID</i> array.
     * @param {Pointer<Integer>} pulPID Pointer to an array of size <i>culPID</i>, allocated by the caller. Each element in the array contains a PID to be mapped.
     * @param {MEDIA_SAMPLE_CONTENT} MediaSampleContent Variable of type <a href="https://docs.microsoft.com/windows/desktop/DirectShow/media-sample-content">MEDIA_SAMPLE_CONTENT</a> that specifies the contents of the stream.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-impeg2pidmap-mappid
     */
    MapPID(culPID, pulPID, MediaSampleContent) {
        pulPIDMarshal := pulPID is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", culPID, pulPIDMarshal, pulPID, MEDIA_SAMPLE_CONTENT, MediaSampleContent, "HRESULT")
        return result
    }

    /**
     * The UnmapPID method unmaps one or more PIDs.
     * @remarks
     * On output pins for audio and video streams, there will typically be only one PID mapped at any given time. On an output pin such as one delivering the PSI stream to the Transport Information Filter, there may be multiple PIDs mapped to a single pin. Use the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nn-bdaiface-ienumpidmap">IEnumPIDMap</a> methods to determine which PIDs are mapped to the pin, and then fill in the <i>pulPID</i> array with those values.
     * @param {Integer} culPID The number of elements in the <i>pulPID</i> array.
     * @param {Pointer<Integer>} pulPID Pointer to an array of size <i>culPID</i>, allocated by the caller. Each element in the array contains a PID to be unmapped
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-impeg2pidmap-unmappid
     */
    UnmapPID(culPID, pulPID) {
        pulPIDMarshal := pulPID is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", culPID, pulPIDMarshal, pulPID, "HRESULT")
        return result
    }

    /**
     * The EnumPIDMap method returns a collection of all the currently mapped PIDs on this pin.
     * @returns {IEnumPIDMap} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nn-bdaiface-ienumpidmap">IEnumPIDMap</a> pointer. Use this interface to enumerate the mapped PIDs. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-impeg2pidmap-enumpidmap
     */
    EnumPIDMap() {
        result := ComCall(5, this, "ptr*", &pIEnumPIDMap := 0, "HRESULT")
        return IEnumPIDMap(pIEnumPIDMap)
    }

    Query(iid) {
        if (IMPEG2PIDMap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MapPID := CallbackCreate(GetMethod(implObj, "MapPID"), flags, 4)
        this.vtbl.UnmapPID := CallbackCreate(GetMethod(implObj, "UnmapPID"), flags, 3)
        this.vtbl.EnumPIDMap := CallbackCreate(GetMethod(implObj, "EnumPIDMap"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MapPID)
        CallbackFree(this.vtbl.UnmapPID)
        CallbackFree(this.vtbl.EnumPIDMap)
    }
}
