#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\SimpleHapticsControllerFeedback.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Haptics
 * @version WindowsRuntime 1.4
 */
class ISimpleHapticsController extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISimpleHapticsController
     * @type {Guid}
     */
    static IID => Guid("{3d577ef9-4cee-11e6-b535-001bdc06ab3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_SupportedFeedback", "get_IsIntensitySupported", "get_IsPlayCountSupported", "get_IsPlayDurationSupported", "get_IsReplayPauseIntervalSupported", "StopFeedback", "SendHapticFeedback", "SendHapticFeedbackWithIntensity", "SendHapticFeedbackForDuration", "SendHapticFeedbackForPlayCount"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {IVectorView<SimpleHapticsControllerFeedback>} 
     */
    SupportedFeedback {
        get => this.get_SupportedFeedback()
    }

    /**
     * @type {Boolean} 
     */
    IsIntensitySupported {
        get => this.get_IsIntensitySupported()
    }

    /**
     * @type {Boolean} 
     */
    IsPlayCountSupported {
        get => this.get_IsPlayCountSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsPlayDurationSupported {
        get => this.get_IsPlayDurationSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsReplayPauseIntervalSupported {
        get => this.get_IsReplayPauseIntervalSupported()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<SimpleHapticsControllerFeedback>} 
     */
    get_SupportedFeedback() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(SimpleHapticsControllerFeedback, value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIntensitySupported() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPlayCountSupported() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPlayDurationSupported() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReplayPauseIntervalSupported() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopFeedback() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SimpleHapticsControllerFeedback} feedback 
     * @returns {HRESULT} 
     */
    SendHapticFeedback(feedback) {
        result := ComCall(13, this, "ptr", feedback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SimpleHapticsControllerFeedback} feedback 
     * @param {Float} intensity 
     * @returns {HRESULT} 
     */
    SendHapticFeedbackWithIntensity(feedback, intensity) {
        result := ComCall(14, this, "ptr", feedback, "double", intensity, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SimpleHapticsControllerFeedback} feedback 
     * @param {Float} intensity 
     * @param {TimeSpan} playDuration 
     * @returns {HRESULT} 
     */
    SendHapticFeedbackForDuration(feedback, intensity, playDuration) {
        result := ComCall(15, this, "ptr", feedback, "double", intensity, "ptr", playDuration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SimpleHapticsControllerFeedback} feedback 
     * @param {Float} intensity 
     * @param {Integer} playCount 
     * @param {TimeSpan} replayPauseInterval 
     * @returns {HRESULT} 
     */
    SendHapticFeedbackForPlayCount(feedback, intensity, playCount, replayPauseInterval) {
        result := ComCall(16, this, "ptr", feedback, "double", intensity, "int", playCount, "ptr", replayPauseInterval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
