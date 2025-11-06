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
     * @returns {Integer} 
     */
    Write(pBuff, cb) {
        pBuffMarshal := pBuff is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, pBuffMarshal, pBuff, "uint", cb, "uint*", &pcbWritten := 0, "HRESULT")
        return pcbWritten
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetRate() {
        result := ComCall(7, this, "int*", &pRateAdjust := 0, "HRESULT")
        return pRateAdjust
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetVolume() {
        result := ComCall(8, this, "ushort*", &pusVolume := 0, "HRESULT")
        return pusVolume
    }

    /**
     * 
     * @param {Pointer<Integer>} peType 
     * @param {Pointer<Integer>} plNumItems 
     * @returns {HRESULT} 
     */
    GetSkipInfo(peType, plNumItems) {
        peTypeMarshal := peType is VarRef ? "int*" : "ptr"
        plNumItemsMarshal := plNumItems is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, peTypeMarshal, peType, plNumItemsMarshal, plNumItems, "HRESULT")
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
