#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ALLOCATOR_PROPERTIES.ahk
#Include .\IMediaSample.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMemAllocator interface allocates media samples, for moving data between pins.This interface is used by pins that share allocators, when the input pin exposes the IMemInputPin interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-imemallocator
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMemAllocator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMemAllocator
     * @type {Guid}
     */
    static IID => Guid("{56a8689c-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProperties", "GetProperties", "Commit", "Decommit", "GetBuffer", "ReleaseBuffer"]

    /**
     * The SetProperties method specifies the number of buffers to allocate and the size of each buffer.
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pRequest Pointer to an [ALLOCATOR_PROPERTIES](/windows/desktop/api/strmif/ns-strmif-allocator_properties) structure that contains the buffer requirements.
     * @returns {ALLOCATOR_PROPERTIES} Pointer to an <b>ALLOCATOR_PROPERTIES</b> structure that receives the actual buffer properties.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imemallocator-setproperties
     */
    SetProperties(pRequest) {
        pActual := ALLOCATOR_PROPERTIES()
        result := ComCall(3, this, "ptr", pRequest, "ptr", pActual, "HRESULT")
        return pActual
    }

    /**
     * The GetProperties method retrieves the number of buffers that the allocator will create, and the buffer properties.
     * @returns {ALLOCATOR_PROPERTIES} Pointer to an [ALLOCATOR_PROPERTIES](/windows/desktop/api/strmif/ns-strmif-allocator_properties) structure that receives the allocator properties.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imemallocator-getproperties
     */
    GetProperties() {
        pProps := ALLOCATOR_PROPERTIES()
        result := ComCall(4, this, "ptr", pProps, "HRESULT")
        return pProps
    }

    /**
     * The Commit method allocates the buffer memory.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_SIZENOTSET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Buffer requirements were not set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imemallocator-commit
     */
    Commit() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Decommit method releases the buffer memory.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imemallocator-decommit
     */
    Decommit() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * The GetBuffer method retrieves a media sample that contains an empty buffer.
     * @param {Pointer<Integer>} pStartTime Pointer to the start time of the sample, or <b>NULL</b>.
     * @param {Pointer<Integer>} pEndTime Pointer to the ending time of the sample, or <b>NULL</b>.
     * @param {Integer} dwFlags Bitwise combination of zero or more of the following flags:
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>AM_GBF_NOTASYNCPOINT</td>
     * <td>This sample is not a synchronization point. Dynamic format changes are not allowed on this sample. When called on the Overlay Mixer or VMR, this flag implies that the buffer returned will contain an image that is identical to the last image delivered.</td>
     * </tr>
     * <tr>
     * <td>AM_GBF_PREVFRAMESKIPPED</td>
     * <td>This sample is the first after a discontinuity. (Only the video renderer uses this flag.)</td>
     * </tr>
     * <tr>
     * <td>AM_GBF_NOWAIT</td>
     * <td>Do not wait for a buffer to become available.</td>
     * </tr>
     * <tr>
     * <td>AM_GBF_NODDSURFACELOCK</td>
     * <td>Used with the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/video-mixing-renderer-filter-7">Video Mixing Renderer Filter 7</a> to request an unlocked DirectDraw surface. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/working-with-direct3d-render-targets">Working with Direct3D Render Targets</a>.</td>
     * </tr>
     * </table>
     * @returns {IMediaSample} Receives a pointer to the buffer's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imediasample">IMediaSample</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imemallocator-getbuffer
     */
    GetBuffer(pStartTime, pEndTime, dwFlags) {
        pStartTimeMarshal := pStartTime is VarRef ? "int64*" : "ptr"
        pEndTimeMarshal := pEndTime is VarRef ? "int64*" : "ptr"

        result := ComCall(7, this, "ptr*", &ppBuffer := 0, pStartTimeMarshal, pStartTime, pEndTimeMarshal, pEndTime, "uint", dwFlags, "HRESULT")
        return IMediaSample(ppBuffer)
    }

    /**
     * The ReleaseBuffer method releases a media sample.
     * @param {IMediaSample} pBuffer Pointer to the media sample's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imediasample">IMediaSample</a> interface.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imemallocator-releasebuffer
     */
    ReleaseBuffer(pBuffer) {
        result := ComCall(8, this, "ptr", pBuffer, "HRESULT")
        return result
    }
}
