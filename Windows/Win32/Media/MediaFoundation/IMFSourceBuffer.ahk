#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaTimeRange.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a buffer which contains media data for a IMFMediaSourceExtension.
 * @remarks
 * 
 * <b>IMFSourceBuffer</b> is used in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediasourceextension">IMFMediaSourceExtension</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfsourcebuffer
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSourceBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSourceBuffer
     * @type {Guid}
     */
    static IID => Guid("{e2cd3a4b-af25-4d3d-9110-da0e6f8ee877}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUpdating", "GetBuffered", "GetTimeStampOffset", "SetTimeStampOffset", "GetAppendWindowStart", "SetAppendWindowStart", "GetAppendWindowEnd", "SetAppendWindowEnd", "Append", "AppendByteStream", "Abort", "Remove"]

    /**
     * Gets a value that indicates if Append, AppendByteStream, or Remove is in process.
     * @returns {BOOL} <b>true</b> if <a href="/windows/desktop/medfound/imfsourcebuffer-append">Append</a>, <a href="/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-appendbytestream">AppendByteStream</a>, or <a href="/windows/desktop/medfound/imfsourcebuffer-remove">Remove</a>; otherwise, <b>false</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfsourcebuffer-getupdating
     */
    GetUpdating() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * Gets the buffered time range.
     * @returns {IMFMediaTimeRange} The buffered time range.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfsourcebuffer-getbuffered
     */
    GetBuffered() {
        result := ComCall(4, this, "ptr*", &ppBuffered := 0, "HRESULT")
        return IMFMediaTimeRange(ppBuffered)
    }

    /**
     * Gets the timestamp offset for media segments appended to the IMFSourceBuffer.
     * @returns {Float} The timestamp offset.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfsourcebuffer-gettimestampoffset
     */
    GetTimeStampOffset() {
        result := ComCall(5, this, "double")
        return result
    }

    /**
     * Sets the timestamp offset for media segments appended to the IMFSourceBuffer.
     * @param {Float} offset 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfsourcebuffer-settimestampoffset
     */
    SetTimeStampOffset(offset) {
        result := ComCall(6, this, "double", offset, "HRESULT")
        return result
    }

    /**
     * Gets the timestamp for the start of the append window.
     * @returns {Float} The timestamp for the start of the append window.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfsourcebuffer-getappendwindowstart
     */
    GetAppendWindowStart() {
        result := ComCall(7, this, "double")
        return result
    }

    /**
     * Sets the timestamp for the start of the append window.
     * @param {Float} time The timestamp for the start of the append window.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfsourcebuffer-setappendwindowstart
     */
    SetAppendWindowStart(time) {
        result := ComCall(8, this, "double", time, "HRESULT")
        return result
    }

    /**
     * Gets the timestamp for the end of the append window.
     * @returns {Float} The timestamp for the end of the append window.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfsourcebuffer-getappendwindowend
     */
    GetAppendWindowEnd() {
        result := ComCall(9, this, "double")
        return result
    }

    /**
     * Sets the timestamp for the end of the append window.
     * @param {Float} time 
     * @returns {HRESULT} The timestamp for the end of the append window.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfsourcebuffer-setappendwindowend
     */
    SetAppendWindowEnd(time) {
        result := ComCall(10, this, "double", time, "HRESULT")
        return result
    }

    /**
     * Appends the specified media segment to the IMFSourceBuffer.
     * @param {Pointer} pData The media data to append.
     * @param {Integer} len The length of the media data stored in <i>pData</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfsourcebuffer-append
     */
    Append(pData, len) {
        result := ComCall(11, this, "ptr", pData, "uint", len, "HRESULT")
        return result
    }

    /**
     * Appends the media segment from the specified byte stream to the IMFSourceBuffer.
     * @param {IMFByteStream} pStream The media segment data.
     * @param {Pointer<Integer>} pMaxLen The maximum length of the media segment data.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfsourcebuffer-appendbytestream
     */
    AppendByteStream(pStream, pMaxLen) {
        pMaxLenMarshal := pMaxLen is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", pStream, pMaxLenMarshal, pMaxLen, "HRESULT")
        return result
    }

    /**
     * Aborts the processing of the current media segment.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfsourcebuffer-abort
     */
    Abort() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Removes the media segments defined by the specified time range from the IMFSourceBuffer.
     * @param {Float} start The start of the time range.
     * @param {Float} end The end of the time range.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfsourcebuffer-remove
     */
    Remove(start, end) {
        result := ComCall(14, this, "double", start, "double", end, "HRESULT")
        return result
    }
}
