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
     * 
     * @param {Integer} lChannel 
     * @param {Integer} lVideoSubChannel 
     * @param {Integer} lAudioSubChannel 
     * @returns {HRESULT} 
     */
    put_Channel(lChannel, lVideoSubChannel, lAudioSubChannel) {
        result := ComCall(3, this, "int", lChannel, "int", lVideoSubChannel, "int", lAudioSubChannel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plChannel 
     * @param {Pointer<Int32>} plVideoSubChannel 
     * @param {Pointer<Int32>} plAudioSubChannel 
     * @returns {HRESULT} 
     */
    get_Channel(plChannel, plVideoSubChannel, plAudioSubChannel) {
        result := ComCall(4, this, "int*", plChannel, "int*", plVideoSubChannel, "int*", plAudioSubChannel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lChannelMin 
     * @param {Pointer<Int32>} lChannelMax 
     * @returns {HRESULT} 
     */
    ChannelMinMax(lChannelMin, lChannelMax) {
        result := ComCall(5, this, "int*", lChannelMin, "int*", lChannelMax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lCountryCode 
     * @returns {HRESULT} 
     */
    put_CountryCode(lCountryCode) {
        result := ComCall(6, this, "int", lCountryCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCountryCode 
     * @returns {HRESULT} 
     */
    get_CountryCode(plCountryCode) {
        result := ComCall(7, this, "int*", plCountryCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lTuningSpace 
     * @returns {HRESULT} 
     */
    put_TuningSpace(lTuningSpace) {
        result := ComCall(8, this, "int", lTuningSpace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plTuningSpace 
     * @returns {HRESULT} 
     */
    get_TuningSpace(plTuningSpace) {
        result := ComCall(9, this, "int*", plTuningSpace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hCurrentUser 
     * @returns {HRESULT} 
     */
    Logon(hCurrentUser) {
        hCurrentUser := hCurrentUser is Win32Handle ? NumGet(hCurrentUser, "ptr") : hCurrentUser

        result := ComCall(10, this, "ptr", hCurrentUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Logout() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plSignalStrength 
     * @returns {HRESULT} 
     */
    SignalPresent(plSignalStrength) {
        result := ComCall(12, this, "int*", plSignalStrength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lMode 
     * @returns {HRESULT} 
     */
    put_Mode(lMode) {
        result := ComCall(13, this, "int", lMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMode 
     * @returns {HRESULT} 
     */
    get_Mode(plMode) {
        result := ComCall(14, this, "int*", plMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plModes 
     * @returns {HRESULT} 
     */
    GetAvailableModes(plModes) {
        result := ComCall(15, this, "int*", plModes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAMTunerNotification>} pNotify 
     * @param {Integer} lEvents 
     * @returns {HRESULT} 
     */
    RegisterNotificationCallBack(pNotify, lEvents) {
        result := ComCall(16, this, "ptr", pNotify, "int", lEvents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAMTunerNotification>} pNotify 
     * @returns {HRESULT} 
     */
    UnRegisterNotificationCallBack(pNotify) {
        result := ComCall(17, this, "ptr", pNotify, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
