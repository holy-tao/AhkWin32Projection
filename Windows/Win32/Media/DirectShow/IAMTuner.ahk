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
     * The put_Channel method sets the TV channel.
     * @param {Integer} lChannel TV channel number.
     * @param {Integer} lVideoSubChannel Predefined video subchannel value. Specify AMTUNER_SUBCHAN_NO_TUNE for no tuning or AMTUNER_SUBCHAN_DEFAULT for default subchannel. Meaningful only for satellite broadcasts.
     * @param {Integer} lAudioSubChannel Predefined audio subchannel value. Specify AMTUNER_SUBCHAN_NO_TUNE for no tuning or AMTUNER_SUBCHAN_DEFAULT for default subchannel. Meaningful only for satellite broadcasts.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtuner-put_channel
     */
    put_Channel(lChannel, lVideoSubChannel, lAudioSubChannel) {
        result := ComCall(3, this, "int", lChannel, "int", lVideoSubChannel, "int", lAudioSubChannel, "HRESULT")
        return result
    }

    /**
     * The get_Channel method retrieves the channel to which the tuner is set.
     * @param {Pointer<Integer>} plChannel Pointer to a variable that receives the channel. For frequencies, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/international-analog-tv-tuning">International Analog TV Tuning</a>
     * @param {Pointer<Integer>} plVideoSubChannel Pointer to a variable that receives either the video subchannel, or one of the following flags:
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>AMTUNER_SUBCHAN_DEFAULT</td>
     * <td>Default subchannel</td>
     * </tr>
     * <tr>
     * <td>AMTUNER_SUBCHAN_NO_TUNE</td>
     * <td>No subchannel tuning</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} plAudioSubChannel Pointer to a variable that receives either the audio subchannel, or one of the following flags:
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>AMTUNER_SUBCHAN_DEFAULT</td>
     * <td>Default subchannel</td>
     * </tr>
     * <tr>
     * <td>AMTUNER_SUBCHAN_NO_TUNE</td>
     * <td>No subchannel tuning</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtuner-get_channel
     */
    get_Channel(plChannel, plVideoSubChannel, plAudioSubChannel) {
        plChannelMarshal := plChannel is VarRef ? "int*" : "ptr"
        plVideoSubChannelMarshal := plVideoSubChannel is VarRef ? "int*" : "ptr"
        plAudioSubChannelMarshal := plAudioSubChannel is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, plChannelMarshal, plChannel, plVideoSubChannelMarshal, plVideoSubChannel, plAudioSubChannelMarshal, plAudioSubChannel, "HRESULT")
        return result
    }

    /**
     * The ChannelMinMax method retrieves the highest and lowest channels available.
     * @param {Pointer<Integer>} lChannelMin Pointer to a variable that receives the lowest channel.
     * @param {Pointer<Integer>} lChannelMax Pointer to a variable that receives the highest channel.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtuner-channelminmax
     */
    ChannelMinMax(lChannelMin, lChannelMax) {
        lChannelMinMarshal := lChannelMin is VarRef ? "int*" : "ptr"
        lChannelMaxMarshal := lChannelMax is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, lChannelMinMarshal, lChannelMin, lChannelMaxMarshal, lChannelMax, "HRESULT")
        return result
    }

    /**
     * The put_CountryCode method sets the country/region code to establish the frequency to use.
     * @param {Integer} lCountryCode Value indicating the country/region code.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtuner-put_countrycode
     */
    put_CountryCode(lCountryCode) {
        result := ComCall(6, this, "int", lCountryCode, "HRESULT")
        return result
    }

    /**
     * The get_CountryCode method retrieves the country/region code that establishes the current channel-to-frequency mapping.
     * @returns {Integer} Pointer to a variable that receives the country/region code currently in use by the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/tv-tuner-filter">TV Tuner</a> filter.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtuner-get_countrycode
     */
    get_CountryCode() {
        result := ComCall(7, this, "int*", &plCountryCode := 0, "HRESULT")
        return plCountryCode
    }

    /**
     * The put_TuningSpace method sets a storage index for regional channel-to-frequency mappings.
     * @param {Integer} lTuningSpace Value indicating the current locale.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtuner-put_tuningspace
     */
    put_TuningSpace(lTuningSpace) {
        result := ComCall(8, this, "int", lTuningSpace, "HRESULT")
        return result
    }

    /**
     * The get_TuningSpace method retrieves the tuning space.
     * @returns {Integer} Pointer to a variable that receives the current tuning space.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtuner-get_tuningspace
     */
    get_TuningSpace() {
        result := ComCall(9, this, "int*", &plTuningSpace := 0, "HRESULT")
        return plTuningSpace
    }

    /**
     * The Logon method logs a user onto the system.
     * @param {HANDLE} hCurrentUser Handle to an application-defined data structure that identifies the current user.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtuner-logon
     */
    Logon(hCurrentUser) {
        hCurrentUser := hCurrentUser is Win32Handle ? NumGet(hCurrentUser, "ptr") : hCurrentUser

        result := ComCall(10, this, "ptr", hCurrentUser, "HRESULT")
        return result
    }

    /**
     * The Logout method logs out the current user.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtuner-logout
     */
    Logout() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The SignalPresent method retrieves the strength of the signal on a given channel.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtuner-signalpresent
     */
    SignalPresent() {
        result := ComCall(12, this, "int*", &plSignalStrength := 0, "HRESULT")
        return plSignalStrength
    }

    /**
     * The put_Mode method sets a multifunction tuner to the specified mode.
     * @param {Integer} lMode Flag indicating which mode to switch to. Possible values are defined in the [AMTunerModeType](/windows/desktop/api/strmif/ne-strmif-amtunermodetype) enumeration.
     * 
     * You can also set the mode to digital TV if the card supports it. To do this, define AMTUNER_MODE_DTV with a value of 0x0010.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtuner-put_mode
     */
    put_Mode(lMode) {
        result := ComCall(13, this, "int", lMode, "HRESULT")
        return result
    }

    /**
     * The get_Mode method retrieves the current mode on a multifunction tuner.
     * @returns {Integer} Pointer to a variable that receives a flag indicating the current mode setting. The possible values are defined in the [AMTunerModeType](/windows/desktop/api/strmif/ne-strmif-amtunermodetype) enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtuner-get_mode
     */
    get_Mode() {
        result := ComCall(14, this, "int*", &plMode := 0, "HRESULT")
        return plMode
    }

    /**
     * The GetAvailableModes method retrieves the tuner's supported modes.
     * @returns {Integer} Pointer to a variable that receives any combination of the values as specified in the [AMTunerModeType](/windows/desktop/api/strmif/ne-strmif-amtunermodetype) enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtuner-getavailablemodes
     */
    GetAvailableModes() {
        result := ComCall(15, this, "int*", &plModes := 0, "HRESULT")
        return plModes
    }

    /**
     * The RegisterNotificationCallBack method enables an object to receive event notifications when the tuner changes state.
     * @param {IAMTunerNotification} pNotify Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamtunernotification">IAMTunerNotification</a> interface that will receive the event notifications.
     * @param {Integer} lEvents Flag indicating that an event has occurred.
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtuner-registernotificationcallback
     */
    RegisterNotificationCallBack(pNotify, lEvents) {
        result := ComCall(16, this, "ptr", pNotify, "int", lEvents, "HRESULT")
        return result
    }

    /**
     * The UnRegisterNotificationCallBack method unregisters an object for event notifications.
     * @param {IAMTunerNotification} pNotify Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamtunernotification">IAMTunerNotification</a> interface that was specified in a previous call to <b>RegisterNotificationCallBack</b>.
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtuner-unregisternotificationcallback
     */
    UnRegisterNotificationCallBack(pNotify) {
        result := ComCall(17, this, "ptr", pNotify, "HRESULT")
        return result
    }
}
