#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\IKsAllocator.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsAllocatorEx extends IKsAllocator{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKsAllocatorEx
     * @type {Guid}
     */
    static IID => Guid("{091bb63a-603f-11d1-b067-00a0c9062802}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["KsGetProperties", "KsSetProperties", "KsSetAllocatorHandle", "KsCreateAllocatorAndGetHandle"]

    /**
     * 
     * @returns {Pointer<ALLOCATOR_PROPERTIES_EX>} 
     */
    KsGetProperties() {
        result := ComCall(7, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<ALLOCATOR_PROPERTIES_EX>} param0 
     * @returns {String} Nothing - always returns an empty string
     */
    KsSetProperties(param0) {
        ComCall(8, this, "ptr", param0)
    }

    /**
     * 
     * @param {HANDLE} AllocatorHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    KsSetAllocatorHandle(AllocatorHandle) {
        AllocatorHandle := AllocatorHandle is Win32Handle ? NumGet(AllocatorHandle, "ptr") : AllocatorHandle

        ComCall(9, this, "ptr", AllocatorHandle)
    }

    /**
     * 
     * @param {IKsPin} KsPin 
     * @returns {HANDLE} 
     */
    KsCreateAllocatorAndGetHandle(KsPin) {
        result := ComCall(10, this, "ptr", KsPin, "ptr")
        return result
    }
}
