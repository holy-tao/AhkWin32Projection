#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Tracks the reference counts on a video media sample.
 * @remarks
 * 
 * Use this interface to determine whether it is safe to delete or re-use the buffer contained in a sample. One object assigns itself as the owner of the video sample by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftrackedsample-setallocator">SetAllocator</a>. When all objects release their reference counts on the sample, the owner's callback method is invoked.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imftrackedsample
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTrackedSample extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTrackedSample
     * @type {Guid}
     */
    static IID => Guid("{245bf8e9-0755-40f7-88a5-ae0f18d55e17}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAllocator"]

    /**
     * 
     * @param {IMFAsyncCallback} pSampleAllocator 
     * @param {IUnknown} pUnkState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftrackedsample-setallocator
     */
    SetAllocator(pSampleAllocator, pUnkState) {
        result := ComCall(3, this, "ptr", pSampleAllocator, "ptr", pUnkState, "HRESULT")
        return result
    }
}
