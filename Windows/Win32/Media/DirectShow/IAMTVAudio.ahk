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
     * @type {Integer} 
     */
    TVAudioMode {
        get => this.get_TVAudioMode()
        set => this.put_TVAudioMode(value)
    }

    /**
     * The GetHardwareSupportedTVAudioModes method retrieves a bitmask of the formats available in the hardware.
     * @returns {Integer} Pointer to a [TVAudioMode](/windows/desktop/api/strmif/ne-strmif-tvaudiomode) enumeration value that identifies the audio mode.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtvaudio-gethardwaresupportedtvaudiomodes
     */
    GetHardwareSupportedTVAudioModes() {
        result := ComCall(3, this, "int*", &plModes := 0, "HRESULT")
        return plModes
    }

    /**
     * The GetAvailableTVAudioModes method retrieves a bitmask of the possible modes.
     * @returns {Integer} Pointer to a [TVAudioMode](/windows/desktop/api/strmif/ne-strmif-tvaudiomode) enumeration type, identifying the audio mode.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtvaudio-getavailabletvaudiomodes
     */
    GetAvailableTVAudioModes() {
        result := ComCall(4, this, "int*", &plModes := 0, "HRESULT")
        return plModes
    }

    /**
     * The get_TVAudioMode method retrieves the current TV audio mode.
     * @returns {Integer} Pointer to a [TVAudioMode](/windows/desktop/api/strmif/ne-strmif-tvaudiomode) enumeration type, identifying the audio mode.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtvaudio-get_tvaudiomode
     */
    get_TVAudioMode() {
        result := ComCall(5, this, "int*", &plMode := 0, "HRESULT")
        return plMode
    }

    /**
     * The put_TVAudioMode method sets the current TV audio mode.
     * @param {Integer} lMode A [TVAudioMode](/windows/desktop/api/strmif/ne-strmif-tvaudiomode) enumeration value that identifies the audio mode.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation. <b>HRESULT</b> can be one of the following standard constants, or other values not listed.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method isn't supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK or NOERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtvaudio-put_tvaudiomode
     */
    put_TVAudioMode(lMode) {
        result := ComCall(6, this, "int", lMode, "HRESULT")
        return result
    }

    /**
     * The RegisterNotificationCallBack method enables an object that implements the IAMTunerNotification interface to receive event notifications when the tuner changes state.
     * @param {IAMTunerNotification} pNotify Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamtunernotification">IAMTunerNotification</a> interface that will receive the event notifications.
     * @param {Integer} lEvents Flag indicating that an event has occurred.
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtvaudio-registernotificationcallback
     */
    RegisterNotificationCallBack(pNotify, lEvents) {
        result := ComCall(7, this, "ptr", pNotify, "int", lEvents, "HRESULT")
        return result
    }

    /**
     * The UnRegisterNotificationCallBack method unregisters an object for event notifications.
     * @param {IAMTunerNotification} pNotify Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamtunernotification">IAMTunerNotification</a> interface that was specified in a previous call to <b>RegisterNotificationCallBack</b>.
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtvaudio-unregisternotificationcallback
     */
    UnRegisterNotificationCallBack(pNotify) {
        result := ComCall(8, this, "ptr", pNotify, "HRESULT")
        return result
    }
}
