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
     * 
     * @param {Integer} dwOutputStreamID 
     * @param {IUnknown} pAllocator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsampleallocatorcontrol-setdefaultallocator
     */
    SetDefaultAllocator(dwOutputStreamID, pAllocator) {
        result := ComCall(3, this, "uint", dwOutputStreamID, "ptr", pAllocator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputStreamID 
     * @param {Pointer<Integer>} pdwInputStreamID 
     * @param {Pointer<Integer>} peUsage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsampleallocatorcontrol-getallocatorusage
     */
    GetAllocatorUsage(dwOutputStreamID, pdwInputStreamID, peUsage) {
        pdwInputStreamIDMarshal := pdwInputStreamID is VarRef ? "uint*" : "ptr"
        peUsageMarshal := peUsage is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "uint", dwOutputStreamID, pdwInputStreamIDMarshal, pdwInputStreamID, peUsageMarshal, peUsage, "HRESULT")
        return result
    }
}
