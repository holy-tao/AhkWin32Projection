#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpNotifySource.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpEventSource extends ISpNotifySource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpEventSource
     * @type {Guid}
     */
    static IID => Guid("{be7a9cce-5f9e-11d2-960f-00c04f8ee628}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetInterest", "GetEvents", "GetInfo"]

    /**
     * 
     * @param {Integer} ullEventInterest 
     * @param {Integer} ullQueuedInterest 
     * @returns {HRESULT} 
     */
    SetInterest(ullEventInterest, ullQueuedInterest) {
        result := ComCall(10, this, "uint", ullEventInterest, "uint", ullQueuedInterest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<SPEVENT>} pEventArray 
     * @param {Pointer<Integer>} pulFetched 
     * @returns {HRESULT} 
     */
    GetEvents(ulCount, pEventArray, pulFetched) {
        result := ComCall(11, this, "uint", ulCount, "ptr", pEventArray, "uint*", pulFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPEVENTSOURCEINFO>} pInfo 
     * @returns {HRESULT} 
     */
    GetInfo(pInfo) {
        result := ComCall(12, this, "ptr", pInfo, "HRESULT")
        return result
    }
}
