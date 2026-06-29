#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFMediaTimeRange.ahk" { IMFMediaTimeRange }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFByteStream.ahk" { IMFByteStream }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a buffer which contains media data for a IMFMediaSourceExtension.
 * @remarks
 * <b>IMFSourceBuffer</b> is used in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediasourceextension">IMFMediaSourceExtension</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfsourcebuffer
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSourceBuffer extends IUnknown {
    /**
     * The interface identifier for IMFSourceBuffer
     * @type {Guid}
     */
    static IID := Guid("{e2cd3a4b-af25-4d3d-9110-da0e6f8ee877}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSourceBuffer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetUpdating          : IntPtr
        GetBuffered          : IntPtr
        GetTimeStampOffset   : IntPtr
        SetTimeStampOffset   : IntPtr
        GetAppendWindowStart : IntPtr
        SetAppendWindowStart : IntPtr
        GetAppendWindowEnd   : IntPtr
        SetAppendWindowEnd   : IntPtr
        Append               : IntPtr
        AppendByteStream     : IntPtr
        Abort                : IntPtr
        Remove               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSourceBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a value that indicates if Append, AppendByteStream, or Remove is in process.
     * @returns {BOOL} <b>true</b> if <a href="https://docs.microsoft.com/windows/desktop/medfound/imfsourcebuffer-append">Append</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-appendbytestream">AppendByteStream</a>, or <a href="https://docs.microsoft.com/windows/desktop/medfound/imfsourcebuffer-remove">Remove</a>; otherwise, <b>false</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-getupdating
     */
    GetUpdating() {
        result := ComCall(3, this, BOOL)
        return result
    }

    /**
     * Gets the buffered time range.
     * @returns {IMFMediaTimeRange} The buffered time range.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-getbuffered
     */
    GetBuffered() {
        result := ComCall(4, this, "ptr*", &ppBuffered := 0, "HRESULT")
        return IMFMediaTimeRange(ppBuffered)
    }

    /**
     * Gets the timestamp offset for media segments appended to the IMFSourceBuffer.
     * @returns {Float} The timestamp offset.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-gettimestampoffset
     */
    GetTimeStampOffset() {
        result := ComCall(5, this, Float64)
        return result
    }

    /**
     * Sets the timestamp offset for media segments appended to the IMFSourceBuffer.
     * @param {Float} offset 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-settimestampoffset
     */
    SetTimeStampOffset(offset) {
        result := ComCall(6, this, "double", offset, "HRESULT")
        return result
    }

    /**
     * Gets the timestamp for the start of the append window.
     * @returns {Float} The timestamp for the start of the append window.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-getappendwindowstart
     */
    GetAppendWindowStart() {
        result := ComCall(7, this, Float64)
        return result
    }

    /**
     * Sets the timestamp for the start of the append window.
     * @param {Float} time The timestamp for the start of the append window.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-setappendwindowstart
     */
    SetAppendWindowStart(time) {
        result := ComCall(8, this, "double", time, "HRESULT")
        return result
    }

    /**
     * Gets the timestamp for the end of the append window.
     * @returns {Float} The timestamp for the end of the append window.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-getappendwindowend
     */
    GetAppendWindowEnd() {
        result := ComCall(9, this, Float64)
        return result
    }

    /**
     * Sets the timestamp for the end of the append window.
     * @param {Float} time 
     * @returns {HRESULT} The timestamp for the end of the append window.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-setappendwindowend
     */
    SetAppendWindowEnd(time) {
        result := ComCall(10, this, "double", time, "HRESULT")
        return result
    }

    /**
     * Appends the specified media segment to the IMFSourceBuffer.
     * @param {Integer} pData The media data to append.
     * @param {Integer} len The length of the media data stored in <i>pData</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-append
     */
    Append(pData, len) {
        result := ComCall(11, this, "ptr", pData, "uint", len, "HRESULT")
        return result
    }

    /**
     * Appends the media segment from the specified byte stream to the IMFSourceBuffer.
     * @param {IMFByteStream} pStream The media segment data.
     * @param {Pointer<Integer>} pMaxLen The maximum length of the media segment data.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-appendbytestream
     */
    AppendByteStream(pStream, pMaxLen) {
        pMaxLenMarshal := pMaxLen is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", pStream, pMaxLenMarshal, pMaxLen, "HRESULT")
        return result
    }

    /**
     * Aborts the processing of the current media segment.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-abort
     */
    Abort() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Removes the media segments defined by the specified time range from the IMFSourceBuffer.
     * @param {Float} start The start of the time range.
     * @param {Float} end The end of the time range.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-remove
     */
    Remove(start, end) {
        result := ComCall(14, this, "double", start, "double", end, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFSourceBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetUpdating := CallbackCreate(GetMethod(implObj, "GetUpdating"), flags, 1)
        this.vtbl.GetBuffered := CallbackCreate(GetMethod(implObj, "GetBuffered"), flags, 2)
        this.vtbl.GetTimeStampOffset := CallbackCreate(GetMethod(implObj, "GetTimeStampOffset"), flags, 1)
        this.vtbl.SetTimeStampOffset := CallbackCreate(GetMethod(implObj, "SetTimeStampOffset"), flags, 2)
        this.vtbl.GetAppendWindowStart := CallbackCreate(GetMethod(implObj, "GetAppendWindowStart"), flags, 1)
        this.vtbl.SetAppendWindowStart := CallbackCreate(GetMethod(implObj, "SetAppendWindowStart"), flags, 2)
        this.vtbl.GetAppendWindowEnd := CallbackCreate(GetMethod(implObj, "GetAppendWindowEnd"), flags, 1)
        this.vtbl.SetAppendWindowEnd := CallbackCreate(GetMethod(implObj, "SetAppendWindowEnd"), flags, 2)
        this.vtbl.Append := CallbackCreate(GetMethod(implObj, "Append"), flags, 3)
        this.vtbl.AppendByteStream := CallbackCreate(GetMethod(implObj, "AppendByteStream"), flags, 3)
        this.vtbl.Abort := CallbackCreate(GetMethod(implObj, "Abort"), flags, 1)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetUpdating)
        CallbackFree(this.vtbl.GetBuffered)
        CallbackFree(this.vtbl.GetTimeStampOffset)
        CallbackFree(this.vtbl.SetTimeStampOffset)
        CallbackFree(this.vtbl.GetAppendWindowStart)
        CallbackFree(this.vtbl.SetAppendWindowStart)
        CallbackFree(this.vtbl.GetAppendWindowEnd)
        CallbackFree(this.vtbl.SetAppendWindowEnd)
        CallbackFree(this.vtbl.Append)
        CallbackFree(this.vtbl.AppendByteStream)
        CallbackFree(this.vtbl.Abort)
        CallbackFree(this.vtbl.Remove)
    }
}
