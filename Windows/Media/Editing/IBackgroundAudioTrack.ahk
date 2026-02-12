#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\BackgroundAudioTrack.ahk
#Include ..\MediaProperties\AudioEncodingProperties.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\Effects\IAudioEffectDefinition.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Editing
 * @version WindowsRuntime 1.4
 */
class IBackgroundAudioTrack extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundAudioTrack
     * @type {Guid}
     */
    static IID => Guid("{4b91b3bd-9e21-4266-a9c2-67dd011a2357}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TrimTimeFromStart", "put_TrimTimeFromStart", "get_TrimTimeFromEnd", "put_TrimTimeFromEnd", "get_OriginalDuration", "get_TrimmedDuration", "get_UserData", "put_Delay", "get_Delay", "put_Volume", "get_Volume", "Clone", "GetAudioEncodingProperties", "get_AudioEffectDefinitions"]

    /**
     * @type {TimeSpan} 
     */
    TrimTimeFromStart {
        get => this.get_TrimTimeFromStart()
        set => this.put_TrimTimeFromStart(value)
    }

    /**
     * @type {TimeSpan} 
     */
    TrimTimeFromEnd {
        get => this.get_TrimTimeFromEnd()
        set => this.put_TrimTimeFromEnd(value)
    }

    /**
     * @type {TimeSpan} 
     */
    OriginalDuration {
        get => this.get_OriginalDuration()
    }

    /**
     * @type {TimeSpan} 
     */
    TrimmedDuration {
        get => this.get_TrimmedDuration()
    }

    /**
     * @type {IMap<HSTRING, HSTRING>} 
     */
    UserData {
        get => this.get_UserData()
    }

    /**
     * @type {TimeSpan} 
     */
    Delay {
        get => this.get_Delay()
        set => this.put_Delay(value)
    }

    /**
     * @type {Float} 
     */
    Volume {
        get => this.get_Volume()
        set => this.put_Volume(value)
    }

    /**
     * @type {IVector<IAudioEffectDefinition>} 
     */
    AudioEffectDefinitions {
        get => this.get_AudioEffectDefinitions()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TrimTimeFromStart() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_TrimTimeFromStart(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TrimTimeFromEnd() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_TrimTimeFromEnd(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_OriginalDuration() {
        value := TimeSpan()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TrimmedDuration() {
        value := TimeSpan()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_UserData() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Delay(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Delay() {
        value := TimeSpan()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Volume(value) {
        result := ComCall(15, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Volume() {
        result := ComCall(16, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Clone Method Example (VC++)
     * @returns {BackgroundAudioTrack} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/clone-method-example-vc
     */
    Clone() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BackgroundAudioTrack(value)
    }

    /**
     * 
     * @returns {AudioEncodingProperties} 
     */
    GetAudioEncodingProperties() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioEncodingProperties(value)
    }

    /**
     * 
     * @returns {IVector<IAudioEffectDefinition>} 
     */
    get_AudioEffectDefinitions() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(IAudioEffectDefinition, value)
    }
}
