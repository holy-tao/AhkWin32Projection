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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NotifyRelease"]

    /**
     * The NotifyRelease method is called whenever the allocator's IMemAllocator::ReleaseBuffer method is called. The ReleaseBuffer method returns a media sample to the allocator's free list. Samples call this method when their reference counts reach zero.
     * @returns {HRESULT} Return S_OK or an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imemallocatornotifycallbacktemp-notifyrelease
     */
    NotifyRelease() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
