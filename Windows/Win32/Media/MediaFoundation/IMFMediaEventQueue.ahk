#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IMFMediaEvent>} ppEvent 
     * @returns {HRESULT} 
     */
    GetEvent(dwFlags, ppEvent) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", ppEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAsyncCallback>} pCallback 
     * @param {Pointer<IUnknown>} punkState 
     * @returns {HRESULT} 
     */
    BeginGetEvent(pCallback, punkState) {
        result := ComCall(4, this, "ptr", pCallback, "ptr", punkState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAsyncResult>} pResult 
     * @param {Pointer<IMFMediaEvent>} ppEvent 
     * @returns {HRESULT} 
     */
    EndGetEvent(pResult, ppEvent) {
        result := ComCall(5, this, "ptr", pResult, "ptr", ppEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaEvent>} pEvent 
     * @returns {HRESULT} 
     */
    QueueEvent(pEvent) {
        result := ComCall(6, this, "ptr", pEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} met 
     * @param {Pointer<Guid>} guidExtendedType 
     * @param {HRESULT} hrStatus 
     * @param {Pointer<PROPVARIANT>} pvValue 
     * @returns {HRESULT} 
     */
    QueueEventParamVar(met, guidExtendedType, hrStatus, pvValue) {
        result := ComCall(7, this, "uint", met, "ptr", guidExtendedType, "int", hrStatus, "ptr", pvValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} met 
     * @param {Pointer<Guid>} guidExtendedType 
     * @param {HRESULT} hrStatus 
     * @param {Pointer<IUnknown>} pUnk 
     * @returns {HRESULT} 
     */
    QueueEventParamUnk(met, guidExtendedType, hrStatus, pUnk) {
        result := ComCall(8, this, "uint", met, "ptr", guidExtendedType, "int", hrStatus, "ptr", pUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Shutdown() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
