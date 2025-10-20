#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-getupdating
     */
    GetUpdating() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaTimeRange>} ppBuffered 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-getbuffered
     */
    GetBuffered(ppBuffered) {
        result := ComCall(4, this, "ptr*", ppBuffered, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-gettimestampoffset
     */
    GetTimeStampOffset() {
        result := ComCall(5, this, "double")
        return result
    }

    /**
     * 
     * @param {Float} offset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-settimestampoffset
     */
    SetTimeStampOffset(offset) {
        result := ComCall(6, this, "double", offset, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-getappendwindowstart
     */
    GetAppendWindowStart() {
        result := ComCall(7, this, "double")
        return result
    }

    /**
     * 
     * @param {Float} time 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-setappendwindowstart
     */
    SetAppendWindowStart(time) {
        result := ComCall(8, this, "double", time, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-getappendwindowend
     */
    GetAppendWindowEnd() {
        result := ComCall(9, this, "double")
        return result
    }

    /**
     * 
     * @param {Float} time 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-setappendwindowend
     */
    SetAppendWindowEnd(time) {
        result := ComCall(10, this, "double", time, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pData 
     * @param {Integer} len 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-append
     */
    Append(pData, len) {
        result := ComCall(11, this, "ptr", pData, "uint", len, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFByteStream} pStream 
     * @param {Pointer<Integer>} pMaxLen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-appendbytestream
     */
    AppendByteStream(pStream, pMaxLen) {
        result := ComCall(12, this, "ptr", pStream, "uint*", pMaxLen, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-abort
     */
    Abort() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} start 
     * @param {Float} end 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfsourcebuffer-remove
     */
    Remove(start, end) {
        result := ComCall(14, this, "double", start, "double", end, "HRESULT")
        return result
    }
}
