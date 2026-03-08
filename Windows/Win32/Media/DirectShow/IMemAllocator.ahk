#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ALLOCATOR_PROPERTIES.ahk
#Include .\IMediaSample.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMemAllocator interface allocates media samples, for moving data between pins.This interface is used by pins that share allocators, when the input pin exposes the IMemInputPin interface.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-imemallocator
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
     * @remarks
     * This method specifies the buffer requirements, but does not allocate any buffers. Call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imemallocator-commit">IMemAllocator::Commit</a> method to allocate buffers.
     * 
     * The caller allocates two ALLOCATOR_PROPERTIES structures. The <i>pRequest</i> parameter contains the caller's buffer requirements, including the number of buffers and the size of each buffer. When the method returns, the <i>pActual</i> parameter contains the actual buffer properties, as set by the allocator.
     * 
     * When this method is called, the allocator must not be committed or have outstanding buffers.
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pRequest Pointer to an [ALLOCATOR_PROPERTIES](/windows/desktop/api/strmif/ns-strmif-allocator_properties) structure that contains the buffer requirements.
     * @returns {ALLOCATOR_PROPERTIES} Pointer to an <b>ALLOCATOR_PROPERTIES</b> structure that receives the actual buffer properties.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imemallocator-setproperties
     */
    SetProperties(pRequest) {
        pActual := ALLOCATOR_PROPERTIES()
        result := ComCall(3, this, "ptr", pRequest, "ptr", pActual, "HRESULT")
        return pActual
    }

    /**
     * The GetProperties method retrieves the number of buffers that the allocator will create, and the buffer properties.
     * @remarks
     * Calls to this method might not succeed until the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imemallocator-commit">IMemAllocator::Commit</a> method is called.
     * @returns {ALLOCATOR_PROPERTIES} Pointer to an [ALLOCATOR_PROPERTIES](/windows/desktop/api/strmif/ns-strmif-allocator_properties) structure that receives the allocator properties.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imemallocator-getproperties
     */
    GetProperties() {
        pProps := ALLOCATOR_PROPERTIES()
        result := ComCall(4, this, "ptr", pProps, "HRESULT")
        return pProps
    }

    /**
     * The Commit method allocates the buffer memory.
     * @remarks
     * Before calling this method, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imemallocator-setproperties">IMemAllocator::SetProperties</a> method to specify the buffer requirements.
     * 
     * You must call this method before calling the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imemallocator-getbuffer">IMemAllocator::GetBuffer</a> method.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imemallocator-commit
     */
    Commit() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Decommit method releases the buffer memory.
     * @remarks
     * Any threads waiting in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imemallocator-getbuffer">IMemAllocator::GetBuffer</a> method return with an error. Further calls to <b>GetBuffer</b> fail, until the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imemallocator-commit">IMemAllocator::Commit</a> method is called.
     * 
     * The purpose of the <c>Decommit</c> method is to prevent filters from getting any more samples from the allocator. Filters that already hold a reference count on a sample are not affected. After a filter releases a sample and the reference count goes to zero, however, the sample is no longer available.
     * 
     * The allocator may free the memory belonging to any sample with a reference count of zero. Thus, the <c>Decommit</c> method "releases" the memory in the sense that filters stop having access to it. Whether the memory actually returns to the heap depends on the implementation of the allocator. Some allocators wait until their own destructor method. However, an allocator must not leave any allocated memory behind when it deletes itself. Therefore, an allocator's destructor must wait until all of its samples are released.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imemallocator-decommit
     */
    Decommit() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * The GetBuffer method retrieves a media sample that contains an empty buffer.
     * @remarks
     * By default, this method blocks until a free sample is available or the allocator is decommitted. If the caller specifies the AM_GBF_NOWAIT flag and no sample is available, the allocator can return immediately with a return value of VFW_E_TIMEOUT. However, allocators are not required to support this flag.
     * 
     * The sample returned in <i>ppBuffer</i> has a valid buffer pointer. The caller is responsible for setting any other properties on the sample, such as the time stamps, the media times, or the sync-point property. (For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imediasample">IMediaSample</a>.)
     * 
     * The <i>pStartTime</i> and <i>pEndTime</i> parameters are not applied to the sample. The allocator might use these values to determine which buffer it retrieves. For example, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/video-renderer-filter">Video Renderer</a> filter uses these values to synchronize switching between DirectDraw surfaces. To set the time stamp on the sample, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediasample-settime">IMediaSample::SetTime</a> method.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imemallocator-commit">IMemAllocator::Commit</a> method before calling this method. This method fails after the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imemallocator-decommit">IMemAllocator::Decommit</a> method is called.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imemallocator-getbuffer
     */
    GetBuffer(pStartTime, pEndTime, dwFlags) {
        pStartTimeMarshal := pStartTime is VarRef ? "int64*" : "ptr"
        pEndTimeMarshal := pEndTime is VarRef ? "int64*" : "ptr"

        result := ComCall(7, this, "ptr*", &ppBuffer := 0, pStartTimeMarshal, pStartTime, pEndTimeMarshal, pEndTime, "uint", dwFlags, "HRESULT")
        return IMediaSample(ppBuffer)
    }

    /**
     * The ReleaseBuffer method releases a media sample.
     * @remarks
     * When a media sample's reference count reaches zero, it calls this method with itself as the <i>pBuffer</i> parameter. This method releases the sample back to the allocator's list of available samples.
     * @param {IMediaSample} pBuffer Pointer to the media sample's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imediasample">IMediaSample</a> interface.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imemallocator-releasebuffer
     */
    ReleaseBuffer(pBuffer) {
        result := ComCall(8, this, "ptr", pBuffer, "HRESULT")
        return result
    }
}
