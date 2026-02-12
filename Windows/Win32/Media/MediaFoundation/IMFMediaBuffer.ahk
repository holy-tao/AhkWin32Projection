#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a block of memory that contains media data.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nn-mfobjects-imfmediabuffer
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
     * @remarks
     * This method gives the caller access to the entire buffer, up to the maximum size returned in the <i>pcbMaxLength</i> parameter. The value returned in <i>pcbCurrentLength</i> is the size of any valid data already in the buffer, which might be less than the total buffer size.
     * 
     * The pointer returned in <i>ppbBuffer</i> is guaranteed to be valid, and can safely be accessed across the entire buffer for as long as the lock is held. When you are done accessing the buffer, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-unlock">IMFMediaBuffer::Unlock</a> to unlock the buffer. You must call <b>Unlock</b> once for each call to <b>Lock</b>. After you unlock the buffer, the pointer returned in <i>ppbBuffer</i> is no longer valid, and should not be used. Generally, it is best to call <b>Lock</b> only when you need to access the buffer memory, and not earlier.
     * 
     * Locking the buffer does not prevent other threads from calling <b>Lock</b>, so you should not rely on this method to synchronize threads.
     * 
     * This method may allocate memory, but does not transfer ownership of the memory to the caller. Do not release or free the memory; the media buffer will free the memory when the media buffer is destroyed.
     * 
     * 
     * If you modify the contents of the buffer, update the current length by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-setcurrentlength">IMFMediaBuffer::SetCurrentLength</a>.
     * 
     * 
     * This method may internally allocate some memory, so if the buffer supports the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imf2dbuffer">IMF2DBuffer</a> interface, you should use the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imf2dbuffer-lock2d">IMF2DBuffer::Lock2D</a> method to lock the buffer instead. For 2-D buffers, the **Lock2DSize** method can be more efficient than the **Lock** method, depending on the **MF2DBuffer_LockFlags** value you specify.  Calling **Lock2DSize** with **MF2DBuffer_LockFlags_Read** won’t incur a copy back when the buffer is unlocked and calling it with **MF2DBuffer_LockFlags_Write** won’t incur a copy from the internal buffer. Calling **Lock2DSize** with **LockFlags_ReadWrite**  behaves the same as **Lock** and **Lock2D** and will incur a both copy from and copy back when unlocked. The general guidance for best performance is to avoid using **IMFMediaBuffer** and **IMF2DBuffer** whenever possible and instead use **IMF2DBuffer2** with the minimum required lock flags. Note that if the buffer is locked using **Lock2D**, the **Lock** method might return MF_E_INVALIDREQUEST.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfmediabuffer-lock
     */
    Lock(ppbBuffer, pcbMaxLength, pcbCurrentLength) {
        ppbBufferMarshal := ppbBuffer is VarRef ? "ptr*" : "ptr"
        pcbMaxLengthMarshal := pcbMaxLength is VarRef ? "uint*" : "ptr"
        pcbCurrentLengthMarshal := pcbCurrentLength is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppbBufferMarshal, ppbBuffer, pcbMaxLengthMarshal, pcbMaxLength, pcbCurrentLengthMarshal, pcbCurrentLength, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Unlocks a buffer that was previously locked. Call this method once for every call to IMFMediaBuffer::Lock.
     * @remarks
     * It is an error to call <b>Unlock</b> if you did not call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-lock">Lock</a> previously.
     * 
     * After calling this method, do not use the pointer returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-lock">Lock</a> method. It is no longer guaranteed to be valid.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfmediabuffer-unlock
     */
    Unlock() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the length of the valid data in the buffer.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {Integer} Receives the length of the valid data, in bytes. If the buffer does not contain any valid data, the value is zero.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfmediabuffer-getcurrentlength
     */
    GetCurrentLength() {
        result := ComCall(5, this, "uint*", &pcbCurrentLength := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbCurrentLength
    }

    /**
     * Sets the length of the valid data in the buffer.
     * @remarks
     * Call this method if you write data into the buffer.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfmediabuffer-setcurrentlength
     */
    SetCurrentLength(cbCurrentLength) {
        result := ComCall(6, this, "uint", cbCurrentLength, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the allocated size of the buffer.
     * @remarks
     * The buffer might or might not contain any valid data, and if there is valid data in the buffer, it might be smaller than the buffer's allocated size. To get the length of the valid data, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-getcurrentlength">IMFMediaBuffer::GetCurrentLength</a>.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {Integer} Receives the allocated size of the buffer, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfmediabuffer-getmaxlength
     */
    GetMaxLength() {
        result := ComCall(7, this, "uint*", &pcbMaxLength := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbMaxLength
    }
}
