#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IGetFrame interface supports extracting, decompressing, and displaying individual frames from an open stream.
 * @see https://docs.microsoft.com/windows/win32/api//vfw/nn-vfw-igetframe
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class IGetFrame extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGetFrame
     * @type {Guid}
     */
    static IID => Guid("{00020023-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFrame", "Begin", "End", "SetFormat"]

    /**
     * The GetFrame method retrieves a decompressed copy of a frame from a stream. Called when an application uses the AVIStreamGetFrame function.
     * @param {Integer} lPos Frame to copy and decompress.
     * @returns {Pointer<Void>} Returns the address of the decompressed frame data.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-igetframe-getframe
     */
    GetFrame(lPos) {
        result := ComCall(3, this, "int", lPos, "ptr")
        return result
    }

    /**
     * The Begin method prepares to extract and decompress copies of frames from a stream. Called when an application uses the AVIStreamGetFrameOpen function.
     * @param {Integer} lStart Starting frame for extracting and decompressing.
     * @param {Integer} lEnd Ending frame for extracting and decompressing.
     * @param {Integer} lRate Speed at which the file is read relative to its normal playback rate. Normal speed is 1000. Larger values indicate faster speeds; smaller values indicate slower speeds.
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-igetframe-begin
     */
    Begin(lStart, lEnd, lRate) {
        result := ComCall(4, this, "int", lStart, "int", lEnd, "int", lRate, "HRESULT")
        return result
    }

    /**
     * The End method ends frame extraction and decompression. Called when an application uses the AVIStreamGetFrameClose function.
     * @returns {HRESULT} Returns the HRESULT defined by OLE.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-igetframe-end
     */
    End() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The SetFormat method sets the decompressed image format of the frames being extracted and optionally provides a buffer for the decompression operation.
     * @param {Pointer<BITMAPINFOHEADER>} lpbi Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure defining the decompressed image format. You can also specify <b>NULL</b> or the value <c>((LPBITMAPINFOHEADER) 1)</code> for this parameter. <b>NULL</b> causes the decompressor to choose a format that is appropriate for editing (normally a 24-bit image depth format). The value <code>((LPBITMAPINFOHEADER) 1)</c> causes the decompressor to choose a format appropriate for the current display mode.
     * @param {Pointer<Void>} lpBits Pointer to a buffer to contain the decompressed image data. Specify <b>NULL</b> to have this method allocate a buffer.
     * @param {Integer} x The x-coordinate of the destination rectangle within the DIB specified by <i>lpbi</i>. This parameter is used when <i>lpBits</i> is not <b>NULL</b>.
     * @param {Integer} y The y-coordinate of the destination rectangle within the DIB specified by <i>lpbi</i>. This parameter is used when <i>lpBits</i> is not <b>NULL</b>.
     * @param {Integer} dx Width of the destination rectangle. This parameter is used when <i>lpBits</i> is not <b>NULL</b>.
     * @param {Integer} dy Height of the destination rectangle. This parameter is used when <i>lpBits</i> is not <b>NULL</b>.
     * @returns {HRESULT} Returns <b>NOERROR</b> if successful, <b>E_OUTOFMEMORY</b> if the decompressed image is larger than the buffer size, or <b>E_FAIL</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//vfw/nf-vfw-igetframe-setformat
     */
    SetFormat(lpbi, lpBits, x, y, dx, dy) {
        lpBitsMarshal := lpBits is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, "ptr", lpbi, lpBitsMarshal, lpBits, "int", x, "int", y, "int", dx, "int", dy, "HRESULT")
        return result
    }
}
