#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a buffer that contains a two-dimensional surface, such as a video frame.
 * @remarks
 * 
 * To get a pointer to this interface, call <b>QueryInterface</b> on the media buffer.
 * 
 * To use a 2-D buffer, it is important to know the <i>stride</i>, which is the number of bytes needed to go from one row of pixels to the next. The stride may be larger than the image width, because the surface may contain padding bytes after each row of pixels. Stride can also be negative, if the pixels are oriented bottom-up in memory. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/image-stride">Image Stride</a>.
 * 
 * Every video format defines a <i>contiguous</i> or <i>packed</i> representation. This representation is compatible with the standard layout of a DirectX surface in system memory, with no additional padding. For RGB video, the contiguous representation has a pitch equal to the image width in bytes, rounded up to the nearest <b>DWORD</b> boundary. For YUV video, the layout of the contiguous representation depends on the YUV format. For planar YUV formats, the Y plane might have a different pitch than the U and V planes.
 * 
 * If a media buffer supports the <b>IMF2DBuffer</b> interface, the underlying buffer is not guaranteed to have a contiguous representation, because there might be additional padding bytes after each row of pixels. When a buffer is non-contiguous, the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-lock">Lock</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imf2dbuffer-lock2d">Lock2D</a> methods have different behaviors:
 * 
 * <ul>
 * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imf2dbuffer-lock2d">Lock2D</a> method returns a pointer to the underlying buffer. The buffer might not be contiguous.
 *           </li>
 * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-lock">Lock</a> method returns a buffer that is guaranteed to be contiguous. If the underlying buffer is not contiguous, the method copies the data into a new buffer, and the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-unlock">Unlock</a> method copies it back into the original buffer.
 *           </li>
 * </ul>
 * Call the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imf2dbuffer-lock2d">Lock2D</a> method to access the 2-D buffer in its native format. The native format might not be contiguous. The buffer's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-lock">IMFMediaBuffer::Lock</a> method returns a contiguous representation of the buffer. However, this might require an internal copy from the native format. For 2-D buffers, therefore, you should use the <b>Lock2D</b> method and avoid the <b>Lock</b> method. Because the <b>Lock</b> method might cause up to two buffer copies, the <b>Lock2D</b> method is generally more efficient and should be used when possible. To find out if the underlying buffer is contiguous, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imf2dbuffer-iscontiguousformat">IMF2DBuffer::IsContiguousFormat</a>.
 * 
 * For uncompressed images, the amount of valid data in the buffer is determined by the width, height, and pixel layout of the image. For this reason, if you call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imf2dbuffer-lock2d">Lock2D</a> to access the buffer, do not rely on the values returned by <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-getcurrentlength">IMFMediaBuffer::GetCurrentLength</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-getmaxlength">IMFMediaBuffer::GetMaxLength</a>. Similarly, if you modify the data in the buffer, you do not have to call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-setcurrentlength">IMFMediaBuffer::SetCurrentLength</a> to update the size. Generally, you should avoid mixing calls to <b>IMF2DBuffer</b> and <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> methods on the same media buffer.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imf2dbuffer
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMF2DBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMF2DBuffer
     * @type {Guid}
     */
    static IID => Guid("{7dc9d5f9-9ed9-44ec-9bbf-0600bb589fbb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Lock2D", "Unlock2D", "GetScanline0AndPitch", "IsContiguousFormat", "GetContiguousLength", "ContiguousCopyTo", "ContiguousCopyFrom"]

    /**
     * Gives the caller access to the memory in the buffer.
     * @param {Pointer<Pointer<Integer>>} ppbScanline0 Receives a pointer to the first byte of the top row of pixels in the image. The top row is defined as the top row when the image is presented to the viewer, and might not be the first row in memory.
     * @param {Pointer<Integer>} plPitch Receives the surface stride, in bytes. The stride might be negative, indicating that the image is oriented from the bottom up in memory.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>D3DERR_INVALIDCALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot lock the Direct3D surface.
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
     * The buffer cannot be locked at this time.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imf2dbuffer-lock2d
     */
    Lock2D(ppbScanline0, plPitch) {
        ppbScanline0Marshal := ppbScanline0 is VarRef ? "ptr*" : "ptr"
        plPitchMarshal := plPitch is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, ppbScanline0Marshal, ppbScanline0, plPitchMarshal, plPitch, "HRESULT")
        return result
    }

    /**
     * Unlocks a buffer that was previously locked. Call this method once for each call to IMF2DBuffer::Lock2D.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imf2dbuffer-unlock2d
     */
    Unlock2D() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a pointer to the buffer memory and the surface stride.
     * @param {Pointer<Pointer<Integer>>} pbScanline0 Receives a pointer to the first byte of the top row of pixels in the image.
     * @param {Pointer<Integer>} plPitch Receives the stride, in bytes. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/image-stride">Image Stride</a>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You must lock the buffer before calling this method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imf2dbuffer-getscanline0andpitch
     */
    GetScanline0AndPitch(pbScanline0, plPitch) {
        pbScanline0Marshal := pbScanline0 is VarRef ? "ptr*" : "ptr"
        plPitchMarshal := plPitch is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, pbScanline0Marshal, pbScanline0, plPitchMarshal, plPitch, "HRESULT")
        return result
    }

    /**
     * Queries whether the buffer is contiguous in its native format.
     * @returns {BOOL} Receives a Boolean value. The value is <b>TRUE</b> if the buffer is contiguous, and <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imf2dbuffer-iscontiguousformat
     */
    IsContiguousFormat() {
        result := ComCall(6, this, "int*", &pfIsContiguous := 0, "HRESULT")
        return pfIsContiguous
    }

    /**
     * Retrieves the number of bytes needed to store the contents of the buffer in contiguous format.
     * @returns {Integer} Receives the number of bytes needed to store the contents of the buffer in contiguous format.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imf2dbuffer-getcontiguouslength
     */
    GetContiguousLength() {
        result := ComCall(7, this, "uint*", &pcbLength := 0, "HRESULT")
        return pcbLength
    }

    /**
     * Copies this buffer into the caller's buffer, converting the data to contiguous format.
     * @param {Pointer} pbDestBuffer Pointer to the destination buffer where the data will be copied. The caller allocates the buffer.
     * @param {Integer} cbDestBuffer Size of the destination buffer, in bytes. To get the required size, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imf2dbuffer-getcontiguouslength">IMF2DBuffer::GetContiguousLength</a>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid size specified in <i>pbDestBuffer</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imf2dbuffer-contiguouscopyto
     */
    ContiguousCopyTo(pbDestBuffer, cbDestBuffer) {
        result := ComCall(8, this, "ptr", pbDestBuffer, "uint", cbDestBuffer, "HRESULT")
        return result
    }

    /**
     * Copies data to this buffer from a buffer that has a contiguous format.
     * @param {Pointer} pbSrcBuffer Pointer to the source buffer. The caller allocates the buffer.
     * @param {Integer} cbSrcBuffer Size of the source buffer, in bytes. To get the maximum size of the buffer, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imf2dbuffer-getcontiguouslength">IMF2DBuffer::GetContiguousLength</a>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imf2dbuffer-contiguouscopyfrom
     */
    ContiguousCopyFrom(pbSrcBuffer, cbSrcBuffer) {
        result := ComCall(9, this, "ptr", pbSrcBuffer, "uint", cbSrcBuffer, "HRESULT")
        return result
    }
}
