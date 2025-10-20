#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by video capture sources and transforms. Allows the system to provide components with a sample allocator to allocate samples using memory that is accessible from within a container.
 * @remarks
 * 
  * Components that do not implement this interface, or do not use the allocator provided by the system, can still allocate samples, but when running from inside a container, the system will have to copy all samples into container memory, which is less efficient.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsampleallocatorcontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSampleAllocatorControl extends IUnknown{
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
     * 
     * @param {Integer} dwOutputStreamID 
     * @param {Pointer<IUnknown>} pAllocator 
     * @returns {HRESULT} 
     */
    SetDefaultAllocator(dwOutputStreamID, pAllocator) {
        result := ComCall(3, this, "uint", dwOutputStreamID, "ptr", pAllocator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamID 
     * @param {Pointer<UInt32>} pdwInputStreamID 
     * @param {Pointer<Int32>} peUsage 
     * @returns {HRESULT} 
     */
    GetAllocatorUsage(dwOutputStreamID, pdwInputStreamID, peUsage) {
        result := ComCall(4, this, "uint", dwOutputStreamID, "uint*", pdwInputStreamID, "int*", peUsage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
