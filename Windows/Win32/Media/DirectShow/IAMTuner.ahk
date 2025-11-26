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
     * @type {Integer} 
     */
    CountryCode {
        get => this.get_CountryCode()
        set => this.put_CountryCode(value)
    }

    /**
     * @type {Integer} 
     */
    TuningSpace {
        get => this.get_TuningSpace()
        set => this.put_TuningSpace(value)
    }

    /**
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtuner-get_countrycode
     */
    get_CountryCode() {
        result := ComCall(7, this, "int*", &plCountryCode := 0, "HRESULT")
        return plCountryCode
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtuner-get_tuningspace
     */
    get_TuningSpace() {
        result := ComCall(9, this, "int*", &plTuningSpace := 0, "HRESULT")
        return plTuningSpace
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtuner-signalpresent
     */
    SignalPresent() {
        result := ComCall(12, this, "int*", &plSignalStrength := 0, "HRESULT")
        return plSignalStrength
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtuner-get_mode
     */
    get_Mode() {
        result := ComCall(14, this, "int*", &plMode := 0, "HRESULT")
        return plMode
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtuner-getavailablemodes
     */
    GetAvailableModes() {
        result := ComCall(15, this, "int*", &plModes := 0, "HRESULT")
        return plModes
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
