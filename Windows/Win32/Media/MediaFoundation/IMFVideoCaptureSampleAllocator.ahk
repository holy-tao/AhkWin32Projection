#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFVideoSampleAllocator.ahk

/**
 * Allocates video samples for a video media sink with specialized functionality for video capture devices.
 * @remarks
 * This interface inherits from [IMFVideoSampleAllocator](nn-mfidl-imfvideosampleallocator.md) and provides the [InitializeCaptureSampleAllocator](nf-mfidl-imfvideocapturesampleallocator-initializecapturesampleallocator.md) method with parameters relevant to video capture scenarios.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfvideocapturesampleallocator
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoCaptureSampleAllocator extends IMFVideoSampleAllocator{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFVideoCaptureSampleAllocator
     * @type {Guid}
     */
    static IID => Guid("{725b77c7-ca9f-4fe5-9d72-9946bf9b3c70}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeCaptureSampleAllocator"]

    /**
     * Initializes the sample allocator with parameters relevant to video capture scenarios.
     * @param {Integer} cbSampleSize A DWORD specifying the sample size in bytes. The actual sample size used by the allocator is the maximum of the size required by pMediaType and cbSampleSize.
     * @param {Integer} cbCaptureMetadataSize A DWORD specifying the capture metadata size in bytes. Applies only to callers that want to to include additional metadata with the captured frames. The metadata size should include the size of a [KSCAMERA_METADATA_ITEMHEADER](/windows-hardware/drivers/ddi/ksmedia/ns-ksmedia-tagkscamera_metadata_itemheader) in addition to the size of the metadata payload itself.
     * @param {Integer} cbAlignment A DWORD specifying the buffer alignment size in bytes. The default and minimum alignment size is 4KB. Custom alignment sizes less than 4KB will be treated as 4KB.
     * @param {Integer} cMinimumSamples A DWORD specifying the minimum number of pre-allocated samples. This method will fail if the allocator cannot pre-allocate the specified minimum number of samples.
     * @param {IMFAttributes} pAttributes Optional. An [IMFAttributes](../mfobjects/nn-mfobjects-imfattributes.md) store with additional configuration attributes for the sample allocator. The supported attributes are:
     * 
     * - [MF_SA_BUFFERS_PER_SAMPLE](/windows/win32/medfound/mf-sa-buffers-per-sample)
     * - [MF_SA_D3D11_BINDFLAGS](/windows/win32/medfound/mf-sa-d3d11-bindflags)
     * - [MF_SA_D3D11_USAGE](/windows/win32/medfound/mf-sa-d3d11-usage)
     * - [MF_SA_D3D11_SHARED](/windows/win32/medfound/mf-sa-d3d11-shared)
     * - [MF_SA_D3D11_SHARED_WITHOUT_MUTEX](/windows/win32/medfound/mf-sa-d3d11-shared-without-mutex)
     * @param {IMFMediaType} pMediaType An [IMFMediaType](../mfobjects/nn-mfobjects-imfmediatype.md) specifying the media type for which samples will be allocator. The sample allocator uses this parameter to calculate the minimum required size for the media samples.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * | Return code | Description |
     * |---------------|---------------|
     * | S_OK | The method succeeded. |
     * |MF_E_INVALIDMEDIATYPE | Invalid media type. |
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfvideocapturesampleallocator-initializecapturesampleallocator
     */
    InitializeCaptureSampleAllocator(cbSampleSize, cbCaptureMetadataSize, cbAlignment, cMinimumSamples, pAttributes, pMediaType) {
        result := ComCall(7, this, "uint", cbSampleSize, "uint", cbCaptureMetadataSize, "uint", cbAlignment, "uint", cMinimumSamples, "ptr", pAttributes, "ptr", pMediaType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
