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
     * Note  The IBPCSatelliteTuner interface is deprecated. Gets the default sub-channel types.
     * @param {Pointer<Integer>} plDefaultVideoType Receives a provider-specific service type for video.
     * @param {Pointer<Integer>} plDefaultAudioType Receives a provider-specific service type for audio.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ibpcsatellitetuner-get_defaultsubchanneltypes
     */
    get_DefaultSubChannelTypes(plDefaultVideoType, plDefaultAudioType) {
        plDefaultVideoTypeMarshal := plDefaultVideoType is VarRef ? "int*" : "ptr"
        plDefaultAudioTypeMarshal := plDefaultAudioType is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, plDefaultVideoTypeMarshal, plDefaultVideoType, plDefaultAudioTypeMarshal, plDefaultAudioType, "HRESULT")
        return result
    }

    /**
     * Note  The IBPCSatelliteTuner interface is deprecated. Sets the default sub-channel types.
     * @param {Integer} lDefaultVideoType Provider-specific service type for video.
     * @param {Integer} lDefaultAudioType Provider-specific service type for audio.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ibpcsatellitetuner-put_defaultsubchanneltypes
     */
    put_DefaultSubChannelTypes(lDefaultVideoType, lDefaultAudioType) {
        result := ComCall(19, this, "int", lDefaultVideoType, "int", lDefaultAudioType, "HRESULT")
        return result
    }

    /**
     * Note  The IBPCSatelliteTuner interface is deprecated. Queries whether taping is permitted.
     * @returns {HRESULT} Returns S_OK if taping is permitted or S_FALSE if taping is not permitted.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ibpcsatellitetuner-istapingpermitted
     */
    IsTapingPermitted() {
        result := ComCall(20, this, "HRESULT")
        return result
    }
}
