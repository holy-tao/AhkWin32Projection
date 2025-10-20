#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAMTuner.ahk

/**
 * Note  This interface is not implemented and has been deprecated. The IBPCSatelliteTuner interface supports satellite television tuning.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ibpcsatellitetuner
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBPCSatelliteTuner extends IAMTuner{
    /**
     * The interface identifier for IBPCSatelliteTuner
     * @type {Guid}
     */
    static IID => Guid("{211a8765-03ac-11d1-8d13-00aa00bd8339}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * 
     * @param {Pointer<Int32>} plDefaultVideoType 
     * @param {Pointer<Int32>} plDefaultAudioType 
     * @returns {HRESULT} 
     */
    get_DefaultSubChannelTypes(plDefaultVideoType, plDefaultAudioType) {
        result := ComCall(18, this, "int*", plDefaultVideoType, "int*", plDefaultAudioType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lDefaultVideoType 
     * @param {Integer} lDefaultAudioType 
     * @returns {HRESULT} 
     */
    put_DefaultSubChannelTypes(lDefaultVideoType, lDefaultAudioType) {
        result := ComCall(19, this, "int", lDefaultVideoType, "int", lDefaultAudioType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsTapingPermitted() {
        result := ComCall(20, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
