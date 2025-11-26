#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a block of memory that contains media data.
 * @remarks
 * 
 * If the buffer contains 2-D image data (such as an uncompressed video frame), you should query the buffer for the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imf2dbuffer">IMF2DBuffer</a> interface. The methods on <b>IMF2DBuffer</b> are optimized for 2-D data.
 * 
 * To get a buffer from a media sample, call one of the following <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> methods:
 * 
 * <ul>
 * <li>
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfsample-converttocontiguousbuffer">IMFSample::ConvertToContiguousBuffer</a>
 * 
 * 
 * </li>
 * <li>
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfsample-getbufferbyindex">IMFSample::GetBufferByIndex</a>
 * 
 * 
 * </li>
 * </ul>
 * To create a new buffer object, use one of the following functions.
 * 
 * <table>
 * <tr>
 * <th>Function</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatememorybuffer">MFCreateMemoryBuffer</a>
 * </td>
 * <td>Creates a buffer and allocates system memory.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediabufferwrapper">MFCreateMediaBufferWrapper</a>
 * </td>
 * <td>Creates a media buffer that wraps an existing media buffer.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatedxsurfacebuffer">MFCreateDXSurfaceBuffer</a>
 * </td>
 * <td>Creates a buffer that manages a DirectX surface.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatealignedmemorybuffer">MFCreateAlignedMemoryBuffer</a>
 * </td>
 * <td>Creates a buffer and allocates system memory with a specified alignment.</td>
 * </tr>
 * </table>
 *  
 * 
 * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfmediabuffer
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaBuffer
     * @type {Guid}
     */
    static IID => Guid("{045fa593-8799-42b8-bc8d-8968c6453507}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Lock", "Unlock", "GetCurrentLength", "SetCurrentLength", "GetMaxLength"]

    /**
     * Gives the caller access to the memory in the buffer, for reading or writing.
     * @param {Pointer<Pointer<Integer>>} ppbBuffer Receives a pointer to the start of the buffer.
     * @param {Pointer<Integer>} pcbMaxLength Receives the maximum amount of data that can be written to the buffer. This parameter can be <b>NULL</b>. The same value is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-getmaxlength">IMFMediaBuffer::GetMaxLength</a> method.
     * @param {Pointer<Integer>} pcbCurrentLength Receives the length of the valid data in the buffer, in bytes. This parameter can be <b>NULL</b>. The same value is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-getcurrentlength">IMFMediaBuffer::GetCurrentLength</a> method.
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
     * For Direct3D surface buffers, an error occurred when locking the surface.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmediabuffer-lock
     */
    Lock(ppbBuffer, pcbMaxLength, pcbCurrentLength) {
        ppbBufferMarshal := ppbBuffer is VarRef ? "ptr*" : "ptr"
        pcbMaxLengthMarshal := pcbMaxLength is VarRef ? "uint*" : "ptr"
        pcbCurrentLengthMarshal := pcbCurrentLength is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppbBufferMarshal, ppbBuffer, pcbMaxLengthMarshal, pcbMaxLength, pcbCurrentLengthMarshal, pcbCurrentLength, "HRESULT")
        return result
    }

    /**
     * Unlocks a buffer that was previously locked. Call this method once for every call to IMFMediaBuffer::Lock.
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
     * For Direct3D surface buffers, an error occurred when unlocking the surface.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmediabuffer-unlock
     */
    Unlock() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the length of the valid data in the buffer.
     * @returns {Integer} Receives the length of the valid data, in bytes. If the buffer does not contain any valid data, the value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmediabuffer-getcurrentlength
     */
    GetCurrentLength() {
        result := ComCall(5, this, "uint*", &pcbCurrentLength := 0, "HRESULT")
        return pcbCurrentLength
    }

    /**
     * Sets the length of the valid data in the buffer.
     * @param {Integer} cbCurrentLength Length of the valid data, in bytes. This value cannot be greater than the allocated size of the buffer, which is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-getmaxlength">IMFMediaBuffer::GetMaxLength</a> method.
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
     * The specified length is greater than the maximum size of the buffer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmediabuffer-setcurrentlength
     */
    SetCurrentLength(cbCurrentLength) {
        result := ComCall(6, this, "uint", cbCurrentLength, "HRESULT")
        return result
    }

    /**
     * Retrieves the allocated size of the buffer.
     * @returns {Integer} Receives the allocated size of the buffer, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfmediabuffer-getmaxlength
     */
    GetMaxLength() {
        result := ComCall(7, this, "uint*", &pcbMaxLength := 0, "HRESULT")
        return pcbMaxLength
    }
}
