#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by video capture sources and transforms. Allows the system to provide components with a sample allocator to allocate samples using memory that is accessible from within a container.
 * @remarks
 * Components that do not implement this interface, or do not use the allocator provided by the system, can still allocate samples, but when running from inside a container, the system will have to copy all samples into container memory, which is less efficient.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfsampleallocatorcontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSampleAllocatorControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSampleAllocatorControl
     * @type {Guid}
     */
    static IID => Guid("{da62b958-3a38-4a97-bd27-149c640c0771}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDefaultAllocator", "GetAllocatorUsage"]

    /**
     * Sets the default sample allocator to use for the specified output stream.
     * @remarks
     * The system calls this method to provide components with a sample allocator that allows the component to allocate samples using memory that is accessible from within a container.
     * 
     * Components that use the provided allocator should return [MFSampleAllocatorUsage_UsesProvidedAllocator](ne-mfidl-mfsampleallocatorusage.md) from calls to [IMFSampleAllocatorControl::GetAllocatorUsage](nf-mfidl-imfsampleallocatorcontrol-setdefaultallocator.md).
     * @param {Integer} dwOutputStreamID The ID of the output stream that the *pAllocator* parameter applies to.
     * @param {IUnknown} pAllocator Receives a pointer to a sample allocator to use for the specified output stream. The
     * allocator supports one of the MF allocator interfaces, such as [IMFVideoCaptureSampleAllocator](nn-mfidl-imfvideocapturesampleallocator.md) or [IMFVideoSampleAllocatorEx](nn-mfidl-imfvideosampleallocatorex.md).
     * @returns {HRESULT} The method returns an **HRESULT**.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfsampleallocatorcontrol-setdefaultallocator
     */
    SetDefaultAllocator(dwOutputStreamID, pAllocator) {
        result := ComCall(3, this, "uint", dwOutputStreamID, "ptr", pAllocator, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the sample allocator usage for the specified output stream.
     * @param {Integer} dwOutputStreamID The ID of the output stream whose sample allocator usage is requested.
     * @param {Pointer<Integer>} pdwInputStreamID If the allocator usage is [MFSampleAllocatorUsage_DoesNotAllocate](ne-mfidl-mfsampleallocatorusage.md), then this output parameter is set to the ID of the input stream that the output samples are coming from. For all other allocator usage values, this parameter is ignored.
     * @param {Pointer<Integer>} peUsage A member of the [MFSampleAllocatorUsage](ne-mfidl-mfsampleallocatorusage.md) enumeration specifying the sample allocator usage of the specified output stream.
     * @returns {HRESULT} The method returns an **HRESULT**.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfsampleallocatorcontrol-getallocatorusage
     */
    GetAllocatorUsage(dwOutputStreamID, pdwInputStreamID, peUsage) {
        pdwInputStreamIDMarshal := pdwInputStreamID is VarRef ? "uint*" : "ptr"
        peUsageMarshal := peUsage is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "uint", dwOutputStreamID, pdwInputStreamIDMarshal, pdwInputStreamID, peUsageMarshal, peUsage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
