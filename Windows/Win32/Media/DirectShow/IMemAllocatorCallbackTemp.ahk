#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMemAllocator.ahk

/**
 * The IMemAllocatorCallbackTemp interface enables a filter to receive a callback notification from an allocator whenever a sample is returned to the allocator's free list.The use of this interface is deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-imemallocatorcallbacktemp
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMemAllocatorCallbackTemp extends IMemAllocator{
    /**
     * The interface identifier for IMemAllocatorCallbackTemp
     * @type {Guid}
     */
    static IID => Guid("{379a0cf0-c1de-11d2-abf5-00a0c905f375}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * 
     * @param {Pointer<IMemAllocatorNotifyCallbackTemp>} pNotify 
     * @returns {HRESULT} 
     */
    SetNotify(pNotify) {
        result := ComCall(9, this, "ptr", pNotify, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plBuffersFree 
     * @returns {HRESULT} 
     */
    GetFreeCount(plBuffersFree) {
        result := ComCall(10, this, "int*", plBuffersFree, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
