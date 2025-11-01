#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpEventSink.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpTTSEngineSite extends ISpEventSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpTTSEngineSite
     * @type {Guid}
     */
    static IID => Guid("{9880499b-cce9-11d2-b503-00c04f797396}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetActions", "Write", "GetRate", "GetVolume", "GetSkipInfo", "CompleteSkip"]

    /**
     * 
     * @returns {Integer} 
     */
    GetActions() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pBuff 
     * @param {Integer} cb 
     * @param {Pointer<Integer>} pcbWritten 
     * @returns {HRESULT} 
     */
    Write(pBuff, cb, pcbWritten) {
        result := ComCall(6, this, "ptr", pBuff, "uint", cb, "uint*", pcbWritten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRateAdjust 
     * @returns {HRESULT} 
     */
    GetRate(pRateAdjust) {
        result := ComCall(7, this, "int*", pRateAdjust, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pusVolume 
     * @returns {HRESULT} 
     */
    GetVolume(pusVolume) {
        result := ComCall(8, this, "ushort*", pusVolume, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} peType 
     * @param {Pointer<Integer>} plNumItems 
     * @returns {HRESULT} 
     */
    GetSkipInfo(peType, plNumItems) {
        result := ComCall(9, this, "int*", peType, "int*", plNumItems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulNumSkipped 
     * @returns {HRESULT} 
     */
    CompleteSkip(ulNumSkipped) {
        result := ComCall(10, this, "int", ulNumSkipped, "HRESULT")
        return result
    }
}
