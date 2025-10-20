#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFVideoSampleAllocator.ahk

/**
 * Allocates video samples for a video media sink with specialized functionality for video capture devices.
 * @remarks
 * 
  * This interface inherits from [IMFVideoSampleAllocator](nn-mfidl-imfvideosampleallocator.md) and provides the [InitializeCaptureSampleAllocator](nf-mfidl-imfvideocapturesampleallocator-initializecapturesampleallocator.md) method with parameters relevant to video capture scenarios.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfvideocapturesampleallocator
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
     * 
     * @param {Integer} cbSampleSize 
     * @param {Integer} cbCaptureMetadataSize 
     * @param {Integer} cbAlignment 
     * @param {Integer} cMinimumSamples 
     * @param {IMFAttributes} pAttributes 
     * @param {IMFMediaType} pMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideocapturesampleallocator-initializecapturesampleallocator
     */
    InitializeCaptureSampleAllocator(cbSampleSize, cbCaptureMetadataSize, cbAlignment, cMinimumSamples, pAttributes, pMediaType) {
        result := ComCall(7, this, "uint", cbSampleSize, "uint", cbCaptureMetadataSize, "uint", cbAlignment, "uint", cMinimumSamples, "ptr", pAttributes, "ptr", pMediaType, "HRESULT")
        return result
    }
}
