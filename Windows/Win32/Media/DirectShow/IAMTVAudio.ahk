#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMTVAudio interface controls audio from a television source. The TV Audio filter implements this interface. Applications can use it to control television audio settings, including secondary audio program (SAP) and stereo or mono selection.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamtvaudio
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMTVAudio extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMTVAudio
     * @type {Guid}
     */
    static IID => Guid("{83ec1c30-23d1-11d1-99e6-00a0c9560266}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHardwareSupportedTVAudioModes", "GetAvailableTVAudioModes", "get_TVAudioMode", "put_TVAudioMode", "RegisterNotificationCallBack", "UnRegisterNotificationCallBack"]

    /**
     * 
     * @param {Pointer<Integer>} plModes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvaudio-gethardwaresupportedtvaudiomodes
     */
    GetHardwareSupportedTVAudioModes(plModes) {
        plModesMarshal := plModes is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, plModesMarshal, plModes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plModes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvaudio-getavailabletvaudiomodes
     */
    GetAvailableTVAudioModes(plModes) {
        plModesMarshal := plModes is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, plModesMarshal, plModes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvaudio-get_tvaudiomode
     */
    get_TVAudioMode(plMode) {
        plModeMarshal := plMode is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, plModeMarshal, plMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvaudio-put_tvaudiomode
     */
    put_TVAudioMode(lMode) {
        result := ComCall(6, this, "int", lMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAMTunerNotification} pNotify 
     * @param {Integer} lEvents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvaudio-registernotificationcallback
     */
    RegisterNotificationCallBack(pNotify, lEvents) {
        result := ComCall(7, this, "ptr", pNotify, "int", lEvents, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAMTunerNotification} pNotify 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvaudio-unregisternotificationcallback
     */
    UnRegisterNotificationCallBack(pNotify) {
        result := ComCall(8, this, "ptr", pNotify, "HRESULT")
        return result
    }
}
