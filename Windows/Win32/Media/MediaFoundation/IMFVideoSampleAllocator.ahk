#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFSample.ahk" { IMFSample }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFMediaType.ahk" { IMFMediaType }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Allocates video samples for a video media sink.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfvideosampleallocator
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFVideoSampleAllocator extends IUnknown {
    /**
     * The interface identifier for IMFVideoSampleAllocator
     * @type {Guid}
     */
    static IID := Guid("{86cbc910-e533-4751-8e3b-f19b5b806a03}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFVideoSampleAllocator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDirectXManager           : IntPtr
        UninitializeSampleAllocator : IntPtr
        InitializeSampleAllocator   : IntPtr
        AllocateSample              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFVideoSampleAllocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies the Direct3D device manager for the video media sink to use.
     * @remarks
     * The media sink uses the Direct3D device manager to obtain a pointer to the Direct3D device, which it uses to allocate Direct3D surfaces. The device manager enables multiple objects in the pipeline (such as a video renderer and a video decoder) to share the same Direct3D device.
     * @param {IUnknown} pManager Pointer to the <b>IUnknown</b> interface of the Direct3D device manager. The media sink queries this pointer for the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirect3ddevicemanager9">IDirect3DDeviceManager9</a> interface.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideosampleallocator-setdirectxmanager
     */
    SetDirectXManager(pManager) {
        result := ComCall(3, this, "ptr", pManager, "HRESULT")
        return result
    }

    /**
     * Releases all of the video samples that have been allocated.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideosampleallocator-uninitializesampleallocator
     */
    UninitializeSampleAllocator() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Specifies the number of samples to allocate and the media type for the samples.
     * @param {Integer} cRequestedFrames Number of samples to allocate.
     * @param {IMFMediaType} pMediaType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of a media type that describes the video format.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
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
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDMEDIATYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid media type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideosampleallocator-initializesampleallocator
     */
    InitializeSampleAllocator(cRequestedFrames, pMediaType) {
        result := ComCall(5, this, "uint", cRequestedFrames, "ptr", pMediaType, "HRESULT")
        return result
    }

    /**
     * Gets a video sample from the allocator.
     * @returns {IMFSample} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideosampleallocator-allocatesample
     */
    AllocateSample() {
        result := ComCall(6, this, "ptr*", &ppSample := 0, "HRESULT")
        return IMFSample(ppSample)
    }

    Query(iid) {
        if (IMFVideoSampleAllocator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDirectXManager := CallbackCreate(GetMethod(implObj, "SetDirectXManager"), flags, 2)
        this.vtbl.UninitializeSampleAllocator := CallbackCreate(GetMethod(implObj, "UninitializeSampleAllocator"), flags, 1)
        this.vtbl.InitializeSampleAllocator := CallbackCreate(GetMethod(implObj, "InitializeSampleAllocator"), flags, 3)
        this.vtbl.AllocateSample := CallbackCreate(GetMethod(implObj, "AllocateSample"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDirectXManager)
        CallbackFree(this.vtbl.UninitializeSampleAllocator)
        CallbackFree(this.vtbl.InitializeSampleAllocator)
        CallbackFree(this.vtbl.AllocateSample)
    }
}
