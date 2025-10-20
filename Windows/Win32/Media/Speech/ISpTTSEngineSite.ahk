#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpEventSink.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpTTSEngineSite extends ISpEventSink{
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
     * @param {Pointer<UInt32>} pcbWritten 
     * @returns {HRESULT} 
     */
    Write(pBuff, cb, pcbWritten) {
        result := ComCall(6, this, "ptr", pBuff, "uint", cb, "uint*", pcbWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRateAdjust 
     * @returns {HRESULT} 
     */
    GetRate(pRateAdjust) {
        result := ComCall(7, this, "int*", pRateAdjust, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pusVolume 
     * @returns {HRESULT} 
     */
    GetVolume(pusVolume) {
        result := ComCall(8, this, "ushort*", pusVolume, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} peType 
     * @param {Pointer<Int32>} plNumItems 
     * @returns {HRESULT} 
     */
    GetSkipInfo(peType, plNumItems) {
        result := ComCall(9, this, "int*", peType, "int*", plNumItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulNumSkipped 
     * @returns {HRESULT} 
     */
    CompleteSkip(ulNumSkipped) {
        result := ComCall(10, this, "int", ulNumSkipped, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
