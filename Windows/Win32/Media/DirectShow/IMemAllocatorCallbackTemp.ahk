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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetNotify", "GetFreeCount"]

    /**
     * 
     * @param {IMemAllocatorNotifyCallbackTemp} pNotify 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imemallocatorcallbacktemp-setnotify
     */
    SetNotify(pNotify) {
        result := ComCall(9, this, "ptr", pNotify, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plBuffersFree 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imemallocatorcallbacktemp-getfreecount
     */
    GetFreeCount(plBuffersFree) {
        result := ComCall(10, this, "int*", plBuffersFree, "HRESULT")
        return result
    }
}
