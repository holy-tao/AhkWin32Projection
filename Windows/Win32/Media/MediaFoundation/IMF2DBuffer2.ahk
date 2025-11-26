#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMF2DBuffer.ahk

/**
 * Represents a buffer that contains a two-dimensional surface, such as a video frame.
 * @remarks
 * 
 * This interface extends the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imf2dbuffer">IMF2DBuffer</a> interface and adds a safer version of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imf2dbuffer-lock2d">IMF2DBuffer::Lock2D</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imf2dbuffer2
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMF2DBuffer2 extends IMF2DBuffer{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMF2DBuffer2
     * @type {Guid}
     */
    static IID => Guid("{33ae5ea6-4316-436f-8ddd-d73d22f829ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Lock2DSize", "Copy2DTo"]

    /**
     * Gives the caller access to the memory in the buffer.
     * @param {Integer} lockFlags A member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mf2dbuffer_lockflags">MF2DBuffer_LockFlags</a> enumeration that specifies whether to lock the buffer for reading, writing, or both.
     * @param {Pointer<Pointer<Integer>>} ppbScanline0 Receives a pointer to the first byte of the top row of pixels in the image. The top row is defined as the top row when the image is presented to the viewer, and might not be the first row in memory.
     * @param {Pointer<Integer>} plPitch Receives the surface stride, in bytes. The stride might be negative, indicating that the image is oriented from the bottom up in memory.
     * @param {Pointer<Pointer<Integer>>} ppbBufferStart Receives a pointer to the start of the accessible buffer in memory.
     * @param {Pointer<Integer>} pcbBufferLength Receives the length of the buffer, in bytes.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid request. The buffer might already be locked with an incompatible locking flag. See Remarks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is insufficient memory to complete the operation. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imf2dbuffer2-lock2dsize
     */
    Lock2DSize(lockFlags, ppbScanline0, plPitch, ppbBufferStart, pcbBufferLength) {
        ppbScanline0Marshal := ppbScanline0 is VarRef ? "ptr*" : "ptr"
        plPitchMarshal := plPitch is VarRef ? "int*" : "ptr"
        ppbBufferStartMarshal := ppbBufferStart is VarRef ? "ptr*" : "ptr"
        pcbBufferLengthMarshal := pcbBufferLength is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "int", lockFlags, ppbScanline0Marshal, ppbScanline0, plPitchMarshal, plPitch, ppbBufferStartMarshal, ppbBufferStart, pcbBufferLengthMarshal, pcbBufferLength, "HRESULT")
        return result
    }

    /**
     * Copies the buffer to another 2D buffer object.
     * @param {IMF2DBuffer2} pDestBuffer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imf2dbuffer2">IMF2DBuffer2</a> interface of the destination buffer.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imf2dbuffer2-copy2dto
     */
    Copy2DTo(pDestBuffer) {
        result := ComCall(11, this, "ptr", pDestBuffer, "HRESULT")
        return result
    }
}
