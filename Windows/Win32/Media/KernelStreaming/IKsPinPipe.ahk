#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsPinPipe extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKsPinPipe
     * @type {Guid}
     */
    static IID => Guid("{e539cd90-a8b4-11d1-8189-00a0c9062802}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["KsGetPinFramingCache", "KsSetPinFramingCache", "KsGetConnectedPin", "KsGetPipe", "KsSetPipe", "KsGetPipeAllocatorFlag", "KsSetPipeAllocatorFlag", "KsGetPinBusCache", "KsSetPinBusCache", "KsGetPinName", "KsGetFilterName"]

    /**
     * 
     * @param {Pointer<Pointer<KSALLOCATOR_FRAMING_EX>>} FramingEx 
     * @param {Pointer<Integer>} FramingProp 
     * @param {Integer} Option 
     * @returns {HRESULT} 
     */
    KsGetPinFramingCache(FramingEx, FramingProp, Option) {
        result := ComCall(3, this, "ptr*", FramingEx, "int*", FramingProp, "int", Option, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<KSALLOCATOR_FRAMING_EX>} FramingEx 
     * @param {Pointer<Integer>} FramingProp 
     * @param {Integer} Option 
     * @returns {HRESULT} 
     */
    KsSetPinFramingCache(FramingEx, FramingProp, Option) {
        result := ComCall(4, this, "ptr", FramingEx, "int*", FramingProp, "int", Option, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IPin} 
     */
    KsGetConnectedPin() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Operation 
     * @returns {IKsAllocatorEx} 
     */
    KsGetPipe(Operation) {
        result := ComCall(6, this, "int", Operation, "ptr")
        return result
    }

    /**
     * 
     * @param {IKsAllocatorEx} KsAllocator 
     * @returns {HRESULT} 
     */
    KsSetPipe(KsAllocator) {
        result := ComCall(7, this, "ptr", KsAllocator, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    KsGetPipeAllocatorFlag() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} Flag 
     * @returns {HRESULT} 
     */
    KsSetPipeAllocatorFlag(Flag) {
        result := ComCall(9, this, "uint", Flag, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Guid} 
     */
    KsGetPinBusCache() {
        result := ComCall(10, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Guid} Bus 
     * @returns {HRESULT} 
     */
    KsSetPinBusCache(Bus) {
        result := ComCall(11, this, "ptr", Bus, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    KsGetPinName() {
        result := ComCall(12, this, "char*")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    KsGetFilterName() {
        result := ComCall(13, this, "char*")
        return result
    }
}
