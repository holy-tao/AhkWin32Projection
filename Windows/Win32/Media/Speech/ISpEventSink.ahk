#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpEventSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpEventSink
     * @type {Guid}
     */
    static IID => Guid("{be7a9cc9-5f9e-11d2-960f-00c04f8ee628}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddEvents", "GetEventInterest"]

    /**
     * 
     * @param {Pointer<SPEVENT>} pEventArray 
     * @param {Integer} ulCount 
     * @returns {HRESULT} 
     */
    AddEvents(pEventArray, ulCount) {
        result := ComCall(3, this, "ptr", pEventArray, "uint", ulCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pullEventInterest 
     * @returns {HRESULT} 
     */
    GetEventInterest(pullEventInterest) {
        pullEventInterestMarshal := pullEventInterest is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pullEventInterestMarshal, pullEventInterest, "HRESULT")
        return result
    }
}
