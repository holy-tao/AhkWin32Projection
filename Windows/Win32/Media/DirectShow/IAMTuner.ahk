#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMTuner interface controls a TV tuner.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamtuner
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMTuner extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMTuner
     * @type {Guid}
     */
    static IID => Guid("{211a8761-03ac-11d1-8d13-00aa00bd8339}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Channel", "get_Channel", "ChannelMinMax", "put_CountryCode", "get_CountryCode", "put_TuningSpace", "get_TuningSpace", "Logon", "Logout", "SignalPresent", "put_Mode", "get_Mode", "GetAvailableModes", "RegisterNotificationCallBack", "UnRegisterNotificationCallBack"]

    /**
     * 
     * @param {Integer} lChannel 
     * @param {Integer} lVideoSubChannel 
     * @param {Integer} lAudioSubChannel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtuner-put_channel
     */
    put_Channel(lChannel, lVideoSubChannel, lAudioSubChannel) {
        result := ComCall(3, this, "int", lChannel, "int", lVideoSubChannel, "int", lAudioSubChannel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plChannel 
     * @param {Pointer<Integer>} plVideoSubChannel 
     * @param {Pointer<Integer>} plAudioSubChannel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtuner-get_channel
     */
    get_Channel(plChannel, plVideoSubChannel, plAudioSubChannel) {
        plChannelMarshal := plChannel is VarRef ? "int*" : "ptr"
        plVideoSubChannelMarshal := plVideoSubChannel is VarRef ? "int*" : "ptr"
        plAudioSubChannelMarshal := plAudioSubChannel is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, plChannelMarshal, plChannel, plVideoSubChannelMarshal, plVideoSubChannel, plAudioSubChannelMarshal, plAudioSubChannel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lChannelMin 
     * @param {Pointer<Integer>} lChannelMax 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtuner-channelminmax
     */
    ChannelMinMax(lChannelMin, lChannelMax) {
        lChannelMinMarshal := lChannelMin is VarRef ? "int*" : "ptr"
        lChannelMaxMarshal := lChannelMax is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, lChannelMinMarshal, lChannelMin, lChannelMaxMarshal, lChannelMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lCountryCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtuner-put_countrycode
     */
    put_CountryCode(lCountryCode) {
        result := ComCall(6, this, "int", lCountryCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCountryCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtuner-get_countrycode
     */
    get_CountryCode(plCountryCode) {
        plCountryCodeMarshal := plCountryCode is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plCountryCodeMarshal, plCountryCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lTuningSpace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtuner-put_tuningspace
     */
    put_TuningSpace(lTuningSpace) {
        result := ComCall(8, this, "int", lTuningSpace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plTuningSpace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtuner-get_tuningspace
     */
    get_TuningSpace(plTuningSpace) {
        plTuningSpaceMarshal := plTuningSpace is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plTuningSpaceMarshal, plTuningSpace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hCurrentUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtuner-logon
     */
    Logon(hCurrentUser) {
        hCurrentUser := hCurrentUser is Win32Handle ? NumGet(hCurrentUser, "ptr") : hCurrentUser

        result := ComCall(10, this, "ptr", hCurrentUser, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtuner-logout
     */
    Logout() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plSignalStrength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtuner-signalpresent
     */
    SignalPresent(plSignalStrength) {
        plSignalStrengthMarshal := plSignalStrength is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, plSignalStrengthMarshal, plSignalStrength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtuner-put_mode
     */
    put_Mode(lMode) {
        result := ComCall(13, this, "int", lMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtuner-get_mode
     */
    get_Mode(plMode) {
        plModeMarshal := plMode is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, plModeMarshal, plMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plModes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtuner-getavailablemodes
     */
    GetAvailableModes(plModes) {
        plModesMarshal := plModes is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, plModesMarshal, plModes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAMTunerNotification} pNotify 
     * @param {Integer} lEvents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtuner-registernotificationcallback
     */
    RegisterNotificationCallBack(pNotify, lEvents) {
        result := ComCall(16, this, "ptr", pNotify, "int", lEvents, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAMTunerNotification} pNotify 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtuner-unregisternotificationcallback
     */
    UnRegisterNotificationCallBack(pNotify) {
        result := ComCall(17, this, "ptr", pNotify, "HRESULT")
        return result
    }
}
