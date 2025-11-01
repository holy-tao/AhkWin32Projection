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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DefaultSubChannelTypes", "put_DefaultSubChannelTypes", "IsTapingPermitted"]

    /**
     * 
     * @param {Pointer<Integer>} plDefaultVideoType 
     * @param {Pointer<Integer>} plDefaultAudioType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ibpcsatellitetuner-get_defaultsubchanneltypes
     */
    get_DefaultSubChannelTypes(plDefaultVideoType, plDefaultAudioType) {
        result := ComCall(18, this, "int*", plDefaultVideoType, "int*", plDefaultAudioType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lDefaultVideoType 
     * @param {Integer} lDefaultAudioType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ibpcsatellitetuner-put_defaultsubchanneltypes
     */
    put_DefaultSubChannelTypes(lDefaultVideoType, lDefaultAudioType) {
        result := ComCall(19, this, "int", lDefaultVideoType, "int", lDefaultAudioType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ibpcsatellitetuner-istapingpermitted
     */
    IsTapingPermitted() {
        result := ComCall(20, this, "HRESULT")
        return result
    }
}
