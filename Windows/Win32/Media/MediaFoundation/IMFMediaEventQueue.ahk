#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaEvent.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides an event queue for applications that need to implement the IMFMediaEventGenerator interface.
 * @remarks
 * 
 * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfmediaeventqueue
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEventQueue extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaEventQueue
     * @type {Guid}
     */
    static IID => Guid("{36f846fc-2256-48b6-b58e-e2b638316581}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEvent", "BeginGetEvent", "EndGetEvent", "QueueEvent", "QueueEventParamVar", "QueueEventParamUnk", "Shutdown"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {IMFMediaEvent} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventqueue-getevent
     */
    GetEvent(dwFlags) {
        result := ComCall(3, this, "uint", dwFlags, "ptr*", &ppEvent := 0, "HRESULT")
        return IMFMediaEvent(ppEvent)
    }

    /**
     * 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} punkState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventqueue-begingetevent
     */
    BeginGetEvent(pCallback, punkState) {
        result := ComCall(4, this, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAsyncResult} pResult 
     * @returns {IMFMediaEvent} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventqueue-endgetevent
     */
    EndGetEvent(pResult) {
        result := ComCall(5, this, "ptr", pResult, "ptr*", &ppEvent := 0, "HRESULT")
        return IMFMediaEvent(ppEvent)
    }

    /**
     * 
     * @param {IMFMediaEvent} pEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventqueue-queueevent
     */
    QueueEvent(pEvent) {
        result := ComCall(6, this, "ptr", pEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} met 
     * @param {Pointer<Guid>} guidExtendedType 
     * @param {HRESULT} hrStatus 
     * @param {Pointer<PROPVARIANT>} pvValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventqueue-queueeventparamvar
     */
    QueueEventParamVar(met, guidExtendedType, hrStatus, pvValue) {
        result := ComCall(7, this, "uint", met, "ptr", guidExtendedType, "int", hrStatus, "ptr", pvValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} met 
     * @param {Pointer<Guid>} guidExtendedType 
     * @param {HRESULT} hrStatus 
     * @param {IUnknown} pUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventqueue-queueeventparamunk
     */
    QueueEventParamUnk(met, guidExtendedType, hrStatus, pUnk) {
        result := ComCall(8, this, "uint", met, "ptr", guidExtendedType, "int", hrStatus, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventqueue-shutdown
     */
    Shutdown() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
