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
     * 
     * @param {Pointer<Pointer<Integer>>} ppbBuffer 
     * @param {Pointer<Integer>} pcbMaxLength 
     * @param {Pointer<Integer>} pcbCurrentLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediabuffer-lock
     */
    Lock(ppbBuffer, pcbMaxLength, pcbCurrentLength) {
        result := ComCall(3, this, "ptr*", ppbBuffer, "uint*", pcbMaxLength, "uint*", pcbCurrentLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediabuffer-unlock
     */
    Unlock() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbCurrentLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediabuffer-getcurrentlength
     */
    GetCurrentLength(pcbCurrentLength) {
        result := ComCall(5, this, "uint*", pcbCurrentLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbCurrentLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediabuffer-setcurrentlength
     */
    SetCurrentLength(cbCurrentLength) {
        result := ComCall(6, this, "uint", cbCurrentLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbMaxLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediabuffer-getmaxlength
     */
    GetMaxLength(pcbMaxLength) {
        result := ComCall(7, this, "uint*", pcbMaxLength, "HRESULT")
        return result
    }
}
