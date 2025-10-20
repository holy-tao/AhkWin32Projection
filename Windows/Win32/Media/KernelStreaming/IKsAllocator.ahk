#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsAllocator extends IUnknown{
    /**
     * The interface identifier for IKsAllocator
     * @type {Guid}
     */
    static IID => Guid("{8da64899-c0d9-11d0-8413-0000f822fe8a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HANDLE} 
     */
    KsGetAllocatorHandle() {
        result := ComCall(3, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    KsGetAllocatorMode() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KSSTREAMALLOCATOR_STATUS>} AllocatorStatus 
     * @returns {HRESULT} 
     */
    KsGetAllocatorStatus(AllocatorStatus) {
        result := ComCall(5, this, "ptr", AllocatorStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Mode 
     * @returns {String} Nothing - always returns an empty string
     */
    KsSetAllocatorMode(Mode) {
        ComCall(6, this, "int", Mode)
        return result
    }
}
