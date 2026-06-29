#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\MFSampleAllocatorUsage.ahk" { MFSampleAllocatorUsage }

/**
 * Implemented by video capture sources and transforms. Allows the system to provide components with a sample allocator to allocate samples using memory that is accessible from within a container.
 * @remarks
 * Components that do not implement this interface, or do not use the allocator provided by the system, can still allocate samples, but when running from inside a container, the system will have to copy all samples into container memory, which is less efficient.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfsampleallocatorcontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSampleAllocatorControl extends IUnknown {
    /**
     * The interface identifier for IMFSampleAllocatorControl
     * @type {Guid}
     */
    static IID := Guid("{da62b958-3a38-4a97-bd27-149c640c0771}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSampleAllocatorControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDefaultAllocator : IntPtr
        GetAllocatorUsage   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSampleAllocatorControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsampleallocatorcontrol-setdefaultallocator
     */
    SetDefaultAllocator(dwOutputStreamID, pAllocator) {
        result := ComCall(3, this, "uint", dwOutputStreamID, "ptr", pAllocator, "HRESULT")
        return result
    }

    /**
     * Retrieves the sample allocator usage for the specified output stream.
     * @param {Integer} dwOutputStreamID The ID of the output stream whose sample allocator usage is requested.
     * @param {Pointer<Integer>} pdwInputStreamID If the allocator usage is [MFSampleAllocatorUsage_DoesNotAllocate](ne-mfidl-mfsampleallocatorusage.md), then this output parameter is set to the ID of the input stream that the output samples are coming from. For all other allocator usage values, this parameter is ignored.
     * @param {Pointer<MFSampleAllocatorUsage>} peUsage A member of the [MFSampleAllocatorUsage](ne-mfidl-mfsampleallocatorusage.md) enumeration specifying the sample allocator usage of the specified output stream.
     * @returns {HRESULT} The method returns an **HRESULT**.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsampleallocatorcontrol-getallocatorusage
     */
    GetAllocatorUsage(dwOutputStreamID, pdwInputStreamID, peUsage) {
        pdwInputStreamIDMarshal := pdwInputStreamID is VarRef ? "uint*" : "ptr"
        peUsageMarshal := peUsage is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "uint", dwOutputStreamID, pdwInputStreamIDMarshal, pdwInputStreamID, peUsageMarshal, peUsage, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFSampleAllocatorControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDefaultAllocator := CallbackCreate(GetMethod(implObj, "SetDefaultAllocator"), flags, 3)
        this.vtbl.GetAllocatorUsage := CallbackCreate(GetMethod(implObj, "GetAllocatorUsage"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDefaultAllocator)
        CallbackFree(this.vtbl.GetAllocatorUsage)
    }
}
