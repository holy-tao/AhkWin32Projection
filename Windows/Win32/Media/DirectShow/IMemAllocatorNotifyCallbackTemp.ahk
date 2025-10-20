#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables a filter to receive a callback notification from an allocator whenever a sample is returned to the allocator's free list.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-imemallocatornotifycallbacktemp
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMemAllocatorNotifyCallbackTemp extends IUnknown{
    /**
     * The interface identifier for IMemAllocatorNotifyCallbackTemp
     * @type {Guid}
     */
    static IID => Guid("{92980b30-c1de-11d2-abf5-00a0c905f375}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyRelease() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
