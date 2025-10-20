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
     * 
     * @returns {BOOL} 
     */
    GetUpdating() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaTimeRange>} ppBuffered 
     * @returns {HRESULT} 
     */
    GetBuffered(ppBuffered) {
        result := ComCall(4, this, "ptr", ppBuffered, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetTimeStampOffset() {
        result := ComCall(5, this, "double")
        return result
    }

    /**
     * 
     * @param {Float} offset 
     * @returns {HRESULT} 
     */
    SetTimeStampOffset(offset) {
        result := ComCall(6, this, "double", offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetAppendWindowStart() {
        result := ComCall(7, this, "double")
        return result
    }

    /**
     * 
     * @param {Float} time 
     * @returns {HRESULT} 
     */
    SetAppendWindowStart(time) {
        result := ComCall(8, this, "double", time, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetAppendWindowEnd() {
        result := ComCall(9, this, "double")
        return result
    }

    /**
     * 
     * @param {Float} time 
     * @returns {HRESULT} 
     */
    SetAppendWindowEnd(time) {
        result := ComCall(10, this, "double", time, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pData 
     * @param {Integer} len 
     * @returns {HRESULT} 
     */
    Append(pData, len) {
        result := ComCall(11, this, "ptr", pData, "uint", len, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFByteStream>} pStream 
     * @param {Pointer<UInt64>} pMaxLen 
     * @returns {HRESULT} 
     */
    AppendByteStream(pStream, pMaxLen) {
        result := ComCall(12, this, "ptr", pStream, "uint*", pMaxLen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Abort() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} start 
     * @param {Float} end 
     * @returns {HRESULT} 
     */
    Remove(start, end) {
        result := ComCall(14, this, "double", start, "double", end, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
