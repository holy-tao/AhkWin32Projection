#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaEvent.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Retrieves events from any Media Foundation object that generates events.
 * @remarks
 * 
 * An object that supports this interface maintains a queue of events. The client of the object can retrieve the events either synchronously or asynchronously. The synchronous method is <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-getevent">GetEvent</a>. The asynchronous methods are <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-begingetevent">BeginGetEvent</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-endgetevent">EndGetEvent</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfmediaeventgenerator
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEventGenerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaEventGenerator
     * @type {Guid}
     */
    static IID => Guid("{2cd0bd52-bcd5-4b89-b62c-eadc0c031e7d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEvent", "BeginGetEvent", "EndGetEvent", "QueueEvent"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {IMFMediaEvent} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-getevent
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-begingetevent
     */
    BeginGetEvent(pCallback, punkState) {
        result := ComCall(4, this, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAsyncResult} pResult 
     * @returns {IMFMediaEvent} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-endgetevent
     */
    EndGetEvent(pResult) {
        result := ComCall(5, this, "ptr", pResult, "ptr*", &ppEvent := 0, "HRESULT")
        return IMFMediaEvent(ppEvent)
    }

    /**
     * 
     * @param {Integer} met 
     * @param {Pointer<Guid>} guidExtendedType 
     * @param {HRESULT} hrStatus 
     * @param {Pointer<PROPVARIANT>} pvValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmediaeventgenerator-queueevent
     */
    QueueEvent(met, guidExtendedType, hrStatus, pvValue) {
        result := ComCall(6, this, "uint", met, "ptr", guidExtendedType, "int", hrStatus, "ptr", pvValue, "HRESULT")
        return result
    }
}
